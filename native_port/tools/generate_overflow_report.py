# -*- coding: utf-8 -*-
from PIL import ImageFont
import sys

sys.path.append('native_port/tools')
from patch_all_vietnamese_modern import DB4_VN

font_path = 'native_port/assets/fonts/BeVietnamPro-Bold.ttf'
font = ImageFont.truetype(font_path, 20)

with open('overflow_report.txt', 'w', encoding='utf-8') as out:
    out.write("=== PIG STORE (Rows 0-43, Max 340px) ===\n")
    pig_count = 0
    for idx in range(44):
        r = DB4_VN[idx]
        for line_idx, line in enumerate(r[1:]):
            if line == '0':
                continue
            bbox = font.getbbox(line)
            w = bbox[2] - bbox[0]
            if w > 340:
                pig_count += 1
                out.write(f"Row {idx:02d} line {line_idx+1} (w={w}px, +{w-340}px): \"{line}\"\n")
    out.write(f"Total Pig overflows: {pig_count}\n\n")

    out.write("=== LARVA STORE (Rows 44-82, Max 265px) ===\n")
    larva_count = 0
    for idx in range(44, len(DB4_VN)):
        r = DB4_VN[idx]
        for line_idx, line in enumerate(r[1:]):
            if line == '0':
                continue
            bbox = font.getbbox(line)
            w = bbox[2] - bbox[0]
            if w > 265:
                larva_count += 1
                out.write(f"Row {idx:02d} line {line_idx+1} (w={w}px, +{w-265}px): \"{line}\"\n")
    out.write(f"Total Larva overflows: {larva_count}\n")

print("Generated overflow_report.txt successfully!")
