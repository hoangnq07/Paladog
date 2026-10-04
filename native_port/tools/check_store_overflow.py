# -*- coding: utf-8 -*-
from PIL import ImageFont
import sys
import os

sys.path.append('native_port/tools')
from patch_all_vietnamese_modern import DB4_VN

font_path = 'native_port/assets/fonts/BeVietnamPro-Bold.ttf'
font = ImageFont.truetype(font_path, 20)

print(f"Total DB4_VN rows: {len(DB4_VN)}")

print("=== PIG STORE (Rows 0-43, Max 340px) ===")
for idx in range(44):
    r = DB4_VN[idx]
    for line_idx, line in enumerate(r[1:]):
        if line == '0':
            continue
        bbox = font.getbbox(line)
        w = bbox[2] - bbox[0]
        if w > 340:
            print(f"Row {idx:02d} line {line_idx+1} (w={w}px, +{w-340}px): \"{line}\"")

print("\n=== LARVA STORE (Rows 44-82, Max 265px) ===")
for idx in range(44, len(DB4_VN)):
    r = DB4_VN[idx]
    for line_idx, line in enumerate(r[1:]):
        if line == '0':
            continue
        bbox = font.getbbox(line)
        w = bbox[2] - bbox[0]
        if w > 265:
            print(f"Row {idx:02d} line {line_idx+1} (w={w}px, +{w-265}px): \"{line}\"")

