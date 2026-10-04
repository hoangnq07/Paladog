# -*- coding: utf-8 -*-
"""
Replace strings directly in ABC (ActionScript ByteCode) constant pool
within the SWF file. This avoids re-compiling AS3 which is EXPERIMENTAL in FFDec.
"""
import zlib
import struct
import sys
import os

def read_swf(path):
    """Read and decompress a CWS SWF file."""
    with open(path, 'rb') as f:
        sig = f.read(3)
        ver = f.read(1)
        file_len = struct.unpack('<I', f.read(4))[0]
        if sig == b'CWS':
            body = zlib.decompress(f.read())
        elif sig == b'FWS':
            body = f.read()
        else:
            raise ValueError(f"Unknown SWF signature: {sig}")
    return sig, ver, file_len, body

def write_swf(path, ver, body):
    """Write a CWS (zlib compressed) SWF file."""
    compressed = zlib.compress(body)
    file_len = 8 + len(body)
    with open(path, 'wb') as f:
        f.write(b'CWS')
        f.write(ver)
        f.write(struct.pack('<I', file_len))
        f.write(compressed)

def parse_rect_size(data):
    """Parse SWF RECT header and return byte size."""
    first_byte = data[0]
    nbits = first_byte >> 3
    total_bits = 5 + nbits * 4
    return (total_bits + 7) // 8

def read_encoded_u32(data, pos):
    """Read a variable-length encoded u32 from ABC data."""
    result = 0
    shift = 0
    for i in range(5):
        b = data[pos]
        pos += 1
        result |= (b & 0x7F) << shift
        if not (b & 0x80):
            break
        shift += 7
    return result, pos

def encode_u32(value):
    """Encode an integer as variable-length u32 for ABC."""
    result = bytearray()
    while True:
        b = value & 0x7F
        value >>= 7
        if value:
            b |= 0x80
        result.append(b)
        if not value:
            break
    return bytes(result)

def find_abc_tags(body):
    """Find all DoABC/DoABC2 tags in the SWF body and return their positions."""
    rect_size = parse_rect_size(body)
    # Skip RECT + frame rate (2 bytes) + frame count (2 bytes)
    pos = rect_size + 4
    
    abc_tags = []
    
    while pos < len(body):
        if pos + 2 > len(body):
            break
        tag_header = struct.unpack('<H', body[pos:pos+2])[0]
        tag_start = pos
        pos += 2
        tag_type = tag_header >> 6
        tag_length = tag_header & 0x3F
        if tag_length == 0x3F:
            tag_length = struct.unpack('<I', body[pos:pos+4])[0]
            pos += 4
        
        tag_data_start = pos
        
        # DoABC2 = 82, DoABC = 72
        if tag_type in (72, 82):
            abc_tags.append({
                'type': tag_type,
                'start': tag_start,
                'data_start': tag_data_start,
                'length': tag_length
            })
        
        pos += tag_length
    
    return abc_tags

def parse_abc_string_pool(abc_data, abc_offset):
    """
    Parse the ABC constant pool and return string entries with their
    positions relative to abc_offset.
    
    ABC format:
    - u16 minor_version
    - u16 major_version
    - Constant pool:
      - u30 int_count, int entries...
      - u30 uint_count, uint entries...
      - u30 double_count, double entries...
      - u30 string_count, string entries (u30 length + utf8 bytes)
    """
    pos = abc_offset
    
    # Skip version
    pos += 4  # minor + major (2 bytes each)
    
    # Skip int pool
    int_count, pos = read_encoded_u32(abc_data, pos)
    if int_count > 1:
        for _ in range(int_count - 1):
            # Read variable-length s32
            _, pos = read_encoded_u32(abc_data, pos)
    
    # Skip uint pool
    uint_count, pos = read_encoded_u32(abc_data, pos)
    if uint_count > 1:
        for _ in range(uint_count - 1):
            _, pos = read_encoded_u32(abc_data, pos)
    
    # Skip double pool
    double_count, pos = read_encoded_u32(abc_data, pos)
    if double_count > 1:
        pos += (double_count - 1) * 8  # Each double is 8 bytes
    
    # Read string pool
    string_count, pos = read_encoded_u32(abc_data, pos)
    
    strings = []
    for i in range(string_count - 1):  # string[0] is always ""
        str_len, pos = read_encoded_u32(abc_data, pos)
        str_bytes = abc_data[pos:pos+str_len]
        try:
            str_val = str_bytes.decode('utf-8')
        except:
            str_val = None
        strings.append({
            'index': i + 1,
            'value': str_val,
            'bytes': str_bytes,
            'len_pos': pos - len(encode_u32(str_len)),  # position of length field
            'data_pos': pos,  # position of string data
            'total_size': len(encode_u32(str_len)) + str_len
        })
        pos += str_len
    
    return strings, pos  # pos is end of string pool

def replace_strings_in_abc(body, abc_tag, replacements_map):
    """
    Replace strings in an ABC tag's constant pool.
    Returns modified body if any replacements were made.
    """
    tag_type = abc_tag['type']
    data_start = abc_tag['data_start']
    
    # For DoABC2 (type 82): flags (u32) + name (null-terminated string)
    if tag_type == 82:
        abc_start = data_start + 4  # skip flags
        # Skip null-terminated name
        while body[abc_start] != 0:
            abc_start += 1
        abc_start += 1  # skip the null byte
    else:
        abc_start = data_start
    
    # Parse string pool
    strings, string_pool_end = parse_abc_string_pool(body, abc_start)
    
    # Find replacements
    changes = []
    for s in strings:
        if s['value'] in replacements_map:
            new_val = replacements_map[s['value']]
            changes.append((s, new_val))
    
    return changes, strings, abc_start

def apply_replacements(input_path, output_path, replacements_map):
    """
    Apply string replacements directly in the ABC bytecode.
    This rebuilds the ABC data with new strings, adjusting all lengths.
    """
    sig, ver, file_len, body = read_swf(input_path)
    body = bytearray(body)
    
    abc_tags = find_abc_tags(body)
    print(f"Found {len(abc_tags)} ABC tag(s) in SWF")
    
    total_replacements = 0
    
    # Process each ABC tag
    # We need to process from last to first to avoid offset issues
    for abc_tag in reversed(abc_tags):
        tag_type = abc_tag['type']
        data_start = abc_tag['data_start']
        tag_data_end = data_start + abc_tag['length']
        
        # For DoABC2: skip flags + name
        if tag_type == 82:
            abc_start = data_start + 4
            while body[abc_start] != 0:
                abc_start += 1
            abc_start += 1
        else:
            abc_start = data_start
        
        # Parse the ABC data
        abc_data = bytes(body[abc_start:tag_data_end])
        
        # Parse string pool to find positions and strings
        pos = 0
        pos += 4  # version
        
        # Skip int pool
        int_count, pos = read_encoded_u32(abc_data, pos)
        if int_count > 1:
            for _ in range(int_count - 1):
                _, pos = read_encoded_u32(abc_data, pos)
        
        # Skip uint pool
        uint_count, pos = read_encoded_u32(abc_data, pos)
        if uint_count > 1:
            for _ in range(uint_count - 1):
                _, pos = read_encoded_u32(abc_data, pos)
        
        # Skip double pool
        double_count, pos = read_encoded_u32(abc_data, pos)
        if double_count > 1:
            pos += (double_count - 1) * 8
        
        # Read string count
        string_count_pos = pos
        string_count, pos = read_encoded_u32(abc_data, pos)
        
        # Build new string pool
        string_pool_start = pos
        new_strings_data = bytearray()
        replacements_in_tag = 0
        
        for i in range(string_count - 1):
            str_len, pos = read_encoded_u32(abc_data, pos)
            str_bytes = abc_data[pos:pos+str_len]
            pos += str_len
            
            try:
                str_val = str_bytes.decode('utf-8')
            except:
                str_val = None
            
            if str_val is not None and str_val in replacements_map:
                new_str = replacements_map[str_val]
                new_bytes = new_str.encode('utf-8')
                new_strings_data += encode_u32(len(new_bytes))
                new_strings_data += new_bytes
                replacements_in_tag += 1
            else:
                new_strings_data += encode_u32(str_len)
                new_strings_data += str_bytes
        
        string_pool_end = pos
        
        if replacements_in_tag == 0:
            continue
        
        print(f"  ABC tag (type {tag_type}): {replacements_in_tag} string(s) replaced")
        total_replacements += replacements_in_tag
        
        # Rebuild ABC data
        new_abc = bytearray()
        new_abc += abc_data[:string_pool_start]  # everything before strings
        new_abc += new_strings_data               # new string pool
        new_abc += abc_data[string_pool_end:]      # everything after strings
        
        # Calculate size difference
        old_abc_len = len(abc_data)
        new_abc_len = len(new_abc)
        size_diff = new_abc_len - old_abc_len
        
        # Rebuild the tag
        # First, rebuild tag data (prefix before ABC + new ABC)
        prefix = body[data_start:abc_start]
        new_tag_data = bytes(prefix) + bytes(new_abc)
        new_tag_length = len(new_tag_data)
        
        # Rebuild the tag header
        tag_header_start = abc_tag['start']
        old_header = struct.unpack('<H', body[tag_header_start:tag_header_start+2])[0]
        old_tag_type = old_header >> 6
        old_short_len = old_header & 0x3F
        
        if old_short_len == 0x3F:
            # Long tag format
            new_header = struct.pack('<H', (old_tag_type << 6) | 0x3F)
            new_header += struct.pack('<I', new_tag_length)
            header_size = 6
        else:
            # If new length fits in short format (< 63) keep short, otherwise convert to long
            if new_tag_length < 0x3F:
                new_header = struct.pack('<H', (old_tag_type << 6) | new_tag_length)
                header_size = 2
            else:
                new_header = struct.pack('<H', (old_tag_type << 6) | 0x3F)
                new_header += struct.pack('<I', new_tag_length)
                header_size = 6
        
        # Determine old header size
        if old_short_len == 0x3F:
            old_header_size = 6
        else:
            old_header_size = 2
        
        # Replace in body
        old_tag_total = old_header_size + abc_tag['length']
        new_tag_total = new_header + new_tag_data
        
        body[tag_header_start:tag_header_start + old_tag_total] = new_tag_total
    
    print(f"\nTotal: {total_replacements} string(s) replaced across all ABC tags")
    
    # Write output
    write_swf(output_path, ver, bytes(body))
    output_size = os.path.getsize(output_path)
    print(f"Output: {output_path} ({output_size:,} bytes)")

if __name__ == '__main__':
    # Import the replacements from build_vietnamese_data
    sys.path.insert(0, '.')
    from build_vietnamese_data import DRAWING_REPLACEMENTS
    
    print("=== Paladog ABC String Replacer ===\n")
    
    # Use the binary-data-only SWF as base
    input_swf = 'Paladog_VN_test.swf'
    output_swf = 'Paladog_VN.swf'
    
    if not os.path.exists(input_swf):
        print(f"ERROR: {input_swf} not found!")
        sys.exit(1)
    
    apply_replacements(input_swf, output_swf, DRAWING_REPLACEMENTS)
    print("\nDone!")
