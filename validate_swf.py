# -*- coding: utf-8 -*-
"""Validate SWF structure integrity"""
import zlib
import struct

def validate_swf(path):
    print(f"=== Validating {path} ===")
    
    with open(path, 'rb') as f:
        sig = f.read(3)
        ver = struct.unpack('B', f.read(1))[0]
        file_len = struct.unpack('<I', f.read(4))[0]
        rest = f.read()
    
    print(f"Signature: {sig.decode('latin1')}")
    print(f"Version: {ver}")
    print(f"Declared length: {file_len:,}")
    
    if sig == b'CWS':
        try:
            body = zlib.decompress(rest)
            print(f"Decompressed body: {len(body):,} bytes")
            print(f"Expected body: {file_len - 8:,} bytes")
            if len(body) == file_len - 8:
                print("✅ Body length matches declared length")
            else:
                print("⚠️ Body length mismatch (may be OK for some players)")
        except Exception as e:
            print(f"❌ Decompression FAILED: {e}")
            return False
    else:
        body = rest
    
    # Parse tags
    first_byte = body[0]
    nbits = first_byte >> 3
    rect_bytes = (5 + nbits * 4 + 7) // 8
    pos = rect_bytes + 4  # + framerate(2) + framecount(2)
    
    tag_count = 0
    tag_types = {}
    
    try:
        while pos < len(body):
            if pos + 2 > len(body):
                print(f"❌ Truncated tag header at position {pos}")
                return False
            
            tag_header = struct.unpack('<H', body[pos:pos+2])[0]
            pos += 2
            tag_type = tag_header >> 6
            tag_length = tag_header & 0x3F
            
            if tag_length == 0x3F:
                if pos + 4 > len(body):
                    print(f"❌ Truncated long tag length at position {pos}")
                    return False
                tag_length = struct.unpack('<I', body[pos:pos+4])[0]
                pos += 4
            
            if pos + tag_length > len(body):
                print(f"❌ Tag type {tag_type} at {pos} exceeds body (need {tag_length}, have {len(body) - pos})")
                return False
            
            tag_types[tag_type] = tag_types.get(tag_type, 0) + 1
            tag_count += 1
            pos += tag_length
            
            if tag_type == 0:  # End tag
                break
        
        print(f"✅ Parsed {tag_count} tags successfully")
        print(f"   Tag types: DoABC2(82)={tag_types.get(82,0)}, DefineBinaryData(87)={tag_types.get(87,0)}, End(0)={tag_types.get(0,0)}")
        
        if pos <= len(body):
            remaining = len(body) - pos
            if remaining > 0:
                print(f"   Trailing data: {remaining} bytes (normal for some SWFs)")
        
        return True
        
    except Exception as e:
        print(f"❌ Parse error: {e}")
        return False

# Validate both files
for f in ['Paladog.swf', 'Paladog_VN.swf']:
    validate_swf(f)
    print()
