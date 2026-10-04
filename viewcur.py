"""usage: python viewcur.py <fdat#> [orig|cur]  -> extracted/subs/atlas_<n>_<src>.png (whole atlas on grey-blue)"""
import sys
from uitool import *
num = int(sys.argv[1]); src = sys.argv[2] if len(sys.argv) > 2 else 'cur'
A = Atlas(num, src)
bg = Image.new('RGBA', A.img.size, (90, 90, 120, 255)); bg.alpha_composite(A.img)
d = ImageDraw.Draw(bg)
for s in A.subs:
    d.rectangle([s['ax'], s['ay'], s['ax'] + s['w'] - 1, s['ay'] + s['h'] - 1], outline=(255, 0, 0, 255))
    d.text((s['ax'] + 2, s['ay'] + 2), str(s['i']), fill=(255, 255, 0, 255))
# crop away empty bottom/right
bb = A.img.getbbox()
bg = bg.crop((0, 0, bb[2] + 2, bb[3] + 2))
out = f'extracted/subs/atlas_{num}_{src}.png'
bg.save(out)
print(out, bg.size)
