"""
Master script to patch all tutorial atlases for R36S Handheld:
1. fdat_133 (Keyboard / Mouse / Controls tutorial)
2. fdat_129 (Basic battle tutorial: movement, units, maces, HUD)
3. fdat_130 (Destiny mode tutorial)
4. fdat_131 (Warroad mode tutorial: replace TAP with D-Pad / A)
5. fdat_132 (Store & Upgrade tutorial: translate gangster story & INVEN)
"""
import os, sys
from PIL import Image, ImageDraw, ImageFont

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.dirname(BASE_DIR))
ATLAS_DIR = os.path.join(BASE_DIR, 'assets', 'atlases')
FONT_BOLD = os.path.join(BASE_DIR, 'assets', 'fonts', 'BeVietnamPro-Bold.ttf')

def get_font(size):
    return ImageFont.truetype(FONT_BOLD, size)

def draw_border_text(draw, text, cx, cy, font, fill_rgb, border_rgb, border_w=2, anchor='mm'):
    for dx in range(-border_w, border_w + 1):
        for dy in range(-border_w, border_w + 1):
            if dx != 0 or dy != 0:
                draw.text((cx + dx, cy + dy), text, font=font, fill=border_rgb, anchor=anchor)
    draw.text((cx, cy), text, font=font, fill=fill_rgb, anchor=anchor)

def draw_round_btn(draw, cx, cy, label, bg_rgb, txt_rgb, r=12):
    draw.ellipse([cx - r, cy - r, cx + r, cy + r], fill=bg_rgb, outline=(255, 255, 255, 220), width=1)
    f = get_font(max(10, int(r * 1.05)))
    draw_border_text(draw, label, cx, cy - 1, f, txt_rgb, (10, 10, 10), 1, anchor='mm')

def draw_pill(draw, x0, y0, x1, y1, text, bg_rgb, txt_rgb, fsize=14):
    draw.rounded_rectangle([x0, y0, x1, y1], radius=8, fill=bg_rgb, outline=(20, 10, 5, 230), width=2)
    cx = (x0 + x1) / 2
    cy = (y0 + y1) / 2
    f = get_font(fsize)
    draw_border_text(draw, text, cx, cy - 1, f, txt_rgb, (20, 10, 5), 2, anchor='mm')

def get_pristine_unit_cards():
    lines143 = open(os.path.join(ATLAS_DIR, 'fdat_143.txt')).read().splitlines()
    im143 = Image.open(os.path.join(ATLAS_DIR, 'fdat_143.png')).convert('RGBA')
    cards = []
    for i in range(9):
        idx = 39 + i * 3
        parts = list(map(int, lines143[idx+1].split()))
        sx, sy, dw, dh, dx, dy, sw, sh = parts
        cards.append(im143.crop((sx, sy, sx+sw, sy+sh)))
    return cards

# -------------------------------------------------------------
# 1. fdat_133
# -------------------------------------------------------------
def patch_fdat_133(cards):
    atlas_p = os.path.join(ATLAS_DIR, 'fdat_133.png')
    hh_p = os.path.join(ATLAS_DIR, 'fdat_133_handheld.png')
    atlas = Image.open(atlas_p).convert('RGBA')

    # Entry 0 (714 x 254)
    orig0 = Image.open('native_port/scratch/tut_inspect/133/0.png').convert('RGBA')
    e0 = Image.new('RGBA', (714, 254), (0, 0, 0, 0))
    bottom0 = orig0.crop((0, 150, 714, 254))
    e0.paste(bottom0, (0, 150))
    d0 = ImageDraw.Draw(e0)
    # Clear old keyboard artifacts and badges
    d0.rectangle([0, 130, 200, 160], fill=(0, 0, 0, 0))
    d0.rectangle([10, 185, 50, 245], fill=(0, 0, 0, 0))
    d0.rectangle([300, 185, 345, 245], fill=(0, 0, 0, 0))
    d0.rectangle([355, 190, 400, 245], fill=(0, 0, 0, 0))
    d0.rectangle([475, 190, 520, 245], fill=(0, 0, 0, 0))
    d0.rectangle([595, 190, 640, 245], fill=(0, 0, 0, 0))

    bg_b = (45, 22, 12, 255)
    gold = (250, 196, 0, 255)
    # Left arrow badge
    d0.rounded_rectangle([15, 197, 41, 223], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    d0.polygon([(21, 210), (33, 203), (33, 217)], fill=gold)
    # Right arrow badge
    d0.rounded_rectangle([307, 197, 333, 223], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    d0.polygon([(327, 210), (315, 203), (315, 217)], fill=gold)
    # Mace 1, 2, 3
    d0.rounded_rectangle([360, 201, 386, 227], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    draw_border_text(d0, "X", 373, 213, get_font(16), gold, (20, 10, 5), 1)
    d0.rounded_rectangle([480, 201, 506, 227], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    draw_border_text(d0, "Y", 493, 213, get_font(16), gold, (20, 10, 5), 1)
    d0.rounded_rectangle([600, 201, 626, 227], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    draw_border_text(d0, "B", 613, 213, get_font(16), gold, (20, 10, 5), 1)
    # Top text
    draw_border_text(d0, "DI CHUYỂN", 175, 40, get_font(23), (255, 220, 0), (40, 20, 0), 2)
    draw_pill(d0, 45, 75, 305, 125, "D-Pad / Cần Analog", (30, 120, 200), (255, 255, 255))
    draw_border_text(d0, "PHÉP THUẬT", 535, 40, get_font(23), (255, 220, 0), (40, 20, 0), 2)
    draw_round_btn(d0, 410, 100, "X", (30, 120, 220), (255, 255, 255), 20)
    draw_round_btn(d0, 530, 100, "Y", (220, 180, 20), (255, 255, 255), 20)
    draw_round_btn(d0, 650, 100, "B", (220, 40, 40), (255, 255, 255), 20)
    atlas.paste(e0, (0, 976))

    # Entry 1 (748 x 484)
    orig1 = Image.open('native_port/scratch/tut_inspect/133/1.png').convert('RGBA')
    e1 = Image.new('RGBA', (748, 484), (0, 0, 0, 0))
    # Copy yellow frame at bottom (y=390..484)
    e1.paste(orig1.crop((0, 390, 748, 484)), (0, 390))
    # Paste pristine cards
    for i in range(9):
        e1.paste(cards[i], (8 + i * 81, 398), cards[i])
    d1 = ImageDraw.Draw(e1)
    draw_border_text(d1, "TẠM DỪNG", 645, 60, get_font(20), (255, 220, 0), (40, 20, 0), 2)
    draw_pill(d1, 590, 85, 700, 125, "START", (40, 40, 40), (255, 255, 255))
    draw_border_text(d1, "TRIỆU HỒI QUÂN LÍNH", 374, 305, get_font(22), (255, 220, 0), (40, 20, 0), 2)
    draw_pill(d1, 140, 335, 390, 375, "[L1] / [R1]  Chọn ô", (200, 100, 20), (255, 255, 255))
    draw_pill(d1, 420, 335, 630, 375, "(A)  Triệu hồi lính", (20, 150, 60), (255, 255, 255))
    atlas.paste(e1, (0, 0))

    # Entry 2 (604 x 198) - Handheld controller info
    e2 = Image.new('RGBA', (604, 198), (0, 0, 0, 0))
    d2 = ImageDraw.Draw(e2)
    d2.rounded_rectangle([10, 10, 594, 188], radius=16, fill=(24, 28, 36, 245), outline=(255, 200, 40, 255), width=3)
    d2.rounded_rectangle([14, 14, 590, 184], radius=12, fill=None, outline=(255, 255, 255, 60), width=1)
    draw_border_text(d2, "HỖ TRỢ TAY CẦM R36S HOÀN HẢO", 302, 45, get_font(22), (255, 220, 40), (40, 15, 0), 2)
    d2.line([(60, 72), (544, 72)], fill=(255, 200, 40, 120), width=1)
    draw_border_text(d2, "D-Pad / Cần gạt: Di chuyển   |   START: Tạm dừng", 302, 100, get_font(16), (255, 255, 255), (10, 10, 10), 2)
    draw_border_text(d2, "L1 / R1: Chọn ô lính   |   Nút (A): Triệu hồi lính", 302, 130, get_font(16), (100, 255, 140), (10, 10, 10), 2)
    draw_border_text(d2, "Nút (X), (Y), (B): Tung 3 loại phép thuật", 302, 160, get_font(16), (100, 220, 255), (10, 10, 10), 2)
    atlas.paste(e2, (0, 1230))

    # Entry 3 (736 x 246)
    orig3 = Image.open('native_port/scratch/tut_inspect/133/3.png').convert('RGBA')
    e3 = Image.new('RGBA', (736, 246), (0, 0, 0, 0))
    e3.paste(orig3.crop((0, 155, 736, 246)), (0, 155))
    d3 = ImageDraw.Draw(e3)
    draw_border_text(d3, "CHỌN LÍNH & PHÉP THUẬT (ĐỊNH MỆNH)", 368, 40, get_font(21), (255, 220, 0), (40, 20, 0), 2)
    draw_pill(d3, 120, 80, 380, 125, "[L1] / [R1]  Chọn ô", (200, 100, 20), (255, 255, 255))
    draw_pill(d3, 410, 80, 640, 125, "(A)  Dùng lính / phép", (20, 150, 60), (255, 255, 255))
    atlas.paste(e3, (0, 730))

    # Entry 4 (738 x 246)
    e4 = Image.new('RGBA', (738, 246), (0, 0, 0, 0))
    orig4 = Image.open('native_port/scratch/tut_inspect/133/4.png').convert('RGBA')
    e4.paste(orig4.crop((0, 155, 738, 246)), (0, 155))
    for i in range(9):
        e4.paste(cards[i], (8 + i * 81, 163), cards[i])
    d4 = ImageDraw.Draw(e4)
    draw_border_text(d4, "TRIỆU HỒI QUÂN LÍNH", 369, 40, get_font(22), (255, 220, 0), (40, 20, 0), 2)
    draw_pill(d4, 120, 80, 380, 125, "[L1] / [R1]  Chọn ô", (200, 100, 20), (255, 255, 255))
    draw_pill(d4, 410, 80, 640, 125, "(A)  Triệu hồi lính", (20, 150, 60), (255, 255, 255))
    atlas.paste(e4, (0, 484))

    # Entry 5 (260 x 350)
    e5 = Image.new('RGBA', (260, 350), (0, 0, 0, 0))
    d5 = ImageDraw.Draw(e5)
    draw_border_text(d5, "CHỌN LÀN ĐƯỜNG", 130, 30, get_font(18), (255, 220, 0), (40, 20, 0), 2)
    draw_border_text(d5, "[D-Pad Lên / Xuống]", 130, 60, get_font(14), (100, 220, 255), (10, 10, 10), 1)
    for i in range(5):
        y = 100 + i * 48
        draw_border_text(d5, f"Làn {i+1}", 40, y, get_font(17), (255, 220, 0), (40, 20, 0), 2)
        for k in range(3):
            ax = 90 + k * 22
            d5.polygon([(ax, y - 10), (ax + 16, y), (ax, y + 10)], fill=(240, 120, 20), outline=(20, 10, 5), width=1)
        draw_round_btn(d5, 220, y, "A", (20, 150, 60), (255, 255, 255), 14)
    atlas.paste(e5, (748, 256))

    # Entry 6 (264 x 256)
    orig6 = Image.open('native_port/scratch/tut_inspect/133/6.png').convert('RGBA')
    e6 = Image.new('RGBA', (264, 256), (0, 0, 0, 0))
    # Copy yellow frame with maces from y=145
    e6.paste(orig6.crop((0, 145, 264, 256)), (0, 145))
    d6 = ImageDraw.Draw(e6)
    draw_round_btn(d6, 40, 220, "X", (30, 120, 220), (255, 255, 255), 13)
    draw_round_btn(d6, 113, 220, "Y", (220, 180, 20), (255, 255, 255), 13)
    draw_round_btn(d6, 185, 220, "B", (220, 40, 40), (255, 255, 255), 13)
    draw_border_text(d6, "DÙNG PHÉP THUẬT", 132, 35, get_font(20), (255, 220, 0), (40, 20, 0), 2)
    draw_round_btn(d6, 50, 85, "X", (30, 120, 220), (255, 255, 255), 18)
    draw_round_btn(d6, 132, 85, "Y", (220, 180, 20), (255, 255, 255), 18)
    draw_round_btn(d6, 214, 85, "B", (220, 40, 40), (255, 255, 255), 18)
    atlas.paste(e6, (748, 0))

    atlas.save(atlas_p)
    atlas.save(hh_p)
    print("Patched fdat_133 successfully!")

# -------------------------------------------------------------
# 2. fdat_129_handheld
# -------------------------------------------------------------
def patch_fdat_129(cards):
    atlas_p = os.path.join(ATLAS_DIR, 'fdat_129_handheld.png')
    im = Image.open(atlas_p).convert('RGBA')

    # Entry 2: (0, 798, 746, 256) - Food and units
    # Paste pristine cards along the bottom (y = 798 + 172 = 970)
    for i in range(9):
        im.paste(cards[i], (8 + i * 81, 970), cards[i])

    # Entry 3: (0, 1054, 566, 338) - Mana & Maces
    # Rebuild Entry 3 cleanly from true original atlas:
    from uitool import Atlas
    Ao = Atlas(129, src='orig')
    c3 = Ao.crop(3)
    d3 = ImageDraw.Draw(c3)
    # Clear the entire old keyboard and 'Keyboard' word:
    d3.rectangle([0, 130, 208, 338], fill=(0, 0, 0, 0))

    # Clean orange tray left edge:
    d3.line([(208, 240), (208, 336)], fill=(255, 131, 23, 255), width=3)
    d3.line([(208, 336), (540, 336)], fill=(255, 131, 23, 255), width=3)

    # Seamless bubble fill:
    d3.rounded_rectangle([385, 12, 555, 98], radius=8, fill=(69, 215, 252, 255))
    draw_border_text(d3, 'Năng lượng', 472, 38, get_font(18), (255, 255, 0), (20, 20, 20), 2)
    draw_border_text(d3, 'Dùng để thi triển phép', 472, 70, get_font(13), (255, 255, 255), (20, 20, 20), 1)

    # Badges beside maces:
    bg_b = (45, 22, 12, 255)
    gold = (250, 196, 0, 255)
    f_badge = get_font(16)

    # Mace 1: X
    d3.rectangle([186, 298, 222, 330], fill=(0, 0, 0, 0))
    d3.rounded_rectangle([192, 302, 218, 328], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    draw_border_text(d3, 'X', 205, 314, f_badge, gold, (20, 10, 5), 1)

    # Mace 2: Y
    d3.rectangle([308, 298, 342, 330], fill=(0, 0, 0, 0))
    d3.rounded_rectangle([312, 302, 338, 328], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    draw_border_text(d3, 'Y', 325, 314, f_badge, gold, (20, 10, 5), 1)

    # Mace 3: B
    d3.rectangle([428, 298, 462, 330], fill=(0, 0, 0, 0))
    d3.rounded_rectangle([432, 302, 458, 328], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    draw_border_text(d3, 'B', 445, 314, f_badge, gold, (20, 10, 5), 1)

    # Left controller prompt card
    d3.rounded_rectangle([15, 225, 190, 325], radius=10, fill=(35, 30, 28, 255), outline=(250, 196, 0), width=2)
    draw_border_text(d3, 'DÙNG PHÉP', 102, 248, get_font(15), (250, 196, 0), (20, 10, 5), 2)
    draw_round_btn(d3, 50, 292, 'X', (30, 120, 220), (255, 255, 255), 13)
    draw_round_btn(d3, 102, 292, 'Y', (220, 180, 20), (255, 255, 255), 13)
    draw_round_btn(d3, 155, 292, 'B', (220, 40, 40), (255, 255, 255), 13)

    im.paste(c3, (0, 1054))

    # Entry 4: (0, 570, 756, 228) - HUD info (clean black smudges)
    orig4 = Image.open('native_port/scratch/tut_inspect/129_4.png').convert('RGBA')
    e4 = Image.new('RGBA', (756, 228), (0, 0, 0, 0))
    e4.paste(orig4, (0, 0))
    d4 = ImageDraw.Draw(e4)
    # Clean the white box "Máu căn cứ / Máu Boss" (x=380..520, y=140..205)
    d4.rounded_rectangle([385, 142, 516, 203], radius=8, fill=(255, 255, 255), outline=(15, 15, 15), width=2)
    draw_border_text(d4, "Máu căn cứ /", 450, 160, get_font(14), (20, 20, 20), (255, 255, 255), 0)
    draw_border_text(d4, "Máu Boss", 450, 185, get_font(14), (20, 20, 20), (255, 255, 255), 0)
    # Replace Esc with START at x=645, y=115
    d4.rectangle([640, 100, 740, 200], fill=(0, 0, 0, 0))
    draw_pill(d4, 648, 115, 735, 165, "START", (40, 40, 40), (255, 255, 255), 15)
    draw_border_text(d4, "SEL+STA: Thoát", 691, 185, get_font(11), (255, 220, 0), (20, 20, 20), 1)
    im.paste(e4, (0, 570))

    im.save(atlas_p)
    # Also save to fdat_129.png
    im.save(os.path.join(ATLAS_DIR, 'fdat_129.png'))
    print("Patched fdat_129 successfully!")

# -------------------------------------------------------------
# 3. fdat_130_handheld
# -------------------------------------------------------------
def patch_fdat_130(cards):
    atlas_p = os.path.join(ATLAS_DIR, 'fdat_130_handheld.png')
    im = Image.open(atlas_p).convert('RGBA')

    # Entry 1: (0, 1126, 728, 246)
    # Rebuild from scratch using pristine cards and zero chopped keyboard:
    e1 = Image.new('RGBA', (728, 246), (0, 0, 0, 0))
    orig1 = Image.open('native_port/scratch/tut_inspect/130_orig_1.png').convert('RGBA')
    # Copy yellow frame with items (y=155..246)
    e1.paste(orig1.crop((0, 155, 728, 246)), (0, 155))
    d1 = ImageDraw.Draw(e1)
    # Erase baked digits 1..8 under the cards:
    d1.rectangle([0, 218, 728, 246], fill=(0, 0, 0, 0))
    draw_pill(d1, 140, 80, 390, 130, "[L1] / [R1]  Chọn ô", (200, 100, 20), (255, 255, 255))
    draw_pill(d1, 420, 80, 650, 130, "(A)  Dùng lính / phép", (20, 150, 60), (255, 255, 255))
    im.paste(e1, (0, 1126))

    im.save(atlas_p)
    im.save(os.path.join(ATLAS_DIR, 'fdat_130.png'))
    print("Patched fdat_130 successfully!")

# -------------------------------------------------------------
# 4. fdat_131_handheld
# -------------------------------------------------------------
def patch_fdat_131():
    atlas_p = os.path.join(ATLAS_DIR, 'fdat_131_handheld.png')
    im = Image.open(atlas_p).convert('RGBA')

    # Entry 1: (556, 782, 394, 540)
    # Rebuild cleanly from true original atlas:
    from uitool import Atlas
    Ao = Atlas(131, src='orig')
    c1 = Ao.crop(1)
    d1 = ImageDraw.Draw(c1)
    # Clear everything above the speech bubble:
    d1.rectangle([0, 0, 394, 274], fill=(0, 0, 0, 0))

    # Inside bubble:
    # Top half:
    d1.rectangle([22, 276, 336, 339], fill=(66, 222, 255, 255))
    # Bottom half:
    d1.rectangle([22, 340, 336, 415], fill=(41, 189, 255, 255))

    draw_border_text(d1, 'Chế độ Chiến Trường', 190, 35, get_font(23), (255, 240, 0), (20, 20, 20), 2)
    draw_border_text(d1, 'Tiến lên phía trước', 190, 75, get_font(16), (255, 255, 255), (20, 20, 20), 2)
    draw_border_text(d1, 'để giành thắng lợi!', 190, 105, get_font(16), (255, 255, 255), (20, 20, 20), 2)

    draw_border_text(d1, 'Cách điều khiển:', 110, 250, get_font(20), (255, 240, 0), (20, 20, 20), 2)

    # Inside bubble text:
    draw_border_text(d1, '1. Chọn lính: [L1] / [R1]', 175, 308, get_font(17), (255, 255, 255), (15, 45, 60), 2)
    draw_border_text(d1, '2. Chọn làn: D-Pad & (A)', 175, 375, get_font(17), (255, 255, 255), (15, 45, 60), 2)

    im.paste(c1, (556, 782))

    im.save(atlas_p)
    im.save(os.path.join(ATLAS_DIR, 'fdat_131.png'))
    print("Patched fdat_131 successfully!")

# -------------------------------------------------------------
# 5. fdat_132
# -------------------------------------------------------------
def patch_fdat_132():
    atlas_p = os.path.join(ATLAS_DIR, 'fdat_132.png')
    hh_p = os.path.join(ATLAS_DIR, 'fdat_132_handheld.png')
    im = Image.open(atlas_p).convert('RGBA')

    # Entry 0: (0, 1140, 760, 570) - Unit Upgrade tutorial
    # Translate gangster story in English to Vietnamese:
    # Area: x=390..700, y=1470..1580 (relative to atlas: y=1140+330..1140+440)
    d = ImageDraw.Draw(im)
    # Cover the English description text with dark brown card background (36, 27, 24)
    d.rectangle([390, 1140 + 330, 710, 1140 + 445], fill=(42, 32, 28, 255))
    f_desc = get_font(13)
    f_blue = get_font(13)
    draw_border_text(d, "Từng là đại ca khét tiếng đường phố, nay là", 400, 1140 + 345, f_desc, (180, 180, 180), (10, 10, 10), 1, anchor='la')
    draw_border_text(d, "chiến binh yêu nước vì Critterland.", 400, 1140 + 370, f_desc, (180, 180, 180), (10, 10, 10), 1, anchor='la')
    draw_border_text(d, "Hào quang giúp chuột nhảy tấn công kẻ địch.", 400, 1140 + 405, f_blue, (0, 210, 255), (10, 10, 10), 1, anchor='la')

    # Entry 2: (0, 0, 760, 570) - Hero Equip tutorial
    # Bag icon says "INVEN" at x=250..350, y=380..425
    d.rectangle([250, 385, 350, 420], fill=(42, 22, 16, 255))
    draw_border_text(d, "TÚI ĐỒ", 295, 402, get_font(21), (250, 196, 0), (20, 10, 5), 2)

    im.save(atlas_p)
    im.save(hh_p)
    print("Patched fdat_132 successfully!")

def main():
    cards = get_pristine_unit_cards()
    patch_fdat_133(cards)
    patch_fdat_129(cards)
    patch_fdat_130(cards)
    patch_fdat_131()
    patch_fdat_132()
    print("All tutorials patched to perfection!")

if __name__ == '__main__':
    main()
