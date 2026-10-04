# -*- coding: utf-8 -*-
from PIL import Image, ImageDraw, ImageFont

font_path = 'C:/Windows/Fonts/tahomabd.ttf'
s00 = Image.open('extracted/orig_sub00_help.png').convert('RGBA')

# Polygon covering whole yellow plaque:
# [(7, 21), (56, 13), (62, 41), (12, 54)]
d00 = ImageDraw.Draw(s00)
# Dark outline
d00.polygon([(6, 19), (57, 11), (63, 42), (11, 55)], fill=(40, 20, 5, 255))
# Face
d00.polygon([(8, 22), (55, 14), (60, 39), (13, 52)], fill=(255, 204, 34, 255))

# Render "CHỈ DẪN" rotated
txt_img = Image.new('RGBA', (70, 30), (0, 0, 0, 0))
d_txt = ImageDraw.Draw(txt_img)
font_s00 = ImageFont.truetype(font_path, 10)
bbox = font_s00.getbbox("CHỈ DẪN")
tw = bbox[2] - bbox[0]
th = bbox[3] - bbox[1]
cx = (70 - tw) // 2
cy = (30 - th) // 2 - bbox[1]
d_txt.text((cx, cy), "CHỈ DẪN", font=font_s00, fill=(0, 0, 0, 255), stroke_width=1, stroke_fill=(255, 240, 100, 255))

# Rotate by -11 degrees
rot_txt = txt_img.rotate(11, resample=Image.BICUBIC, expand=True)
s00.paste(rot_txt, (5, 18), rot_txt)

s00.save('extracted/test_s00_help_rotated.png')
print("Saved test_s00_help_rotated.png")
