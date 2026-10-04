# -*- coding: utf-8 -*-
"""
patch_all_ui_assets.py
Patches all UI spritesheets in Paladog with localized Vietnamese graphics,
matching original fonts, outlines, gradients, and shadows.
Then repacks the modified atlases into the respective zlib-compressed .bin files.
"""

import os
import io
import zlib
import struct
from PIL import Image, ImageDraw, ImageFont

FONT_PATH = 'C:/Windows/Fonts/tahomabd.ttf'
os.makedirs('extracted/ui_subsprites_vn', exist_ok=True)

def get_font(size):
    return ImageFont.truetype(FONT_PATH, size)

def draw_styled_text(draw, pos, text, font, fill_color, stroke_color, stroke_w=2, shadow_offset=(2,2), shadow_color=None):
    x, y = pos
    if shadow_color and shadow_offset:
        sx, sy = shadow_offset
        draw.text((x + sx, y + sy), text, font=font, fill=shadow_color, stroke_width=stroke_w + 1, stroke_fill=shadow_color)
    if stroke_color and stroke_w > 0:
        draw.text((x, y), text, font=font, fill=fill_color, stroke_width=stroke_w, stroke_fill=stroke_color)
    else:
        draw.text((x, y), text, font=font, fill=fill_color)

def center_text_pos(box, text, font):
    # box is (x, y, w, h)
    bx, by, bw, bh = box
    bbox = font.getbbox(text)
    tw = bbox[2] - bbox[0]
    th = bbox[3] - bbox[1]
    cx = bx + (bw - tw) // 2
    cy = by + (bh - th) // 2 - bbox[1]
    return (cx, cy)

def repack_fdat_bin(bin_path, atlas_img, output_bin_path=None):
    if output_bin_path is None:
        output_bin_path = bin_path
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n_images = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 8 * 4 * n_images
    header = data[:header_size]
    
    # Save atlas_img to PNG bytes
    import io
    png_buf = io.BytesIO()
    atlas_img.save(png_buf, format='PNG')
    png_bytes = png_buf.getvalue()
    
    repacked = zlib.compress(header + png_bytes)
    with open(output_bin_path, 'wb') as f:
        f.write(repacked)
    print(f'Repacked {os.path.basename(output_bin_path)}: {len(repacked)} bytes (N={n_images})')

# ==========================================
# 1. LOADING (fDat99)
# ==========================================
def patch_loading():
    bin_path = 'extracted/binaryData/154_com.fazecat.web.paladog.Library_fDat99.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_00: pos=(0, 810), size=(218, 36)
    draw = ImageDraw.Draw(atlas)
    draw.rectangle([0, 810, 218, 810 + 36], fill=(0, 0, 0, 0))
    font = get_font(24)
    pos = center_text_pos((0, 810, 218, 36), "ĐANG TẢI...", font)
    draw_styled_text(draw, pos, "ĐANG TẢI...", font, 
                     fill_color=(255, 230, 20, 255), 
                     stroke_color=(130, 50, 0, 255), stroke_w=3,
                     shadow_offset=(2, 2), shadow_color=(80, 30, 0, 255))
    
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 2. TITLEBTN (fDat126 - PLAY Button)
# ==========================================
def patch_titlebtn():
    bin_path = 'extracted/binaryData/138_com.fazecat.web.paladog.Library_fDat126.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_04: pos=(0, 24), size=(204, 140) -> Pressed PLAY
    # sub_03: pos=(0, 164), size=(204, 140) -> Normal PLAY
    font = get_font(46)
    colors = [
        (25, 75, 135, 255),
        (35, 95, 160, 255),
        (45, 115, 185, 255),
        (55, 130, 205, 255),
        (70, 150, 220, 255),
        (85, 165, 230, 255),
    ]
    
    for ay, is_pressed in [(164, False), (24, True)]:
        sub = atlas.crop((0, ay, 204, ay + 140))
        draw = ImageDraw.Draw(sub)
        w, h = 204, 140
        for idx, col in enumerate(colors):
            dx = 14 + idx * 8
            dy = 12 + idx * 6
            draw.ellipse([dx, dy, w - dx, h - dy], fill=col)
        # Highlight crescent
        draw.ellipse([30, 16, w - 30, h // 2 + 10], fill=(100, 180, 240, 120))
        draw.ellipse([35, 22, w - 35, h // 2 + 10], fill=(85, 165, 230, 255))
        
        pos = center_text_pos((0, 0, w, h), "CHƠI", font)
        if is_pressed:
            pos = (pos[0], pos[1] + 4)
        draw_styled_text(draw, pos, "CHƠI", font,
                         fill_color=(255, 255, 255, 255),
                         stroke_color=(15, 30, 65, 255), stroke_w=7,
                         shadow_offset=(2, 6), shadow_color=(10, 25, 55, 255))
        atlas.paste(sub, (0, ay))
        
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 3. OPTION (fDat115)
# ==========================================
def patch_option():
    bin_path = 'extracted/binaryData/186_com.fazecat.web.paladog.Library_fDat115.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # 3.1 sub_07: pos=(0, 0), size=(330, 522) - Option Parchment
    s07 = atlas.crop((0, 0, 330, 522))
    d07 = ImageDraw.Draw(s07)
    
    # OPTION -> CÀI ĐẶT
    # Blue banner seamless background
    d07.rectangle([115, 36, 260, 59], fill=(93, 202, 255, 255))
    d07.rectangle([115, 60, 260, 84], fill=(73, 169, 222, 255))
    font_banner = get_font(26)
    pos_opt = center_text_pos((115, 36, 145, 48), "CÀI ĐẶT", font_banner)
    draw_styled_text(d07, pos_opt, "CÀI ĐẶT", font_banner,
                     fill_color=(255, 255, 255, 255),
                     stroke_color=(20, 50, 90, 255), stroke_w=4,
                     shadow_offset=(1, 3), shadow_color=(15, 35, 65, 255))
    
    # MUSIC VOLUME -> ÂM LƯỢNG NHẠC
    d07.rectangle([55, 125, 260, 152], fill=(56, 40, 28, 255))
    font_vol = get_font(15)
    draw_styled_text(d07, (60, 128), "ÂM LƯỢNG NHẠC", font_vol,
                     fill_color=(255, 140, 0, 255),
                     stroke_color=(140, 45, 0, 255), stroke_w=2,
                     shadow_offset=(1, 2), shadow_color=(80, 20, 0, 255))
    
    # EFFECT VOLUME -> ÂM HIỆU ỨNG
    d07.rectangle([55, 228, 260, 255], fill=(56, 40, 28, 255))
    draw_styled_text(d07, (60, 232), "ÂM HIỆU ỨNG", font_vol,
                     fill_color=(255, 140, 0, 255),
                     stroke_color=(140, 45, 0, 255), stroke_w=2,
                     shadow_offset=(1, 2), shadow_color=(80, 20, 0, 255))
    atlas.paste(s07, (0, 0))
    
    # 3.2 sub_00 & sub_01: HELP Book (pos=(258, 522) and (258, 680))
    # Normal book sub_00: size=(104, 158)
    s00 = atlas.crop((258, 522, 258 + 104, 522 + 158))
    d00 = ImageDraw.Draw(s00)
    # Bottom bevel
    d00.polygon([(12, 45), (61, 38), (62, 47), (14, 54)], fill=(195, 130, 10, 255))
    # Face
    d00.polygon([(8, 20), (58, 13), (61, 41), (11, 48)], fill=(255, 204, 34, 255))
    # Outline
    d00.line([(8, 20), (58, 13), (62, 47), (14, 54), (8, 20)], fill=(35, 18, 5, 255), width=1)
    d00.line([(11, 48), (61, 41)], fill=(160, 100, 5, 255), width=1)
    
    txt_img = Image.new('RGBA', (60, 24), (0, 0, 0, 0))
    d_txt = ImageDraw.Draw(txt_img)
    font_s00 = get_font(10)
    bbox00 = font_s00.getbbox("CHỈ DẪN")
    tw00 = bbox00[2] - bbox00[0]
    th00 = bbox00[3] - bbox00[1]
    cx00 = (60 - tw00) // 2
    cy00 = (24 - th00) // 2 - bbox00[1]
    d_txt.text((cx00, cy00), "CHỈ DẪN", font=font_s00, fill=(0, 0, 0, 255), stroke_width=1, stroke_fill=(255, 240, 100, 255))
    rot_txt = txt_img.rotate(8, resample=Image.BICUBIC, expand=True)
    s00.paste(rot_txt, (5, 22), rot_txt)
    atlas.paste(s00, (258, 522))
    
    # Pressed book sub_01: size=(104, 136)
    s01 = atlas.crop((258, 680, 258 + 104, 680 + 136))
    d01 = ImageDraw.Draw(s01)
    d01.rectangle([22, 18, 85, 38], fill=(255, 204, 34, 255))
    font_s01 = get_font(11)
    bbox01 = font_s01.getbbox("CHỈ DẪN")
    tw01 = bbox01[2] - bbox01[0]
    th01 = bbox01[3] - bbox01[1]
    cx01 = 22 + (63 - tw01) // 2
    cy01 = 18 + (20 - th01) // 2 - bbox01[1]
    d01.text((cx01, cy01), "CHỈ DẪN", font=font_s01, fill=(0, 0, 0, 255), stroke_width=1, stroke_fill=(255, 240, 100, 255))
    atlas.paste(s01, (258, 680))
    
    # 3.3 sub_08: pos=(0, 522), size=(258, 464) - TUTORIAL scroll banner
    s08 = atlas.crop((0, 522, 258, 522 + 464))
    d08 = ImageDraw.Draw(s08)
    d08.rectangle([30, 1, 225, 32], fill=(93, 202, 255, 255))
    d08.rectangle([30, 33, 225, 45], fill=(73, 169, 222, 255))
    pos_tut = center_text_pos((30, 0, 195, 46), "HƯỚNG DẪN", get_font(24))
    draw_styled_text(d08, pos_tut, "HƯỚNG DẪN", get_font(24),
                     fill_color=(255, 255, 255, 255),
                     stroke_color=(20, 50, 90, 255), stroke_w=4,
                     shadow_offset=(1, 3), shadow_color=(15, 35, 65, 255))
    atlas.paste(s08, (0, 522))
    
    # 3.4 sub_09 to sub_18: 5 Tutorial buttons (each 222x60)
    btn_exact = [
        # (normal_sub, normal_pos, pressed_sub, pressed_pos, text)
        (10, (702, 120), 9, (330, 180), "CƠ BẢN & ĐIỀU KHIỂN"),
        (12, (702, 60), 11, (480, 120), "CHẾ ĐỘ ĐỊNH MỆNH"),
        (14, (702, 0), 13, (480, 60), "HỘ TỐNG XE HÀNG"),
        (16, (258, 936), 15, (480, 0), "CHẾ ĐỘ CHIẾN TRƯỜNG"),
        (18, (258, 816), 17, (258, 876), "CỬA HÀNG & NÂNG CẤP"),
    ]
    font_btn = get_font(13)
    for n_idx, (nx, ny), p_idx, (px, py), btext in btn_exact:
        for idx, (bx, by), is_p in [(n_idx, (nx, ny), False), (p_idx, (px, py), True)]:
            sub = atlas.crop((bx, by, bx + 222, by + 60))
            d = ImageDraw.Draw(sub)
            d.rectangle([0, 0, 222, 60], fill=(0, 0, 0, 0))
            
            # Outer black border
            d.rounded_rectangle([2, 4, 220, 56], radius=25, fill=(0, 0, 0, 255))
            # Dark orange bottom shadow of pill
            d.rounded_rectangle([4, 6, 218, 54], radius=24, fill=(220, 130, 0, 255))
            # Main golden yellow body
            d.rounded_rectangle([4, 6, 218, 51], radius=24, fill=(255, 208, 0, 255))
            # Top highlight
            d.rounded_rectangle([8, 8, 214, 24], radius=10, fill=(255, 235, 80, 255))
            
            pos = center_text_pos((0, 0, 222, 60), btext, font_btn)
            if is_p:
                pos = (pos[0], pos[1] + 2)
            d.text((pos[0] + 1, pos[1] + 2), btext, font=font_btn, fill=(90, 30, 0, 255), stroke_width=2, stroke_fill=(90, 30, 0, 255))
            d.text(pos, btext, font=font_btn, fill=(255, 140, 0, 255), stroke_width=2, stroke_fill=(120, 45, 0, 255))
            atlas.paste(sub, (bx, by))
            
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 4. TUTORIAL 0 (fDat129)
# ==========================================
def patch_tutorial0():
    bin_path = 'extracted/binaryData/141_com.fazecat.web.paladog.Library_fDat129.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_01: pos=(0, 570), size=(492, 188)
    # "Keyboard" -> "Bàn phím", "To Move" -> "Di chuyển"
    s01 = atlas.crop((0, 570, 492, 570 + 188))
    d01 = ImageDraw.Draw(s01)
    # Clear "To Move"
    d01.rounded_rectangle([305, 5, 485, 75], radius=15, fill=(255, 235, 20, 255))
    font_move = get_font(26)
    pos_move = center_text_pos((305, 5, 180, 70), "Di chuyển", font_move)
    draw_styled_text(d01, pos_move, "Di chuyển", font_move,
                     fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    # Clear "Keyboard"
    d01.rectangle([55, 95, 175, 128], fill=(255, 140, 0, 255))
    font_kb = get_font(18)
    draw_styled_text(d01, (60, 98), "Bàn phím", font_kb,
                     fill_color=(255, 240, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s01, (0, 570))
    
    # sub_02: pos=(0, 758), size=(746, 256)
    # "Food" / "Required to summon units" / "Keyboard"
    s02 = atlas.crop((0, 758, 746, 758 + 256))
    d02 = ImageDraw.Draw(s02)
    # Yellow bubble
    d02.rounded_rectangle([60, 5, 300, 110], radius=20, fill=(255, 235, 20, 255))
    font_f1 = get_font(28)
    font_f2 = get_font(16)
    draw_styled_text(d02, (135, 15), "Lương thực", font_f1,
                     fill_color=(255, 140, 0, 255), stroke_color=(80, 20, 0, 255), stroke_w=3)
    draw_styled_text(d02, (75, 58), "Dùng để triệu hồi lính", font_f2,
                     fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    # Keyboard
    d02.rectangle([590, 140, 700, 168], fill=(255, 140, 0, 255))
    draw_styled_text(d02, (595, 142), "Bàn phím", font_kb,
                     fill_color=(255, 240, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s02, (0, 758))
    
    # sub_03: pos=(0, 1014), size=(566, 338)
    # "Mana" / "Required for magic spells" / "Keyboard"
    s03 = atlas.crop((0, 1014, 566, 1014 + 338))
    d03 = ImageDraw.Draw(s03)
    # Blue bubble
    d03.rounded_rectangle([320, 5, 560, 105], radius=20, fill=(100, 215, 255, 255))
    draw_styled_text(d03, (380, 15), "Năng lượng", font_f1,
                     fill_color=(255, 240, 0, 255), stroke_color=(0, 60, 120, 255), stroke_w=3)
    draw_styled_text(d03, (330, 58), "Dùng để thi triển phép", font_f2,
                     fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    # Keyboard
    d03.rectangle([95, 220, 205, 248], fill=(255, 140, 0, 255))
    draw_styled_text(d03, (100, 222), "Bàn phím", font_kb,
                     fill_color=(255, 240, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s03, (0, 1014))
    
    # sub_04: pos=(0, 1352), size=(756, 228)
    # Labels: "Level", "Experience", "Health", "Enemy Base / Boss health", "Gold", "Pause"
    s04 = atlas.crop((0, 1352, 756, 1352 + 228))
    d04 = ImageDraw.Draw(s04)
    font_s = get_font(18)
    font_xs = get_font(15)
    
    # Level
    d04.rounded_rectangle([140, 115, 245, 160], radius=10, fill=(255, 255, 255, 255))
    draw_styled_text(d04, (155, 122), "Cấp độ", font_s, fill_color=(255, 200, 0, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    
    # Experience
    d04.rounded_rectangle([35, 170, 225, 215], radius=10, fill=(255, 255, 255, 255))
    draw_styled_text(d04, (45, 178), "Kinh nghiệm", font_s, fill_color=(255, 200, 0, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    
    # Health
    d04.rounded_rectangle([315, 180, 485, 260], radius=15, fill=(255, 255, 255, 255))
    draw_styled_text(d04, (370, 195), "Máu", font_f1, fill_color=(255, 200, 0, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    
    # Enemy Base / Boss health
    d04.rounded_rectangle([510, 180, 715, 260], radius=15, fill=(255, 255, 255, 255))
    draw_styled_text(d04, (525, 185), "Máu căn cứ /", font_xs, fill_color=(255, 200, 0, 255), stroke_color=(0, 0, 0, 255), stroke_w=2)
    draw_styled_text(d04, (540, 208), "Máu Boss", font_xs, fill_color=(255, 200, 0, 255), stroke_color=(0, 0, 0, 255), stroke_w=2)
    
    # Gold
    d04.rounded_rectangle([680, 85, 805, 130], radius=10, fill=(255, 255, 255, 255))
    draw_styled_text(d04, (710, 92), "Vàng", font_s, fill_color=(255, 200, 0, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    
    # Pause
    d04.rounded_rectangle([640, 140, 780, 185], radius=10, fill=(255, 255, 255, 255))
    draw_styled_text(d04, (655, 147), "Tạm dừng", font_s, fill_color=(255, 140, 0, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s04, (0, 1352))
    
    # sub_05: pos=(0, 1392), size=(494, 278)
    # TIP / Each unit can use a special skill within the aura range
    s05 = atlas.crop((0, 1392, 494, 1392 + 278))
    d05 = ImageDraw.Draw(s05)
    d05.rounded_rectangle([280, 10, 490, 185], radius=20, fill=(255, 235, 20, 255))
    draw_styled_text(d05, (360, 20), "MẸO", font_f1, fill_color=(255, 140, 0, 255), stroke_color=(80, 20, 0, 255), stroke_w=3)
    font_tip = get_font(17)
    draw_styled_text(d05, (290, 65), "Mỗi lính có thể dùng", font_tip, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d05, (290, 95), "kỹ năng đặc biệt trong", font_tip, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d05, (290, 125), "phạm vi hào quang", font_tip, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s05, (0, 1392))
    
    # sub_06: pos=(494, 1580), size=(482, 84)
    # LET THE BATTLE BEGIN / GOOD LUCK TO YOU.
    s06 = atlas.crop((494, 1580, 494 + 482, 1580 + 84))
    d06 = ImageDraw.Draw(s06)
    d06.rectangle([0, 0, 482, 84], fill=(0, 0, 0, 0))
    font_bt = get_font(30)
    pos_bt1 = center_text_pos((0, 0, 482, 42), "TRẬN CHIẾN BẮT ĐẦU", font_bt)
    pos_bt2 = center_text_pos((0, 42, 482, 42), "CHÚC BẠN MAY MẮN!", font_bt)
    draw_styled_text(d06, pos_bt1, "TRẬN CHIẾN BẮT ĐẦU", font_bt, fill_color=(255, 255, 255, 255), stroke_color=(0, 100, 180, 255), stroke_w=4)
    draw_styled_text(d06, pos_bt2, "CHÚC BẠN MAY MẮN!", font_bt, fill_color=(255, 255, 255, 255), stroke_color=(0, 100, 180, 255), stroke_w=4)
    atlas.paste(s06, (494, 1580))
    
    # sub_07 & sub_08: NEXT >
    font_next = get_font(28)
    for ax, ay, w, h in [(888, 0, 124, 94), (760, 0, 128, 88)]:
        sub_n = atlas.crop((ax, ay, ax + w, ay + h))
        dn = ImageDraw.Draw(sub_n)
        # Clear old NEXT text
        dn.rectangle([0, 35, 105, 85], fill=(0, 0, 0, 0))
        draw_styled_text(dn, (10, 42), "TIẾP", font_next, fill_color=(40, 255, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
        atlas.paste(sub_n, (ax, ay))
        
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 5. TUTORIAL 1 (fDat130)
# ==========================================
def patch_tutorial1():
    bin_path = 'extracted/binaryData/147_com.fazecat.web.paladog.Library_fDat130.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    font_kb = get_font(18)
    # sub_01: Keyboard
    s01 = atlas.crop((0, 1126, 728, 1126 + 246))
    d01 = ImageDraw.Draw(s01)
    d01.rectangle([580, 140, 695, 168], fill=(255, 140, 0, 255))
    draw_styled_text(d01, (585, 142), "Bàn phím", font_kb, fill_color=(255, 240, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s01, (0, 1126))
    
    # sub_03: Speech bubbles (Survive enemy waves...)
    s03 = atlas.crop((0, 1764, 418, 1764 + 274))
    d03 = ImageDraw.Draw(s03)
    d03.rounded_rectangle([5, 45, 410, 140], radius=15, fill=(100, 215, 255, 255))
    font_m = get_font(15)
    draw_styled_text(d03, (15, 55), "Sống sót qua các đợt quái", font_m, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d03, (15, 80), "cho đến khi tam giác vàng", font_m, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d03, (15, 105), "chạm tới lá cờ đỏ.", font_m, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    
    d03.rounded_rectangle([75, 155, 415, 265], radius=15, fill=(100, 215, 255, 255))
    draw_styled_text(d03, (85, 165), "Chú ý biểu tượng đầu lâu!", font_m, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d03, (85, 190), "Khi vượt qua, lượng lớn quân", font_m, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d03, (85, 215), "địch sẽ tấn công dồn dập!", font_m, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s03, (0, 1764))
    
    # sub_04: Destroy enemy units with your force and magic.
    s04 = atlas.crop((556, 1372, 556 + 338, 1372 + 54))
    d04 = ImageDraw.Draw(s04)
    d04.rectangle([0, 0, 338, 54], fill=(0, 0, 0, 0))
    font_d = get_font(18)
    draw_styled_text(d04, (10, 5), "Tiêu diệt kẻ địch bằng", font_d, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d04, (10, 28), "quân lính và phép thuật.", font_d, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s04, (556, 1372))
    
    # sub_05: Escort the carriage
    s05 = atlas.crop((0, 1372, 556, 1372 + 392))
    d05 = ImageDraw.Draw(s05)
    # Title
    d05.rectangle([10, 10, 240, 80], fill=(0, 0, 0, 0))
    font_c1 = get_font(26)
    draw_styled_text(d05, (15, 15), "Hộ tống", font_c1, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    draw_styled_text(d05, (15, 45), "xe hàng", font_c1, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    
    # Blue bubble
    d05.rounded_rectangle([270, 75, 550, 175], radius=15, fill=(100, 215, 255, 255))
    draw_styled_text(d05, (285, 95), "Đưa xe vận chuyển", font_m, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d05, (285, 125), "an toàn đến đích.", font_m, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    
    # Yellow bubble
    d05.rounded_rectangle([180, 290, 520, 380], radius=15, fill=(255, 235, 20, 255))
    font_f1 = get_font(18)
    draw_styled_text(d05, (230, 310), "Bảo vệ cỗ xe", font_f1, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d05, (230, 345), "bằng mọi giá!", font_f1, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s05, (0, 1372))
    
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 6. TUTORIAL 2 (fDat131)
# ==========================================
def patch_tutorial2():
    bin_path = 'extracted/binaryData/146_com.fazecat.web.paladog.Library_fDat131.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_01: Battlefield mode
    s01 = atlas.crop((556, 782, 556 + 394, 782 + 540))
    d01 = ImageDraw.Draw(s01)
    font_h = get_font(26)
    font_p = get_font(17)
    d01.rectangle([0, 0, 394, 180], fill=(0, 0, 0, 0))
    draw_styled_text(d01, (10, 5), "Chiến trường", font_h, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    draw_styled_text(d01, (10, 42), "Bạn phải tiến lên", font_p, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d01, (10, 68), "phía trước trên", font_p, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d01, (10, 94), "chiến trường.", font_p, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    
    # Bubble: To advance
    d01.rounded_rectangle([10, 260, 385, 410], radius=15, fill=(100, 215, 255, 255))
    draw_styled_text(d01, (25, 240), "Để tiến lên:", font_h, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    draw_styled_text(d01, (25, 290), "1. Chọn lính", font_p, fill_color=(0, 0, 0, 255), stroke_color=None)
    draw_styled_text(d01, (25, 330), "2. Chạm đường để tiến", font_p, fill_color=(0, 0, 0, 255), stroke_color=None)
    atlas.paste(s01, (556, 782))
    
    # sub_02: Keyboard
    s02 = atlas.crop((0, 570, 738, 570 + 212))
    d02 = ImageDraw.Draw(s02)
    d02.rectangle([55, 95, 175, 128], fill=(255, 140, 0, 255))
    draw_styled_text(d02, (60, 98), "Bàn phím", get_font(18), fill_color=(255, 240, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s02, (0, 570))
    
    # sub_03 & sub_04: Tactics
    for sy, sh in [(1202, 348), (782, 420)]:
        sub = atlas.crop((0, sy, 556 if sh==420 else 532, sy + sh))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([5, 5, 520, 210], radius=15, fill=(105, 50, 170, 255))
        draw_styled_text(d, (20, 15), "Chỉ huy quân bằng 3 chiến thuật:", get_font(20), fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
        draw_styled_text(d, (95, 60), "Xếp lính theo hàng dọc", get_font(20), fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
        draw_styled_text(d, (95, 115), "Xếp lính theo hàng ngang", get_font(20), fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
        draw_styled_text(d, (95, 170), "Hồi phục toàn bộ máu", get_font(20), fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
        if sh == 420:
            d.rectangle([10, 360, 220, 400], fill=(255, 140, 0, 255))
            draw_styled_text(d, (15, 365), "DÙNG PHÉP", get_font(18), fill_color=(255, 240, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
        atlas.paste(sub, (0, sy))
        
    # sub_05: Break through...
    s05 = atlas.crop((0, 1550, 532, 1550 + 280))
    d05 = ImageDraw.Draw(s05)
    d05.rounded_rectangle([5, 55, 525, 275], radius=20, fill=(255, 235, 20, 255))
    font_g = get_font(17)
    draw_styled_text(d05, (15, 68), "Đẩy lùi tiền tuyến địch để tăng thanh xanh,", font_g, fill_color=(0, 0, 0, 255), stroke_color=None)
    draw_styled_text(d05, (15, 95), "thanh đỏ sẽ tăng khi phòng thủ bị yếu đi.", font_g, fill_color=(0, 0, 0, 255), stroke_color=None)
    draw_styled_text(d05, (15, 175), "Thanh xanh đầy: Chiến thắng", get_font(20), fill_color=(0, 180, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    draw_styled_text(d05, (15, 235), "Thanh đỏ đầy: Thất bại", get_font(20), fill_color=(255, 40, 0, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s05, (0, 1550))
    
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 7. TUTORIAL 3 (fDat132 - NEXT >)
# ==========================================
def patch_tutorial3():
    bin_path = 'extracted/binaryData/145_com.fazecat.web.paladog.Library_fDat132.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    font_next = get_font(28)
    for ax, ay, w, h in [(884, 0, 120, 84), (760, 0, 124, 84)]:
        sub_n = atlas.crop((ax, ay, ax + w, ay + h))
        dn = ImageDraw.Draw(sub_n)
        dn.rectangle([0, 30, 95, 80], fill=(0, 0, 0, 0))
        draw_styled_text(dn, (10, 36), "TIẾP", font_next, fill_color=(40, 255, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
        atlas.paste(sub_n, (ax, ay))
        
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 8. TUTORIAL 4 (fDat133)
# ==========================================
def patch_tutorial4():
    bin_path = 'extracted/binaryData/144_com.fazecat.web.paladog.Library_fDat133.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_00: MOVE / MACE
    s00 = atlas.crop((0, 976, 714, 976 + 254))
    d00 = ImageDraw.Draw(s00)
    font_l = get_font(24)
    # Clear "MOVE"
    d00.rectangle([30, 70, 170, 105], fill=(0, 0, 0, 0))
    draw_styled_text(d00, (30, 72), "DI CHUYỂN", font_l, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    # Clear "MACE"
    d00.rectangle([540, 60, 680, 95], fill=(0, 0, 0, 0))
    draw_styled_text(d00, (540, 62), "PHÉP THUẬT", font_l, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    atlas.paste(s00, (0, 976))
    
    # sub_01: PAUSE / UNIT SELECT
    s01 = atlas.crop((0, 0, 748, 484))
    d01 = ImageDraw.Draw(s01)
    d01.rectangle([780, 85, 875, 115], fill=(0, 0, 0, 0))
    draw_styled_text(d01, (580, 88), "TẠM DỪNG", font_l, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    d01.rectangle([20, 305, 260, 340], fill=(0, 0, 0, 0))
    draw_styled_text(d01, (25, 308), "CHỌN LÍNH", font_l, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    atlas.paste(s01, (0, 0))
    
    # sub_02: MOUSE / EVERY CONTROL CAN ALSO BE MADE WITH THE MOUSE.
    s02 = atlas.crop((0, 1230, 604, 1230 + 198))
    d02 = ImageDraw.Draw(s02)
    d02.rectangle([0, 160, 604, 198], fill=(0, 0, 0, 0))
    font_msg = get_font(18)
    pos_mouse = center_text_pos((0, 160, 604, 38), "MỌI THAO TÁC CŨNG CÓ THỂ DÙNG CHUỘT.", font_msg)
    draw_styled_text(d02, pos_mouse, "MỌI THAO TÁC CŨNG CÓ THỂ DÙNG CHUỘT.", font_msg, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
    atlas.paste(s02, (0, 1230))
    
    # sub_03: UNIT & MACE SELECT
    s03 = atlas.crop((0, 730, 736, 730 + 246))
    d03 = ImageDraw.Draw(s03)
    d03.rectangle([20, 75, 380, 110], fill=(0, 0, 0, 0))
    draw_styled_text(d03, (25, 78), "CHỌN LÍNH & PHÉP", font_l, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    atlas.paste(s03, (0, 730))
    
    # sub_04: UNIT SELECT
    s04 = atlas.crop((0, 484, 738, 484 + 246))
    d04 = ImageDraw.Draw(s04)
    d04.rectangle([20, 75, 260, 110], fill=(0, 0, 0, 0))
    draw_styled_text(d04, (25, 78), "CHỌN LÍNH", font_l, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    atlas.paste(s04, (0, 484))
    
    # sub_05: LINE SELECT
    s05 = atlas.crop((748, 256, 748 + 260, 256 + 350))
    d05 = ImageDraw.Draw(s05)
    d05.rectangle([80, 45, 250, 80], fill=(0, 0, 0, 0))
    draw_styled_text(d05, (85, 48), "CHỌN LÀN", font_l, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    atlas.paste(s05, (748, 256))
    
    # sub_06: SKILL ACTIVATE
    s06 = atlas.crop((748, 0, 748 + 264, 256))
    d06 = ImageDraw.Draw(s06)
    d06.rectangle([80, 65, 250, 100], fill=(0, 0, 0, 0))
    draw_styled_text(d06, (85, 68), "DÙNG PHÉP", font_l, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
    atlas.paste(s06, (748, 0))
    
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 9. PAUSE (fDat117)
# ==========================================
def patch_pause():
    bin_path = 'extracted/binaryData/180_com.fazecat.web.paladog.Library_fDat117.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    font_btn = get_font(28)
    # sub_01 & sub_02: GIVE UP -> BỎ CUỘC
    # sub_01: (204, 250, 204, 66)
    # sub_02: (0, 382, 204, 66)
    for bx, by in [(204, 250), (0, 382)]:
        sub = atlas.crop((bx, by, bx + 204, by + 66))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([15, 8, 189, 58], radius=15, fill=(230, 25, 25, 255))
        pos = center_text_pos((0, 0, 204, 66), "BỎ CUỘC", font_btn)
        draw_styled_text(d, pos, "BỎ CUỘC", font_btn, fill_color=(255, 255, 255, 255), stroke_color=(30, 0, 0, 255), stroke_w=5)
        atlas.paste(sub, (bx, by))
        
    # sub_03 & sub_04: RESUME -> TIẾP TỤC
    # sub_03: (0, 316, 204, 66)
    # sub_04: (0, 250, 204, 66)
    for bx, by in [(0, 316), (0, 250)]:
        sub = atlas.crop((bx, by, bx + 204, by + 66))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([15, 8, 189, 58], radius=15, fill=(255, 195, 0, 255))
        pos = center_text_pos((0, 0, 204, 66), "TIẾP TỤC", font_btn)
        draw_styled_text(d, pos, "TIẾP TỤC", font_btn, fill_color=(255, 255, 255, 255), stroke_color=(40, 25, 0, 255), stroke_w=5)
        atlas.paste(sub, (bx, by))
        
    # sub_06: GET READY! -> CHUẨN BỊ!
    # pos=(0, 448), size=(358, 60)
    s06 = atlas.crop((0, 448, 358, 448 + 60))
    d06 = ImageDraw.Draw(s06)
    d06.rectangle([0, 0, 358, 60], fill=(0, 0, 0, 0))
    font_gr = get_font(34)
    pos_gr = center_text_pos((0, 0, 358, 60), "CHUẨN BỊ!", font_gr)
    draw_styled_text(d06, pos_gr, "CHUẨN BỊ!", font_gr,
                     fill_color=(255, 175, 0, 255), stroke_color=(0, 80, 160, 255), stroke_w=5,
                     shadow_offset=(2, 3), shadow_color=(0, 40, 90, 255))
    atlas.paste(s06, (0, 448))
    
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 10. MENU (fDat112)
# ==========================================
def patch_menu():
    bin_path = 'extracted/binaryData/185_com.fazecat.web.paladog.Library_fDat112.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_02: START -> BẮT ĐẦU (172, 86) at pos=(818, 296)
    s02 = atlas.crop((818, 296, 818 + 172, 296 + 86))
    d02 = ImageDraw.Draw(s02)
    d02.rounded_rectangle([15, 10, 157, 76], radius=15, fill=(35, 195, 235, 255))
    pos_st = center_text_pos((0, 0, 172, 86), "BẮT ĐẦU", get_font(26))
    draw_styled_text(d02, pos_st, "BẮT ĐẦU", get_font(26), fill_color=(255, 255, 255, 255), stroke_color=(10, 40, 50, 255), stroke_w=5)
    atlas.paste(s02, (818, 296))
    
    # sub_14 & sub_15: DELETE -> XÓA (160, 74) at (646, 384) and (818, 382)
    for bx, by in [(646, 384), (818, 382)]:
        sub = atlas.crop((bx, by, bx + 160, by + 74))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([10, 10, 150, 64], radius=12, fill=(200, 20, 20, 255))
        pos_del = center_text_pos((0, 0, 160, 74), "XÓA", get_font(30))
        draw_styled_text(d, pos_del, "XÓA", get_font(30), fill_color=(255, 255, 255, 255), stroke_color=(30, 0, 0, 255), stroke_w=5)
        atlas.paste(sub, (bx, by))
        
    # sub_16 to sub_19: Difficulties (EASY, NORMAL, HARD, HELL)
    # sub_16: EASY -> DỄ at (210, 992, 84, 32)
    # sub_17: NORMAL -> THƯỜNG at (0, 992, 124, 32)
    # sub_18: HARD -> KHÓ at (124, 992, 86, 32)
    # sub_19: HELL -> ĐỊA NGỤC at (294, 992, 72, 32)
    diffs = [
        (210, 992, 84, 32, "DỄ"),
        (0, 992, 124, 32, "THƯỜNG"),
        (124, 992, 86, 32, "KHÓ"),
        (294, 992, 72, 32, "CỰC KHÓ"),
    ]
    font_diff = get_font(18)
    for bx, by, bw, bh, text in diffs:
        sub = atlas.crop((bx, by, bx + bw, by + bh))
        d = ImageDraw.Draw(sub)
        d.rectangle([0, 0, bw, bh], fill=(0, 0, 0, 0))
        pos = center_text_pos((0, 0, bw, bh), text, font_diff)
        draw_styled_text(d, pos, text, font_diff, fill_color=(255, 80, 0, 255), stroke_color=(0, 0, 0, 255), stroke_w=3)
        atlas.paste(sub, (bx, by))
        
    # sub_20 & sub_21: YES -> CÓ (146, 64)
    # sub_22 & sub_23: NO -> KHÔNG (146, 64)
    for bx, by, text in [(560, 522, "CÓ"), (792, 520, "CÓ"), (646, 458, "KHÔNG"), (806, 456, "KHÔNG")]:
        sub = atlas.crop((bx, by, bx + 146, by + 64))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([10, 8, 136, 56], radius=15, fill=(255, 205, 0, 255))
        pos = center_text_pos((0, 0, 146, 64), text, get_font(24))
        draw_styled_text(d, pos, text, get_font(24), fill_color=(255, 255, 255, 255), stroke_color=(40, 20, 0, 255), stroke_w=4)
        atlas.paste(sub, (bx, by))
        
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 11. STORE (fDat123)
# ==========================================
def patch_store():
    bin_path = 'extracted/binaryData/139_com.fazecat.web.paladog.Library_fDat123.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    font_sbtn = get_font(22)
    # sub_00 & sub_01: BUY -> MUA (132, 58) at (1434, 816) and (1318, 874)
    for bx, by in [(1434, 816), (1318, 874)]:
        sub = atlas.crop((bx, by, bx + 132, by + 58))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([10, 6, 122, 52], radius=14, fill=(255, 200, 0, 255))
        pos = center_text_pos((0, 0, 132, 58), "MUA", font_sbtn)
        draw_styled_text(d, pos, "MUA", font_sbtn, fill_color=(255, 255, 255, 255), stroke_color=(40, 20, 0, 255), stroke_w=4)
        atlas.paste(sub, (bx, by))
        
    # sub_06 & sub_07: SELL -> BÁN (132, 58) at (1302, 816) and (1170, 816)
    for bx, by in [(1302, 816), (1170, 816)]:
        sub = atlas.crop((bx, by, bx + 132, by + 58))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([10, 6, 122, 52], radius=14, fill=(210, 30, 20, 255))
        pos = center_text_pos((0, 0, 132, 58), "BÁN", font_sbtn)
        draw_styled_text(d, pos, "BÁN", font_sbtn, fill_color=(255, 255, 255, 255), stroke_color=(40, 5, 0, 255), stroke_w=4)
        atlas.paste(sub, (bx, by))
        
    # sub_19 & sub_20: UNEQUIP -> THÁO (150, 58) at (1276, 964) and (1168, 882)
    for bx, by in [(1276, 964), (1168, 882)]:
        sub = atlas.crop((bx, by, bx + 150, by + 58))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([10, 6, 140, 52], radius=14, fill=(210, 30, 20, 255))
        pos = center_text_pos((0, 0, 150, 58), "THÁO", font_sbtn)
        draw_styled_text(d, pos, "THÁO", font_sbtn, fill_color=(255, 255, 255, 255), stroke_color=(40, 5, 0, 255), stroke_w=4)
        atlas.paste(sub, (bx, by))
        
    # sub_23 to sub_25: UPGRADE -> NÂNG CẤP (204, 66) at (966, 816), (964, 882), (760, 882)
    for bx, by in [(966, 816), (964, 882), (760, 882)]:
        sub = atlas.crop((bx, by, bx + 204, by + 66))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([10, 8, 194, 58], radius=16, fill=(110, 110, 110, 255))
        pos = center_text_pos((0, 0, 204, 66), "NÂNG CẤP", get_font(24))
        draw_styled_text(d, pos, "NÂNG CẤP", get_font(24), fill_color=(255, 255, 255, 255), stroke_color=(20, 20, 20, 255), stroke_w=4)
        atlas.paste(sub, (bx, by))
        
    # sub_08 & sub_09: SHOP > -> CỬA HÀNG > (148, 54) at (1562, 726) and (1128, 972)
    # sub_10 & sub_11: < SHOP -> < CỬA HÀNG (148, 54) at (1558, 952) and (980, 972)
    for bx, by, text in [(1562, 726, "CỬA HÀNG >"), (1128, 972, "CỬA HÀNG >"), (1558, 952, "< CỬA HÀNG"), (980, 972, "< CỬA HÀNG")]:
        sub = atlas.crop((bx, by, bx + 148, by + 54))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([8, 6, 140, 48], radius=16, fill=(190, 80, 30, 255))
        pos = center_text_pos((0, 0, 148, 54), text, get_font(14))
        draw_styled_text(d, pos, text, get_font(14), fill_color=(255, 255, 255, 255), stroke_color=(50, 15, 0, 255), stroke_w=3)
        atlas.paste(sub, (bx, by))
        
    # sub_02 to sub_05: HERO > -> TƯỚNG > (148, 54)
    for bx, by in [(1710, 726), (1714, 804), (1598, 856), (1566, 804)]:
        sub = atlas.crop((bx, by, bx + 148, by + 52))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([8, 6, 140, 46], radius=16, fill=(190, 80, 30, 255))
        pos = center_text_pos((0, 0, 148, 52), "TƯỚNG >", get_font(16))
        draw_styled_text(d, pos, "TƯỚNG >", get_font(16), fill_color=(255, 255, 255, 255), stroke_color=(50, 15, 0, 255), stroke_w=3)
        atlas.paste(sub, (bx, by))
        
    # sub_21 & sub_22: < UNIT -> < QUÂN LÍNH (148, 54)
    for bx, by in [(1450, 874), (832, 972)]:
        sub = atlas.crop((bx, by, bx + 148, by + 52))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([8, 6, 140, 46], radius=16, fill=(190, 80, 30, 255))
        pos = center_text_pos((0, 0, 148, 52), "< QUÂN LÍNH", get_font(14))
        draw_styled_text(d, pos, "< QUÂN LÍNH", get_font(14), fill_color=(255, 255, 255, 255), stroke_color=(50, 15, 0, 255), stroke_w=3)
        atlas.paste(sub, (bx, by))
        
    # sub_30: LOCK -> KHÓA (66, 20) at (0, 1002)
    s30 = atlas.crop((0, 1002, 66, 1002 + 20))
    d30 = ImageDraw.Draw(s30)
    d30.rectangle([0, 0, 66, 20], fill=(0, 0, 0, 0))
    pos_lock = center_text_pos((0, 0, 66, 20), "KHÓA", get_font(14))
    draw_styled_text(d30, pos_lock, "KHÓA", get_font(14), fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=2)
    atlas.paste(s30, (0, 1002))
    
    # sub_35: NEED MORE GOLD -> THIẾU VÀNG (132, 58) at (1426, 964)
    s35 = atlas.crop((1426, 964, 1426 + 132, 964 + 58))
    d35 = ImageDraw.Draw(s35)
    d35.rounded_rectangle([10, 6, 122, 52], radius=14, fill=(130, 130, 130, 255))
    pos_gold = center_text_pos((0, 0, 132, 58), "THIẾU VÀNG", get_font(16))
    draw_styled_text(d35, pos_gold, "THIẾU VÀNG", get_font(16), fill_color=(220, 220, 220, 255), stroke_color=(40, 40, 40, 255), stroke_w=3)
    atlas.paste(s35, (1426, 964))
    
    # sub_64 to sub_72: Unit Titles in Store
    unit_titles = [
        (64, 0, 978, 316, 24, "CHUỘT ĐẤU SĨ"),
        (65, 1562, 780, 200, 24, "THỎ CUNG THỦ"),
        (66, 316, 978, 266, 24, "GẤU HỘ VỆ"),
        (67, 582, 978, 250, 24, "CHUỘT TÚI VÕ SĨ"),
        (68, 1002, 948, 238, 24, "RÙA PHÒNG THỦ"),
        (69, 1240, 940, 226, 24, "KHỈ CƯỚP BIỂN"),
        (70, 1762, 780, 136, 24, "TÊ GIÁC TINH NHUỆ"),
        (71, 760, 948, 242, 24, "CÁNH CỤT PHÁP SƯ"),
        (72, 1466, 928, 200, 24, "RỒNG HỒNG"),
    ]
    font_ut = get_font(17)
    for s_idx, ux, uy, uw, uh, utext in unit_titles:
        sub_u = atlas.crop((ux, uy, ux + uw, uy + uh))
        du = ImageDraw.Draw(sub_u)
        du.rectangle([0, 0, uw, uh], fill=(0, 0, 0, 0))
        pos_u = center_text_pos((0, 0, uw, uh), utext, font_ut)
        draw_styled_text(du, pos_u, utext, font_ut,
                         fill_color=(255, 235, 20, 255),
                         stroke_color=(0, 0, 0, 255), stroke_w=3)
        atlas.paste(sub_u, (ux, uy))
        
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 12. STAGECLEAR (fDat121)
# ==========================================
def patch_stageclear():
    bin_path = 'extracted/binaryData/189_com.fazecat.web.paladog.Library_fDat121.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_00: pos=(0, 0), size=(530, 352)
    # LEVEL CLEARED -> VƯỢT ẢI THÀNH CÔNG
    # CLEAR BONUS: -> THƯỞNG VƯỢT ẢI:
    s00 = atlas.crop((0, 0, 530, 352))
    d00 = ImageDraw.Draw(s00)
    d00.rectangle([15, 20, 340, 75], fill=(230, 180, 120, 255))
    font_lc = get_font(26)
    draw_styled_text(d00, (20, 26), "VƯỢT ẢI THÀNH CÔNG", font_lc, fill_color=(255, 140, 0, 255), stroke_color=(0, 120, 160, 255), stroke_w=3)
    
    d00.rectangle([55, 78, 245, 108], fill=(43, 26, 15, 255))
    font_cb = get_font(16)
    draw_styled_text(d00, (60, 82), "THƯỞNG VƯỢT ẢI:", font_cb, fill_color=(255, 235, 20, 255), stroke_color=(0, 0, 0, 255), stroke_w=2)
    atlas.paste(s00, (0, 0))
    
    # sub_02 & sub_03: NEXT -> TIẾP (188, 76) at (0, 428) and (0, 352)
    font_next = get_font(32)
    for bx, by in [(0, 428), (0, 352)]:
        sub = atlas.crop((bx, by, bx + 188, by + 76))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([20, 10, 165, 66], radius=15, fill=(140, 180, 20, 255))
        pos = center_text_pos((0, 0, 188, 76), "TIẾP", font_next)
        draw_styled_text(d, pos, "TIẾP", font_next, fill_color=(255, 255, 255, 255), stroke_color=(20, 30, 0, 255), stroke_w=5)
        atlas.paste(sub, (bx, by))
        
    # sub_05: NEW RECORD! -> KỶ LỤC MỚI! (158, 28) at (188, 464)
    s05 = atlas.crop((188, 464, 188 + 158, 464 + 28))
    d05 = ImageDraw.Draw(s05)
    d05.rectangle([0, 0, 158, 28], fill=(55, 38, 28, 255))
    pos_rec = center_text_pos((0, 0, 158, 28), "KỶ LỤC MỚI!", get_font(15))
    draw_styled_text(d05, pos_rec, "KỶ LỤC MỚI!", get_font(15), fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=2)
    atlas.paste(s05, (188, 464))
    
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 13. STAGESELECT (fDat122)
# ==========================================
def patch_stageselect():
    bin_path = 'extracted/binaryData/190_com.fazecat.web.paladog.Library_fDat122.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_22 & sub_23: < UPGRADE -> < NÂNG CẤP (236, 66) at (1550, 928) and (1550, 862)
    font_up = get_font(24)
    for bx, by in [(1550, 928), (1550, 862)]:
        sub = atlas.crop((bx, by, bx + 236, by + 66))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([10, 8, 226, 58], radius=16, fill=(65, 20, 140, 255))
        pos = center_text_pos((0, 0, 236, 66), "< NÂNG CẤP", font_up)
        draw_styled_text(d, pos, "< NÂNG CẤP", font_up, fill_color=(255, 140, 0, 255), stroke_color=(0, 0, 0, 255), stroke_w=4)
        atlas.paste(sub, (bx, by))
        
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 14. FAIL (fDat92)
# ==========================================
def patch_fail():
    bin_path = 'extracted/binaryData/164_com.fazecat.web.paladog.Library_fDat92.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_00: MISSION FAILED -> THẤT BẠI (552, 78) at (0, 327)
    s00 = atlas.crop((0, 327, 552, 327 + 78))
    d00 = ImageDraw.Draw(s00)
    d00.rectangle([0, 0, 552, 78], fill=(0, 0, 0, 0))
    font_fail = get_font(48)
    pos_fail = center_text_pos((0, 0, 552, 78), "THẤT BẠI", font_fail)
    draw_styled_text(d00, pos_fail, "THẤT BẠI", font_fail,
                     fill_color=(255, 255, 255, 255), stroke_color=(180, 0, 0, 255), stroke_w=6,
                     shadow_offset=(2, 4), shadow_color=(100, 0, 0, 255))
    atlas.paste(s00, (0, 327))
    
    # sub_02 & sub_03: NEXT > -> TIẾP (204, 66) at (204, 405) and (0, 405)
    font_next = get_font(28)
    for bx, by in [(204, 405), (0, 405)]:
        sub = atlas.crop((bx, by, bx + 204, by + 66))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([15, 8, 189, 58], radius=15, fill=(140, 180, 20, 255))
        pos = center_text_pos((0, 0, 204, 66), "TIẾP", font_next)
        draw_styled_text(d, pos, "TIẾP", font_next, fill_color=(255, 255, 255, 255), stroke_color=(20, 30, 0, 255), stroke_w=5)
        atlas.paste(sub, (bx, by))
        
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 15. CHAPTERCLEAR (fDat33)
# ==========================================
def patch_chapterclear():
    bin_path = 'extracted/binaryData/203_com.fazecat.web.paladog.Library_fDat33.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_00: Chapter CLEAR -> HOÀN THÀNH CHƯƠNG (190, 82) at (1523, 1)
    s00 = atlas.crop((1523, 1, 1523 + 190, 1 + 82))
    d00 = ImageDraw.Draw(s00)
    d00.rectangle([0, 0, 190, 82], fill=(0, 0, 0, 0))
    font_cc = get_font(18)
    draw_styled_text(d00, (15, 10), "HOÀN THÀNH", font_cc, fill_color=(255, 200, 0, 255), stroke_color=(120, 40, 0, 255), stroke_w=3)
    draw_styled_text(d00, (35, 42), "CHƯƠNG", get_font(26), fill_color=(255, 240, 20, 255), stroke_color=(120, 40, 0, 255), stroke_w=4)
    atlas.paste(s00, (1523, 1))
    
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 16. CINEMABTN (fDat39)
# ==========================================
def patch_cinemabtn():
    bin_path = 'extracted/binaryData/211_com.fazecat.web.paladog.Library_fDat39.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_00 & sub_01: NEXT -> TIẾP
    font_next = get_font(24)
    draw = ImageDraw.Draw(atlas)
    draw.rectangle([0, 0, 100, 100], fill=(0, 0, 0, 0))
    draw_styled_text(draw, (10, 10), "TIẾP", font_next, fill_color=(240, 210, 80, 255), stroke_color=(40, 30, 0, 255), stroke_w=3)
    draw_styled_text(draw, (10, 45), "TIẾP", font_next, fill_color=(200, 170, 50, 255), stroke_color=(40, 30, 0, 255), stroke_w=3)
    
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 17. EVENTBTN (fDat90)
# ==========================================
def patch_eventbtn():
    bin_path = 'extracted/binaryData/167_com.fazecat.web.paladog.Library_fDat90.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    font_btn = get_font(20)
    # sub_0 & sub_1: NEXT > -> TIẾP > (148, 52) at (0, 158) and (0, 106) (screen x=599, bottom-right)
    for bx, by in [(0, 158), (0, 106)]:
        sub = atlas.crop((bx, by, bx + 148, by + 52))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([8, 6, 140, 46], radius=20, fill=(140, 195, 20, 255))
        pos = center_text_pos((0, 0, 148, 52), "TIẾP >", font_btn)
        draw_styled_text(d, pos, "TIẾP >", font_btn, fill_color=(255, 255, 255, 255), stroke_color=(30, 45, 0, 255), stroke_w=4)
        atlas.paste(sub, (bx, by))
        
    # sub_2 & sub_3: SKIP -> BỎ QUA (148, 54) at (0, 0) and (0, 54) (screen x=12, bottom-left)
    for bx, by in [(0, 0), (0, 54)]:
        sub = atlas.crop((bx, by, bx + 148, by + 52))
        d = ImageDraw.Draw(sub)
        d.rounded_rectangle([8, 6, 140, 46], radius=20, fill=(185, 80, 30, 255))
        pos = center_text_pos((0, 0, 148, 52), "BỎ QUA", font_btn)
        draw_styled_text(d, pos, "BỎ QUA", font_btn, fill_color=(255, 255, 255, 255), stroke_color=(60, 20, 0, 255), stroke_w=4)
        atlas.paste(sub, (bx, by))
        
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 18. LEVELUP (fDat96)
# ==========================================
def patch_levelup():
    bin_path = 'extracted/binaryData/158_com.fazecat.web.paladog.Library_fDat96.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_01: PICK A SKILL -> CHỌN KỸ NĂNG (270, 46) at (0, 570)
    s01 = atlas.crop((0, 570, 270, 570 + 46))
    d01 = ImageDraw.Draw(s01)
    d01.rectangle([0, 0, 270, 46], fill=(0, 0, 0, 0))
    font_pick = get_font(24)
    pos_pick = center_text_pos((0, 0, 270, 46), "CHỌN KỸ NĂNG", font_pick)
    draw_styled_text(d01, pos_pick, "CHỌN KỸ NĂNG", font_pick,
                     fill_color=(255, 175, 20, 255),
                     stroke_color=(0, 0, 0, 255), stroke_w=4,
                     shadow_offset=(2, 2), shadow_color=(80, 25, 0, 255))
    atlas.paste(s01, (0, 570))
    
    repack_fdat_bin(bin_path, atlas)

# ==========================================
# 19. SKILLINFOR (fDat120)
# ==========================================
def patch_skillinfor():
    bin_path = 'extracted/binaryData/188_com.fazecat.web.paladog.Library_fDat120.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 32 * n
    atlas = Image.open(io_bytes(data[header_size:])).convert('RGBA')
    
    # sub_25: UPGRADE -> NÂNG CẤP (180, 46) at (0, 948)
    s25 = atlas.crop((0, 948, 180, 948 + 46))
    d25 = ImageDraw.Draw(s25)
    d25.rectangle([0, 0, 180, 46], fill=(0, 0, 0, 0))
    font_up = get_font(22)
    pos_up = center_text_pos((0, 0, 180, 46), "NÂNG CẤP", font_up)
    # Glow + stroke + fill
    d25.text(pos_up, "NÂNG CẤP", font=font_up, fill=(255, 235, 0, 255), stroke_width=6, stroke_fill=(255, 235, 0, 255))
    d25.text(pos_up, "NÂNG CẤP", font=font_up, fill=(0, 0, 0, 255), stroke_width=4, stroke_fill=(0, 0, 0, 255))
    d25.text(pos_up, "NÂNG CẤP", font=font_up, fill=(0, 225, 255, 255))
    atlas.paste(s25, (0, 948))
    
    # sub_00 to sub_22: 23 Skills (Title + Desc)
    skills = [
        ("Học Hỏi", "Tăng điểm kinh nghiệm\nnhận được"),
        ("May Mắn", "Tăng lượng vàng\nnhận được"),
        ("Săn Kho Báu", "Tăng tỉ lệ nhặt\nvật phẩm"),
        ("Máu Tối Đa", "Tăng lượng máu\ntối đa"),
        ("Hồi Máu", "Từ từ hồi phục\nlượng máu"),
        ("Phòng Thủ", "Giảm sát thương\nnhận từ kẻ địch"),
        ("Cưỡi Ngựa", "Di chuyển\nnhanh hơn"),
        ("Năng Lượng", "Tăng lượng năng lượng\ntối đa"),
        ("Cầu Nguyện", "Tăng tốc độ hồi\nnăng lượng"),
        ("Thuật Ma Pháp", "Giảm lượng tiêu hao\nnăng lượng"),
        ("Trồng Trọt", "Tăng tốc độ tạo\nlương thực"),
        ("Kho Lương", "Tăng lượng lương thực\ntối đa"),
        ("Chỉ Huy", "Triệu hồi quân lính\nnhanh hơn"),
        ("Hào Quang Tốc Độ", "Tăng tốc độ di chuyển\ncủa quân trong hào quang"),
        ("Hào Quang Chiến Đấu", "Tăng sức tấn công\ncủa quân trong hào quang"),
        ("Hào Quang Phòng Thủ", "Tăng phòng thủ\ncủa quân trong hào quang"),
        ("Hào Quang Nhanh Nhẹn", "Giảm giãn cách đòn đánh\ncủa quân trong hào quang"),
        ("Hào Quang Kỹ Năng", "Tăng tỉ lệ xuất kỹ năng\ncủa quân trong hào quang"),
        ("Mở Rộng Hào Quang", "Tăng phạm vi\ncủa hào quang"),
        ("Hào Quang Hồi Máu", "Từ từ hồi máu cho\nquân trong hào quang"),
        ("Hào Quang Cuồng Nộ", "Quân tăng mạnh sức đánh\nkhi máu dưới 30%"),
        ("Bậc Thầy Gậy Phép", "Cộng cấp kỹ năng này\nvào gậy phép đang dùng"),
        ("Bậc Thầy Nhẫn Phép", "Cộng cấp kỹ năng này\nvào nhẫn đang dùng"),
    ]
    
    font_title = get_font(18)
    font_desc = get_font(12)
    
    for i in range(23):
        vals = struct.unpack('<8i', data[4 + i * 32 : 4 + (i + 1) * 32])
        bx, by, bw, bh = vals[0], vals[1], vals[6], vals[7]
        sub = atlas.crop((bx, by, bx + bw, by + bh))
        d = ImageDraw.Draw(sub)
        d.rectangle([0, 0, bw, bh], fill=(0, 0, 0, 0))
        
        stitle, sdesc = skills[i]
        
        # Title
        t_bbox = font_title.getbbox(stitle)
        tw = t_bbox[2] - t_bbox[0]
        tx = (bw - tw) // 2
        ty = 5
        d.text((tx, ty), stitle, font=font_title, fill=(255, 235, 0, 255), stroke_width=5, stroke_fill=(255, 235, 0, 255))
        d.text((tx, ty), stitle, font=font_title, fill=(0, 0, 0, 255), stroke_width=3, stroke_fill=(0, 0, 0, 255))
        d.text((tx, ty), stitle, font=font_title, fill=(0, 225, 255, 255))
        
        # Desc lines
        lines = sdesc.split('\n')
        line_h = 20
        start_y = 38
        for l_idx, line_txt in enumerate(lines):
            l_bbox = font_desc.getbbox(line_txt)
            lw = l_bbox[2] - l_bbox[0]
            lx = (bw - lw) // 2
            ly = start_y + l_idx * line_h
            draw_styled_text(d, (lx, ly), line_txt, font_desc,
                             fill_color=(255, 255, 255, 255),
                             stroke_color=(0, 0, 0, 255), stroke_w=3)
                             
        atlas.paste(sub, (bx, by))
        
    repack_fdat_bin(bin_path, atlas)

def io_bytes(b):
    import io
    return io.BytesIO(b)

def patch_all():
    print('Starting patch of all UI spritesheets...')
    patch_loading()
    patch_titlebtn()
    patch_option()
    patch_tutorial0()
    patch_tutorial1()
    patch_tutorial2()
    patch_tutorial3()
    patch_tutorial4()
    patch_pause()
    patch_menu()
    patch_store()
    patch_stageclear()
    patch_stageselect()
    patch_fail()
    patch_chapterclear()
    patch_cinemabtn()
    patch_eventbtn()
    patch_levelup()
    patch_skillinfor()
    print('ALL 19 UI SPRITESHEETS PATCHED AND REPACKED SUCCESSFULLY!')

if __name__ == '__main__':
    patch_all()
