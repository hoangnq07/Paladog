# -*- coding: utf-8 -*-
"""
create_handheld_tutorials.py
Generates R36S / Gamepad specific tutorial atlases:
  fdat_129_handheld.png
  fdat_130_handheld.png
  fdat_131_handheld.png
Replaces PC keyboard icons (A, D, 1..9, J, K, L, Esc) with gamepad buttons (D-Pad, L1/R1, A, X, Y, B, Start).
"""
import os
import sys
import shutil
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

BASE_DIR = Path(__file__).resolve().parent.parent
ATLAS_DIR = BASE_DIR / 'assets' / 'atlases'
FONT_PATH = BASE_DIR / 'assets' / 'fonts' / 'BeVietnamPro-Bold.ttf'

def get_font(size):
    try:
        return ImageFont.truetype(str(FONT_PATH), size)
    except:
        return ImageFont.load_default()

def draw_styled_text(draw, pos, text, font, fill_color=(255, 255, 255, 255), stroke_color=(0, 0, 0, 255), stroke_w=3):
    x, y = pos
    draw.text((x, y), text, font=font, fill=fill_color,
              stroke_width=stroke_w, stroke_fill=stroke_color)

def draw_gamepad_btn(draw, center, label, bg_color, text_color=(255, 255, 255, 255), r=18, font_size=16):
    cx, cy = center
    # Outer dark shadow
    draw.ellipse([cx - r - 2, cy - r - 2, cx + r + 2, cy + r + 2], fill=(20, 20, 20, 255))
    # Border
    draw.ellipse([cx - r, cy - r, cx + r, cy + r], fill=(240, 240, 240, 255))
    # Inner face
    draw.ellipse([cx - r + 3, cy - r + 3, cx + r - 3, cy + r - 3], fill=bg_color)
    # Text
    font = get_font(font_size)
    bbox = font.getbbox(label)
    w = bbox[2] - bbox[0]
    h = bbox[3] - bbox[1]
    draw.text((cx - w / 2, cy - h / 2 - 2), label, font=font, fill=text_color,
              stroke_width=2, stroke_fill=(0, 0, 0, 255))

def draw_pill_btn(draw, box, label, bg_color=(50, 50, 50, 255), text_color=(255, 255, 255, 255), font_size=14):
    x0, y0, x1, y1 = box
    draw.rounded_rectangle([x0 - 2, y0 - 2, x1 + 2, y1 + 2], radius=10, fill=(20, 20, 20, 255))
    draw.rounded_rectangle([x0, y0, x1, y1], radius=8, fill=bg_color)
    font = get_font(font_size)
    bbox = font.getbbox(label)
    w = bbox[2] - bbox[0]
    h = bbox[3] - bbox[1]
    draw.text(((x0 + x1 - w) / 2, (y0 + y1 - h) / 2 - 2), label, font=font, fill=text_color,
              stroke_width=2, stroke_fill=(0, 0, 0, 255))

# ==========================================
# 1. fdat_129: Battle Basics (Movement, Food/Units, Mana/Maces, Top UI)
# ==========================================
def make_fdat_129_handheld():
    src_p = str(ATLAS_DIR / 'fdat_129.png')
    atlas = Image.open(src_p).convert('RGBA')

    # sub_01: pos=(494, 1392), size=(492, 188) -> Movement & Tips
    s01 = atlas.crop((494, 1392, 494 + 492, 1392 + 188))
    d01 = ImageDraw.Draw(s01)

    # 1. Clear top-left keyboard & keys A/D completely: x=0..305, y=0..118
    d01.rectangle([0, 0, 305, 118], fill=(0, 0, 0, 0))
    # Draw badges for D-Pad and Analog Stick
    draw_pill_btn(d01, [15, 30, 145, 75], "D-Pad ◄ ►", bg_color=(20, 100, 210, 255), font_size=16)
    draw_pill_btn(d01, [155, 30, 285, 75], "Cần Analog", bg_color=(35, 140, 50, 255), font_size=16)

    # 2. Inside the orange movement arrows: replace A and D badges with sharp arrow polygons
    # Left A badge at x=14..44, y=148..174
    # Right D badge at x=305..335, y=148..174
    d01.rounded_rectangle([14, 148, 44, 174], radius=6, fill=(40, 30, 20, 255))
    d01.rounded_rectangle([305, 148, 335, 174], radius=6, fill=(40, 30, 20, 255))
    # Draw left triangle
    d01.polygon([(34, 154), (23, 161), (34, 168)], fill=(255, 235, 20, 255))
    # Draw right triangle
    d01.polygon([(315, 154), (326, 161), (315, 168)], fill=(255, 235, 20, 255))

    atlas.paste(s01, (494, 1392))

    # sub_02: pos=(0, 798), size=(746, 256) -> Food & Unit Summoning
    s02 = atlas.crop((0, 798, 746, 798 + 256))
    d02 = ImageDraw.Draw(s02)

    # Clear keyboard icon on top-right: x=570..740, y=20..110
    d02.rectangle([570, 20, 740, 110], fill=(0, 0, 0, 0))
    # Clear keys 1..9: x=240..745, y=100..168
    d02.rectangle([240, 100, 745, 168], fill=(0, 0, 0, 0))

    # Draw R36S controls for units:
    # [L1] [R1] Chọn ô lính   -   Nút [A]: Triệu hồi lính
    draw_pill_btn(d02, [260, 112, 335, 155], "◄ [L1]", bg_color=(200, 70, 0, 255), font_size=16)
    draw_pill_btn(d02, [345, 112, 420, 155], "[R1] ►", bg_color=(200, 70, 0, 255), font_size=16)
    font_lbl = get_font(16)
    draw_styled_text(d02, (430, 122), "Chọn ô lính", font_lbl, fill_color=(255, 255, 255, 255), stroke_w=3)

    draw_gamepad_btn(d02, (575, 134), "A", bg_color=(30, 180, 50, 255), r=18, font_size=16)
    draw_styled_text(d02, (605, 122), "Triệu hồi lính", font_lbl, fill_color=(255, 235, 20, 255), stroke_w=3)

    atlas.paste(s02, (0, 798))

    # sub_03: pos=(0, 1054), size=(566, 338) -> Mana & 3 Maces
    s03 = atlas.crop((0, 1054, 566, 1054 + 338))
    d03 = ImageDraw.Draw(s03)

    # Clear keyboard icon & J, K, L keys on left: x=0..210, y=130..315
    d03.rectangle([0, 130, 210, 315], fill=(0, 0, 0, 0))

    # Draw badge "DÙNG PHÉP:"
    draw_pill_btn(d03, [10, 230, 175, 270], "DÙNG PHÉP:", bg_color=(120, 30, 180, 255), font_size=15)
    draw_styled_text(d03, (8, 275), "Bấm nút tương ứng", get_font(13), fill_color=(255, 255, 255, 255), stroke_w=2)

    # First completely clear the old J, K, L text:
    d03.rectangle([170, 275, 230, 325], fill=(0, 0, 0, 0))
    d03.rectangle([275, 275, 338, 325], fill=(0, 0, 0, 0))
    d03.rectangle([385, 275, 455, 325], fill=(0, 0, 0, 0))

    # Replace mace buttons labels under mace 1, 2, 3:
    # J: center (199, 299) -> Button X
    # K: center (306, 302) -> Button Y
    # L: center (417, 299) -> Button B
    d03.rounded_rectangle([175, 280, 223, 318], radius=6, fill=(40, 30, 20, 255))
    d03.rounded_rectangle([282, 283, 330, 321], radius=6, fill=(40, 30, 20, 255))
    d03.rounded_rectangle([393, 280, 441, 318], radius=6, fill=(40, 30, 20, 255))

    draw_gamepad_btn(d03, (199, 299), "X", bg_color=(20, 100, 220, 255), r=15, font_size=14)
    draw_gamepad_btn(d03, (306, 302), "Y", bg_color=(230, 180, 20, 255), r=15, font_size=14)
    draw_gamepad_btn(d03, (417, 299), "B", bg_color=(220, 40, 40, 255), r=15, font_size=14)

    atlas.paste(s03, (0, 1054))

    # sub_04: pos=(0, 570), size=(756, 228) -> Top UI & Pause
    s04 = atlas.crop((0, 570, 756, 570 + 228))
    d04 = ImageDraw.Draw(s04)

    # Clear Esc key: x=650..755, y=120..225
    d04.rectangle([645, 120, 755, 225], fill=(0, 0, 0, 0))

    # Draw [START] button
    draw_pill_btn(d04, [650, 135, 750, 175], "START", bg_color=(45, 45, 45, 255), font_size=15)
    draw_styled_text(d04, (648, 185), "SEL+STA: Thoát", get_font(12), fill_color=(255, 200, 50, 255), stroke_w=2)

    atlas.paste(s04, (0, 570))

    out_p = str(ATLAS_DIR / 'fdat_129_handheld.png')
    atlas.save(out_p)
    print(f"Saved {out_p}")

# ==========================================
# 2. fdat_130: Destiny Mode (1..9 keys -> L1/R1 + A)
# ==========================================
def make_fdat_130_handheld():
    src_p = str(ATLAS_DIR / 'fdat_130.png')
    atlas = Image.open(src_p).convert('RGBA')

    # sub_01: pos=(0, 1126), size=(728, 246)
    s01 = atlas.crop((0, 1126, 728, 1126 + 246))
    d01 = ImageDraw.Draw(s01)

    # Clear keyboard icon on top-right: x=570..725, y=20..105
    d01.rectangle([570, 20, 725, 105], fill=(0, 0, 0, 0))
    # Clear keys 1..9 area: x=240..725, y=100..170
    d01.rectangle([240, 100, 725, 170], fill=(0, 0, 0, 0))

    # Draw R36S controls: [L1] [R1] Chọn ô  -  [A] Kích hoạt
    draw_pill_btn(d01, [245, 115, 320, 155], "◄ [L1]", bg_color=(200, 70, 0, 255), font_size=16)
    draw_pill_btn(d01, [330, 115, 405, 155], "[R1] ►", bg_color=(200, 70, 0, 255), font_size=16)
    draw_styled_text(d01, (415, 122), "Chọn ô", get_font(16), fill_color=(255, 255, 255, 255), stroke_w=3)

    draw_gamepad_btn(d01, (540, 135), "A", bg_color=(30, 180, 50, 255), r=18, font_size=16)
    draw_styled_text(d01, (570, 122), "Dùng lính / phép", get_font(16), fill_color=(255, 235, 20, 255), stroke_w=3)

    atlas.paste(s01, (0, 1126))

    out_p = str(ATLAS_DIR / 'fdat_130_handheld.png')
    atlas.save(out_p)
    print(f"Saved {out_p}")

# ==========================================
# 3. fdat_131: War Road Mode (1..9 keys & J, K, L)
# ==========================================
def make_fdat_131_handheld():
    src_p = str(ATLAS_DIR / 'fdat_131.png')
    atlas = Image.open(src_p).convert('RGBA')

    # sub_02: pos=(0, 570), size=(738, 212) -> unit selection
    s02 = atlas.crop((0, 570, 738, 570 + 212))
    d02 = ImageDraw.Draw(s02)
    # Clear keyboard icon: x=0..200, y=0..60
    d02.rectangle([0, 0, 200, 60], fill=(0, 0, 0, 0))
    # Clear keys 1..9: x=0..730, y=50..130
    d02.rectangle([0, 50, 730, 130], fill=(0, 0, 0, 0))
    draw_pill_btn(d02, [240, 75, 315, 115], "◄ [L1]", bg_color=(200, 70, 0, 255), font_size=16)
    draw_pill_btn(d02, [325, 75, 400, 115], "[R1] ►", bg_color=(200, 70, 0, 255), font_size=16)
    draw_styled_text(d02, (410, 82), "Chọn lính", get_font(16), fill_color=(255, 255, 255, 255), stroke_w=3)
    draw_gamepad_btn(d02, (535, 95), "A", bg_color=(30, 180, 50, 255), r=18, font_size=16)
    draw_styled_text(d02, (565, 82), "Chọn làn tiến", get_font(16), fill_color=(255, 235, 20, 255), stroke_w=3)
    atlas.paste(s02, (0, 570))

    # sub_03: pos=(0, 1202), size=(532, 348) -> J, K, L tactics
    s03 = atlas.crop((0, 1202, 532, 1202 + 348))
    d03 = ImageDraw.Draw(s03)
    # Clear J, K, L circles at bottom: x ~ 150..380, y ~ 300..345
    d03.rounded_rectangle([155, 310, 189, 344], radius=6, fill=(20, 20, 20, 255))
    d03.rounded_rectangle([230, 310, 264, 344], radius=6, fill=(20, 20, 20, 255))
    d03.rounded_rectangle([305, 310, 339, 344], radius=6, fill=(20, 20, 20, 255))
    draw_gamepad_btn(d03, (172, 327), "X", bg_color=(20, 100, 220, 255), r=14, font_size=14)
    draw_gamepad_btn(d03, (247, 327), "Y", bg_color=(230, 180, 20, 255), r=14, font_size=14)
    draw_gamepad_btn(d03, (322, 327), "B", bg_color=(220, 40, 40, 255), r=14, font_size=14)
    atlas.paste(s03, (0, 1202))

    out_p = str(ATLAS_DIR / 'fdat_131_handheld.png')
    atlas.save(out_p)
    print(f"Saved {out_p}")

def main():
    print("=== Creating Handheld Tutorial Atlases ===")
    make_fdat_129_handheld()
    make_fdat_130_handheld()
    make_fdat_131_handheld()

    # Also copy to dist/r36s/paladog/assets/atlases/ directly as fdat_129.png, fdat_130.png, fdat_131.png!
    r36s_dir = BASE_DIR / 'dist' / 'r36s' / 'paladog' / 'assets' / 'atlases'
    if r36s_dir.exists():
        shutil.copy(str(ATLAS_DIR / 'fdat_129_handheld.png'), str(r36s_dir / 'fdat_129.png'))
        shutil.copy(str(ATLAS_DIR / 'fdat_130_handheld.png'), str(r36s_dir / 'fdat_130.png'))
        shutil.copy(str(ATLAS_DIR / 'fdat_131_handheld.png'), str(r36s_dir / 'fdat_131.png'))
        shutil.copy(str(ATLAS_DIR / 'fdat_129_handheld.png'), str(r36s_dir / 'fdat_129_handheld.png'))
        shutil.copy(str(ATLAS_DIR / 'fdat_130_handheld.png'), str(r36s_dir / 'fdat_130_handheld.png'))
        shutil.copy(str(ATLAS_DIR / 'fdat_131_handheld.png'), str(r36s_dir / 'fdat_131_handheld.png'))
        print(f"Copied to {r36s_dir}")
    print("Done!")

if __name__ == '__main__':
    main()
