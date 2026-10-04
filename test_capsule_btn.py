# -*- coding: utf-8 -*-
from PIL import Image, ImageDraw, ImageFont

font_path = 'C:/Windows/Fonts/tahomabd.ttf'
s10 = Image.open('extracted/orig_s10_btn.png').convert('RGBA')

# Clear and redraw the clean capsule
d = ImageDraw.Draw(s10)
# Clear background inside sprite
d.rectangle([0, 0, 222, 60], fill=(0, 0, 0, 0))

# Outer black border
d.rounded_rectangle([2, 4, 220, 56], radius=25, fill=(0, 0, 0, 255))
# Dark orange bottom shadow of pill
d.rounded_rectangle([4, 6, 218, 54], radius=24, fill=(220, 130, 0, 255))
# Main golden yellow body
d.rounded_rectangle([4, 6, 218, 51], radius=24, fill=(255, 208, 0, 255))
# Top highlight
d.rounded_rectangle([8, 8, 214, 24], radius=10, fill=(255, 235, 80, 255))

# Draw Vietnamese text
font = ImageFont.truetype(font_path, 13)
text = "CƠ BẢN & ĐIỀU KHIỂN"
bbox = font.getbbox(text)
tw = bbox[2] - bbox[0]
th = bbox[3] - bbox[1]
cx = (222 - tw) // 2
cy = (60 - th) // 2 - bbox[1]

# Shadow + Stroke + Fill
d.text((cx + 1, cy + 2), text, font=font, fill=(90, 30, 0, 255), stroke_width=2, stroke_fill=(90, 30, 0, 255))
d.text((cx, cy), text, font=font, fill=(255, 140, 0, 255), stroke_width=2, stroke_fill=(120, 45, 0, 255))

s10.save('extracted/test_pill_btn.png')
print("Saved test_pill_btn.png")
