# -*- coding: utf-8 -*-
import zlib, struct, os

with open('Paladog.swf', 'rb') as f:
    f.seek(8)
    body = zlib.decompress(f.read())

first_byte = body[0]
nbits = first_byte >> 3
rect_bytes = (5 + nbits * 4 + 7) // 8
pos = rect_bytes + 4

tags_to_extract = {
    154: '154_com.fazecat.web.paladog.Library_fDat99.bin',
    138: '138_com.fazecat.web.paladog.Library_fDat126.bin',
    186: '186_com.fazecat.web.paladog.Library_fDat115.bin',
    141: '141_com.fazecat.web.paladog.Library_fDat129.bin',
    147: '147_com.fazecat.web.paladog.Library_fDat130.bin',
    146: '146_com.fazecat.web.paladog.Library_fDat131.bin',
    145: '145_com.fazecat.web.paladog.Library_fDat132.bin',
    144: '144_com.fazecat.web.paladog.Library_fDat133.bin',
    180: '180_com.fazecat.web.paladog.Library_fDat117.bin',
    185: '185_com.fazecat.web.paladog.Library_fDat112.bin',
    139: '139_com.fazecat.web.paladog.Library_fDat123.bin',
    189: '189_com.fazecat.web.paladog.Library_fDat121.bin',
    190: '190_com.fazecat.web.paladog.Library_fDat122.bin',
    164: '164_com.fazecat.web.paladog.Library_fDat92.bin',
    203: '203_com.fazecat.web.paladog.Library_fDat33.bin',
    211: '211_com.fazecat.web.paladog.Library_fDat39.bin',
    167: '167_com.fazecat.web.paladog.Library_fDat90.bin',
    158: '158_com.fazecat.web.paladog.Library_fDat96.bin',
    188: '188_com.fazecat.web.paladog.Library_fDat120.bin',
}

extracted_count = 0
while pos < len(body):
    header = struct.unpack('<H', body[pos:pos+2])[0]
    pos += 2
    tag_type = header >> 6
    tag_len = header & 0x3F
    if tag_len == 0x3F:
        tag_len = struct.unpack('<I', body[pos:pos+4])[0]
        pos += 4
    if tag_type == 87:
        tag_id = struct.unpack('<H', body[pos:pos+2])[0]
        if tag_id in tags_to_extract:
            fname = tags_to_extract[tag_id]
            out_path = os.path.join('extracted/binaryData', fname)
            # Write pure original tag data
            with open(out_path, 'wb') as out_f:
                out_f.write(body[pos+6 : pos+tag_len])
            extracted_count += 1
    pos += tag_len

print(f"Extracted {extracted_count} clean original binaryData tags from Paladog.swf!")
