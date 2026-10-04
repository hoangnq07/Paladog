# -*- coding: utf-8 -*-
from PIL import Image, ImageDraw, ImageFont

font_path = 'C:/Windows/Fonts/tahomabd.ttf'
s00 = Image.open('extracted/orig_sub00_help.png').convert('RGBA')
s01 = Image.open('extracted/orig_sub01_help.png').convert('RGBA')

# --- s00 (Normal book) ---
# Badge face polygon: (13, 25), (55, 16), (58, 41), (15, 51)
d00 = ImageDraw.Draw(s00)
d00.polygon([(14, 25), (55, 16), (58, 41), (15, 51)], fill=(255, 204, 34, 255))
font_s00 = ImageFont.truetype(font_path, 9)
# Two lines tilted or straight
d00.text((20, 24), "HƯỚNG", font=font_s00, fill=(0, 0, 0, 255), stroke_width=1, stroke_fill=(255, 240, 100, 255))
d00.text((25, 36), "DẪN", font=font_s00, fill=(0, 0, 0, 255), stroke_width=1, stroke_fill=(255, 240, 100, 255))

# --- s01 (Pressed book) ---
# Yellow box: x=21..86, y=17..39
d01 = ImageDraw.Draw(s01)
d01.rectangle([22, 18, 85, 38], fill=(255, 204, 34, 255))
font_s01 = ImageFont.truetype(font_path, 11)
bbox = font_s01.getbbox("CHỈ DẪN")
tw = bbox[2] - bbox[0]
th = bbox[3] - bbox[1]
cx = 22 + (63 - tw) // 2
cy = 18 + (20 - th) // 2 - bbox[1]
d01.text((cx, cy), "CHỈ DẪN", font=font_s01, fill=(0, 0, 0, 255), stroke_width=1, stroke_fill=(255, 240, 100, 255))

s00.save('extracted/test_s00_help.png')
s01.save('extracted/test_s01_help.png')
print("Saved test help books")
