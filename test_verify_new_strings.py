# -*- coding: utf-8 -*-
import zlib
import struct

with open('Paladog_VN.swf', 'rb') as f:
    f.seek(8)
    body = zlib.decompress(f.read())

samples = [
    'Vua Zombie',
    'Gậy Đấm Thần Lực',
    'Chuột đấu sĩ',
    'Độ Khó Trò Chơi',
    'Chìa khóa kìa!!',
    'Hiệp sĩ chó đã bước ra từ bóng tối',
    'Nhẫn Kinh Nghiệm',
    'ĐẾN GIỜ ĐI TÔNG RỒI CON TRAI!!!',
    'một hiệp sĩ chó đã bước ra từ bóng tối để chiến đấu',
    'sáu cậu con trai và sáu cô con gái',
    'Cú sút của ta là đỉnh nhất quả đất!!'
]

# Decompress all binaryData tags
binary_texts = []
first_byte = body[0]
nbits = first_byte >> 3
rect_bytes = (5 + nbits * 4 + 7) // 8
pos = rect_bytes + 4  # + framerate(2) + framecount(2)
while pos < len(body):
    if pos + 2 > len(body):
        break
    header = struct.unpack('<H', body[pos:pos+2])[0]
    pos += 2
    tag_type = header >> 6
    tag_len = header & 0x3F
    if tag_len == 0x3F:
        tag_len = struct.unpack('<I', body[pos:pos+4])[0]
        pos += 4
    
    if tag_type == 87: # DefineBinaryData
        # skip tag id (2) + reserved (4)
        raw_bin = body[pos+6 : pos+tag_len]
        try:
            decomp = zlib.decompress(raw_bin)
            binary_texts.append(decomp)
        except:
            pass
            
    pos += tag_len

print(f"Decompressed {len(binary_texts)} binaryData tags")

for s in samples:
    b = s.encode('utf-8')
    in_body = b in body
    in_bin = any(b in d for d in binary_texts)
    
    if in_body and in_bin:
        loc = "BOTH in ABC bytecode and in BinaryData tags!"
    elif in_body:
        loc = "FOUND in ABC bytecode (story/dialogue/ui)"
    elif in_bin:
        loc = "FOUND in BinaryData tags (DB tables)"
    else:
        loc = "NOT FOUND"
    print(f"{s:45s}: {loc}")
