"""usage: python grid.py <fdat#> <sub> [x0 y0 x1 y1] [scale] [orig|cur]  -> extracted/subs/grid_<n>_<sub>.png
Shows a sub (or region in sub coordinates) with coordinate ticks every 10 px (labels every 50)."""
import sys
from uitool import *
num = int(sys.argv[1]); i = int(sys.argv[2])
args = sys.argv[3:]
src = 'orig'
if args and args[-1] in ('orig', 'cur'):
    src = args.pop()
scale = 3
reg = None
if len(args) >= 4:
    reg = tuple(int(a) for a in args[:4])
    if len(args) > 4: scale = int(args[4])
elif len(args) == 1:
    scale = int(args[0])
A = Atlas(num, src)
im = A.crop(i)
if reg is None:
    reg = (0, 0, im.width, im.height)
x0, y0, x1, y1 = reg
c = im.crop(reg)
bg = Image.new('RGBA', c.size, (110, 110, 140, 255)); bg.alpha_composite(c)
bg = bg.resize((c.width * scale, c.height * scale), Image.NEAREST)
d = ImageDraw.Draw(bg)
for x in range((x0 // 10) * 10, x1 + 1, 10):
    if x < x0: continue
    X = (x - x0) * scale
    major = x % 50 == 0
    d.line([(X, 0), (X, bg.height)], fill=(255, 0, 0, 160 if major else 60))
    if major: d.text((X + 2, 2), str(x), fill=(255, 255, 0, 255))
for y in range((y0 // 10) * 10, y1 + 1, 10):
    if y < y0: continue
    Y = (y - y0) * scale
    major = y % 50 == 0
    d.line([(0, Y), (bg.width, Y)], fill=(255, 0, 0, 160 if major else 60))
    if major: d.text((2, Y + 2), str(y), fill=(255, 255, 0, 255))
out = f'extracted/subs/grid_{num}_{i}.png'
bg.save(out)
print(out, im.size)
