# -*- coding: utf-8 -*-
from PIL import ImageFont

font = ImageFont.truetype('native_port/assets/fonts/BeVietnamPro-Bold.ttf', 20)

with open('extracted/db4_dump.txt', 'r', encoding='utf-8') as f:
    lines = f.readlines()

max_pig = 0
max_larva = 0
pig_ov = 0
larva_ov = 0
for idx, l in enumerate(lines):
    parts = eval(l.split(':', 1)[1].strip())
    is_larva = (idx >= 44)
    for txt in parts[1:]:
        if txt == '0':
            continue
        bbox = font.getbbox(txt)
        w = bbox[2] - bbox[0]
        if is_larva:
            if w > max_larva:
                max_larva = w
            if w > 265:
                larva_ov += 1
                # print(f"English Larva Row {idx} ({w}px): \"{txt}\"")
        else:
            if w > max_pig:
                max_pig = w
            if w > 340:
                pig_ov += 1
                # print(f"English Pig Row {idx} ({w}px): \"{txt}\"")

print(f"Max English Pig line: {max_pig}px, Max English Larva line: {max_larva}px")
print(f"English Larva lines > 265px: {larva_ov}")
