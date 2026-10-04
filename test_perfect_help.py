# -*- coding: utf-8 -*-
from PIL import Image, ImageDraw, ImageFont

font_path = 'C:/Windows/Fonts/tahomabd.ttf'
s00 = Image.open('extracted/orig_sub00_help.png').convert('RGBA')

d00 = ImageDraw.Draw(s00)
# Bottom bevel
d00.polygon([(14, 46), (60, 39), (61, 45), (15, 52)], fill=(195, 130, 10, 255))
# Face
d00.polygon([(9, 21), (57, 14), (60, 39), (14, 46)], fill=(255, 204, 34, 255))
# Outline
d00.line([(9, 21), (57, 14), (61, 45), (15, 52), (9, 21)], fill=(35, 18, 5, 255), width=1)
d00.line([(14, 46), (60, 39)], fill=(160, 100, 5, 255), width=1)

txt_img = Image.new('RGBA', (60, 24), (0, 0, 0, 0))
d_txt = ImageDraw.Draw(txt_img)
font_s00 = ImageFont.truetype(font_path, 10)
bbox = font_s00.getbbox("CHỈ DẪN")
tw = bbox[2] - bbox[0]
th = bbox[3] - bbox[1]
cx = (60 - tw) // 2
cy = (24 - th) // 2 - bbox[1]
d_txt.text((cx, cy), "CHỈ DẪN", font=font_s00, fill=(0, 0, 0, 255), stroke_width=1, stroke_fill=(255, 240, 100, 255))

rot_txt = txt_img.rotate(8, resample=Image.BICUBIC, expand=True)
s00.paste(rot_txt, (5, 22), rot_txt)

s00.save('extracted/test_s00_perfect.png')
print("Saved test_s00_perfect.png")
