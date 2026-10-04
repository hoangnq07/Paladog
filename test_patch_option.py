from PIL import Image, ImageDraw, ImageFont
import os

def test_option_patch():
    # Load original sub_07, sub_08, sub_00, and sub_10
    s07 = Image.open('extracted/ui_subsprites/option/sub_07.png').convert('RGBA')
    s08 = Image.open('extracted/ui_subsprites/option/sub_08.png').convert('RGBA')
    s00 = Image.open('extracted/ui_subsprites/option/sub_00.png').convert('RGBA')
    s10 = Image.open('extracted/ui_subsprites/option/sub_10.png').convert('RGBA')
    
    # 1. Patch s07 (Option scroll)
    draw07 = ImageDraw.Draw(s07)
    # Banner 'OPTION' -> 'CÀI ĐẶT'
    # Original 'OPTION' is roughly at x=115..260, y=75..135
    # Fill banner over OPTION
    draw07.rectangle([115, 75, 270, 135], fill=(77, 166, 230, 255))
    font_banner = ImageFont.truetype('C:/Windows/Fonts/tahomabd.ttf', 30)
    text_opt = "CÀI ĐẶT"
    bbox = font_banner.getbbox(text_opt)
    tw = bbox[2] - bbox[0]
    cx = 120 + (145 - tw) // 2
    # Shadow & stroke
    draw07.text((cx + 1, 90 + 2), text_opt, font=font_banner, fill=(20, 50, 90, 255), stroke_width=4, stroke_fill=(20, 50, 90, 255))
    draw07.text((cx, 90), text_opt, font=font_banner, fill=(255, 255, 255, 255), stroke_width=3, stroke_fill=(30, 60, 100, 255))
    
    # 'MUSIC VOLUME' -> 'ÂM NHẠC'
    draw07.rectangle([45, 185, 255, 230], fill=(43, 26, 15, 255))
    font_vol = ImageFont.truetype('C:/Windows/Fonts/tahomabd.ttf', 22)
    text_mus = "ÂM NHẠC"
    draw07.text((50 + 1, 195 + 1), text_mus, font=font_vol, fill=(100, 30, 0, 255), stroke_width=3, stroke_fill=(100, 30, 0, 255))
    draw07.text((50, 195), text_mus, font=font_vol, fill=(255, 140, 0, 255), stroke_width=2, stroke_fill=(150, 45, 0, 255))
    
    # 'EFFECT VOLUME' -> 'HIỆU ỨNG'
    draw07.rectangle([45, 340, 255, 385], fill=(43, 26, 15, 255))
    text_eff = "HIỆU ỨNG"
    draw07.text((50 + 1, 350 + 1), text_eff, font=font_vol, fill=(100, 30, 0, 255), stroke_width=3, stroke_fill=(100, 30, 0, 255))
    draw07.text((50, 350), text_eff, font=font_vol, fill=(255, 140, 0, 255), stroke_width=2, stroke_fill=(150, 45, 0, 255))
    
    s07.save('extracted/temp_patch/test_opt_sub07.png')
    
    # 2. Patch s08 (TUTORIAL banner)
    draw08 = ImageDraw.Draw(s08)
    draw08.rectangle([30, 10, 230, 85], fill=(77, 166, 230, 255))
    text_tut = "HƯỚNG DẪN"
    font_tut = ImageFont.truetype('C:/Windows/Fonts/tahomabd.ttf', 24)
    bbox = font_tut.getbbox(text_tut)
    tw = bbox[2] - bbox[0]
    cx = 30 + (200 - tw) // 2
    draw08.text((cx + 1, 35 + 2), text_tut, font=font_tut, fill=(20, 50, 90, 255), stroke_width=4, stroke_fill=(20, 50, 90, 255))
    draw08.text((cx, 35), text_tut, font=font_tut, fill=(255, 255, 255, 255), stroke_width=3, stroke_fill=(30, 60, 100, 255))
    s08.save('extracted/temp_patch/test_opt_sub08.png')
    
    # 3. Patch s00 (Book HELP -> HƯỚNG DẪN)
    draw00 = ImageDraw.Draw(s00)
    draw00.rectangle([14, 25, 78, 62], fill=(235, 185, 30, 255))
    font_book = ImageFont.truetype('C:/Windows/Fonts/tahomabd.ttf', 11)
    draw00.text((16, 28), "HƯỚNG", font=font_book, fill=(20, 10, 0, 255), stroke_width=1, stroke_fill=(40, 20, 0, 255))
    draw00.text((22, 44), "DẪN", font=font_book, fill=(20, 10, 0, 255), stroke_width=1, stroke_fill=(40, 20, 0, 255))
    s00.save('extracted/temp_patch/test_opt_sub00.png')
    
    # 4. Patch s10 (Button BASICS & CONTROL -> CƠ BẢN & ĐIỀU KHIỂN)
    draw10 = ImageDraw.Draw(s10)
    draw10.rounded_rectangle([15, 8, 207, 52], radius=15, fill=(255, 215, 0, 255))
    font_btn = ImageFont.truetype('C:/Windows/Fonts/tahomabd.ttf', 14)
    btn_text = "CƠ BẢN & ĐIỀU KHIỂN"
    bbox = font_btn.getbbox(btn_text)
    tw = bbox[2] - bbox[0]
    th = bbox[3] - bbox[1]
    cx = (222 - tw) // 2
    cy = (60 - th) // 2 - bbox[1]
    draw10.text((cx + 1, cy + 2), btn_text, font=font_btn, fill=(100, 40, 0, 255), stroke_width=3, stroke_fill=(100, 40, 0, 255))
    draw10.text((cx, cy), btn_text, font=font_btn, fill=(255, 140, 0, 255), stroke_width=2, stroke_fill=(120, 45, 0, 255))
    s10.save('extracted/temp_patch/test_opt_sub10.png')

test_option_patch()
print('Patched option test elements')
