# -*- coding: utf-8 -*-
import zlib, struct, collections, sys
path = sys.argv[1] if len(sys.argv) > 1 else 'Paladog.swf'
with open(path, 'rb') as f:
    f.seek(8)
    body = zlib.decompress(f.read())
nb = body[0] >> 3
pos = (5 + nb * 4 + 7) // 8 + 4
cnt = collections.Counter()
sizes = collections.Counter()
first = {}
while pos < len(body):
    start = pos
    h = struct.unpack('<H', body[pos:pos+2])[0]; pos += 2
    t = h >> 6; l = h & 0x3F
    if l == 0x3F:
        l = struct.unpack('<I', body[pos:pos+4])[0]; pos += 4
    cnt[t] += 1
    sizes[t] += l
    first.setdefault(t, (start, l))
    pos += l
for t, c in sorted(cnt.items()):
    print(t, c, sizes[t], first[t])
