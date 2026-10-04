# -*- coding: utf-8 -*-
"""Contact sheets of all fDat atlases (originals) with names. Output extracted/contact/sheet_XX.png"""
import glob, os, re, zlib, struct, io
from PIL import Image, ImageDraw, ImageFont

names = {}
src = open('extracted/scripts/scripts/com/fazecat/web/paladog/Library.as', encoding='utf-8', errors='ignore').read()
for m in re.finditer(r'public static const (\w+):int = (\d+);', src):
    names.setdefault(int(m.group(2)), []).append(m.group(1))

items = []
for p in glob.glob('extracted/orig_bin/*Library_fDat*.bin'):
    num = int(re.search(r'fDat(\d+)\.bin', p).group(1))
    items.append((num, p))
items.sort()

CELL = 400
COLS, ROWS = 3, 3
font = ImageFont.load_default()
os.makedirs('extracted/contact', exist_ok=True)
per = COLS * ROWS
for si in range(0, len(items), per):
    sheet = Image.new('RGBA', (COLS * CELL, ROWS * CELL), (70, 70, 100, 255))
    d = ImageDraw.Draw(sheet)
    for k, (num, p) in enumerate(items[si:si+per]):
        data = zlib.decompress(open(p, 'rb').read())
        n = struct.unpack('<I', data[:4])[0]
        try:
            img = Image.open(io.BytesIO(data[4+32*n:])).convert('RGBA')
        except Exception as e:
            continue
        img.thumbnail((CELL - 4, CELL - 20))
        cx = (k % COLS) * CELL
        cy = (k // COLS) * CELL
        sheet.alpha_composite(img, (cx + 2, cy + 18))
        d.rectangle([cx, cy, cx + CELL - 1, cy + CELL - 1], outline=(255, 255, 255, 255))
        d.text((cx + 4, cy + 3), f'fDat{num} N={n} ' + ','.join(names.get(num, [])), fill=(255, 255, 0, 255), font=font)
    sheet.convert('RGB').save(f'extracted/contact/sheet_{si//per:02d}.png')
print(len(items), 'atlases')
