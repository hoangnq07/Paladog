# -*- coding: utf-8 -*-
"""Extract ALL original DefineBinaryData tags from Paladog.swf into extracted/orig_bin/<name>.bin
using names from extracted/binaryData (id_name.bin)."""
import zlib, struct, os, glob, re

os.makedirs('extracted/orig_bin', exist_ok=True)
names = {}
for p in glob.glob('extracted/binaryData/*.bin'):
    b = os.path.basename(p)
    m = re.match(r'(\d+)_(.*)\.bin$', b)
    if m:
        names[int(m.group(1))] = b

with open('Paladog.swf', 'rb') as f:
    f.seek(8)
    body = zlib.decompress(f.read())
nb = body[0] >> 3
pos = (5 + nb * 4 + 7) // 8 + 4
cnt = 0
while pos < len(body):
    h = struct.unpack('<H', body[pos:pos+2])[0]; pos += 2
    t = h >> 6; l = h & 0x3F
    if l == 0x3F:
        l = struct.unpack('<I', body[pos:pos+4])[0]; pos += 4
    if t == 87:
        tid = struct.unpack('<H', body[pos:pos+2])[0]
        name = names.get(tid, f'{tid}_unknown.bin')
        open(os.path.join('extracted/orig_bin', name), 'wb').write(body[pos+6:pos+l])
        cnt += 1
    pos += l
print('extracted', cnt)
