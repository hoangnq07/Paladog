import zlib
import struct

with open('Paladog_VN.swf', 'rb') as f:
    f.seek(8)
    swf = zlib.decompress(f.read())

first_byte = swf[0]
nbits = first_byte >> 3
pos = ((5 + nbits * 4 + 7) // 8) + 4

found_db0 = False
found_db4 = False
found_db6 = False

while pos < len(swf):
    tag_header = struct.unpack('<H', swf[pos:pos+2])[0]
    pos += 2
    tag_type = tag_header >> 6
    tag_length = tag_header & 0x3F
    if tag_length == 0x3F:
        tag_length = struct.unpack('<I', swf[pos:pos+4])[0]
        pos += 4
    tag_data = swf[pos:pos+tag_length]
    if tag_type == 87: # DefineBinaryData
        tag_id = struct.unpack('<H', tag_data[:2])[0]
        payload = tag_data[6:]
        if tag_id == 408: # DB0
            decomp = zlib.decompress(payload)
            if 'Vua Zombie'.encode('utf-8') in decomp:
                found_db0 = True
        elif tag_id == 416: # DB4
            decomp = zlib.decompress(payload)
            if 'Gậy Đấm'.encode('utf-8') in decomp:
                found_db4 = True
        elif tag_id == 420: # DB6
            decomp = zlib.decompress(payload)
            if 'Trong hào quang'.encode('utf-8') in decomp:
                found_db6 = True
    pos += tag_length

print(f"Tag 408 (DB0 - Boss Dialogs): {'VERIFIED!' if found_db0 else 'FAILED'}")
print(f"Tag 416 (DB4 - Weapons/Shop): {'VERIFIED!' if found_db4 else 'FAILED'}")
print(f"Tag 420 (DB6 - Unit/Aura):   {'VERIFIED!' if found_db6 else 'FAILED'}")
