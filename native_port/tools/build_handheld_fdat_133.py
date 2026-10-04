"""
Build handheld version of fdat_133:
Replaces all PC keyboard & mouse tutorials with R36S handheld controls.
Outputs to:
  assets/atlases/fdat_133.png
  assets/atlases/fdat_133_handheld.png
"""
import os
from PIL import Image, ImageDraw, ImageFont

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
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

def draw_pill(draw, x0, y0, x1, y1, text, bg_rgb, txt_rgb):
    draw.rounded_rectangle([x0, y0, x1, y1], radius=8, fill=bg_rgb, outline=(20, 10, 5, 230), width=2)
    cx = (x0 + x1) / 2
    cy = (y0 + y1) / 2
    f = get_font(14)
    draw_border_text(draw, text, cx, cy - 1, f, txt_rgb, (20, 10, 5), 2, anchor='mm')

def build_entry_0():
    # 714 x 254: Movement and Magic tutorial
    orig = Image.open('native_port/scratch/tut_inspect/133/0.png').convert('RGBA')
    im = Image.new('RGBA', (714, 254), (0, 0, 0, 0))

    # Bottom section with yellow frames starts at y=150
    bottom = orig.crop((0, 150, 714, 254))
    im.paste(bottom, (0, 150))

    draw = ImageDraw.Draw(im)

    bg_b = (45, 22, 12, 255)
    gold = (250, 196, 0, 255)

    # 1. Clear old badges completely:
    # Left arrow badge area
    draw.rectangle([10, 190, 45, 230], fill=(0, 0, 0, 0))
    # Right arrow badge area
    draw.rectangle([300, 190, 340, 230], fill=(0, 0, 0, 0))
    # Mace 1 badge area
    draw.rectangle([355, 195, 395, 235], fill=(0, 0, 0, 0))
    # Mace 2 badge area
    draw.rectangle([475, 195, 515, 235], fill=(0, 0, 0, 0))
    # Mace 3 badge area
    draw.rectangle([595, 195, 635, 235], fill=(0, 0, 0, 0))

    # 2. Draw pristine new badges:
    # Left arrow badge:
    draw.rounded_rectangle([15, 197, 41, 223], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    draw.polygon([(21, 210), (33, 203), (33, 217)], fill=gold)

    # Right arrow badge:
    draw.rounded_rectangle([307, 197, 333, 223], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    draw.polygon([(327, 210), (315, 203), (315, 217)], fill=gold)

    # Mace 1 (X):
    draw.rounded_rectangle([360, 201, 386, 227], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    draw_border_text(draw, "X", 373, 213, get_font(16), gold, (20, 10, 5), 1)

    # Mace 2 (Y):
    draw.rounded_rectangle([480, 201, 506, 227], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    draw_border_text(draw, "Y", 493, 213, get_font(16), gold, (20, 10, 5), 1)

    # Mace 3 (B):
    draw.rounded_rectangle([600, 201, 626, 227], radius=5, fill=bg_b, outline=(20, 10, 5), width=1)
    draw_border_text(draw, "B", 613, 213, get_font(16), gold, (20, 10, 5), 1)

    # Top section (y=0..145):
    # Left group: DI CHUYỂN
    draw_border_text(draw, "DI CHUYỂN", 175, 40, get_font(23), (255, 220, 0), (40, 20, 0), 2)
    draw_pill(draw, 45, 75, 305, 125, "D-Pad / Cần Analog", (30, 120, 200), (255, 255, 255))

    # Right group: PHÉP THUẬT
    draw_border_text(draw, "PHÉP THUẬT", 535, 40, get_font(23), (255, 220, 0), (40, 20, 0), 2)
    draw_round_btn(draw, 410, 100, "X", (30, 120, 220), (255, 255, 255), 20)
    draw_round_btn(draw, 530, 100, "Y", (220, 180, 20), (255, 255, 255), 20)
    draw_round_btn(draw, 650, 100, "B", (220, 40, 40), (255, 255, 255), 20)

    return im

def build_entry_1():
    # 748 x 484: Unit Summon & Pause
    orig = Image.open('native_port/scratch/tut_inspect/133/1.png').convert('RGBA')
    im = Image.new('RGBA', (748, 484), (0, 0, 0, 0))

    # Copy bottom unit bar from y=390
    bar = orig.crop((0, 390, 748, 484))
    im.paste(bar, (0, 390))

    draw = ImageDraw.Draw(im)

    # Clean the unit card top-left corner without leaving white holes
    card_colors = [
        (54, 174, 237), (54, 174, 237), (54, 174, 237),
        (54, 174, 237), (54, 174, 237), (54, 174, 237),
        (54, 174, 237), (54, 174, 237), (54, 174, 237),
    ]
    for i in range(9):
        x0 = 8 + i * 81
        c = card_colors[i]
        # Fill the triangle corner with matching card cyan
        draw.rectangle([x0 + 2, 396, x0 + 24, 420], fill=(c[0], c[1], c[2], 255))
        # Draw card border top and left
        draw.line([(x0, 400), (x0, 420)], fill=(10, 10, 10, 255), width=2)
        draw.line([(x0, 396), (x0 + 24, 396)], fill=(10, 10, 10, 255), width=2)

    # Top right: TẠM DỪNG
    draw_border_text(draw, "TẠM DỪNG", 645, 60, get_font(20), (255, 220, 0), (40, 20, 0), 2)
    draw_pill(draw, 590, 85, 700, 125, "START", (40, 40, 40), (255, 255, 255))

    # Bottom header: TRIỆU HỒI QUÂN LÍNH
    draw_border_text(draw, "TRIỆU HỒI QUÂN LÍNH", 374, 305, get_font(22), (255, 220, 0), (40, 20, 0), 2)
    draw_pill(draw, 140, 335, 390, 375, "[L1] / [R1]  Chọn ô", (200, 100, 20), (255, 255, 255))
    draw_pill(draw, 420, 335, 630, 375, "(A)  Triệu hồi lính", (20, 150, 60), (255, 255, 255))

    return im

def build_entry_2():
    # 604 x 198: Handheld controller support slide
    im = Image.new('RGBA', (604, 198), (0, 0, 0, 0))
    draw = ImageDraw.Draw(im)

    # Dark rounded card with gold border
    draw.rounded_rectangle([10, 10, 594, 188], radius=16, fill=(24, 28, 36, 245), outline=(255, 200, 40, 255), width=3)
    draw.rounded_rectangle([14, 14, 590, 184], radius=12, fill=None, outline=(255, 255, 255, 60), width=1)

    draw_border_text(draw, "HỖ TRỢ TAY CẦM R36S HOÀN HẢO", 302, 45, get_font(22), (255, 220, 40), (40, 15, 0), 2)
    draw.line([(60, 72), (544, 72)], fill=(255, 200, 40, 120), width=1)

    draw_border_text(draw, "D-Pad / Cần gạt: Di chuyển   |   START: Tạm dừng", 302, 100, get_font(16), (255, 255, 255), (10, 10, 10), 2)
    draw_border_text(draw, "L1 / R1: Chọn ô lính   |   Nút (A): Triệu hồi lính", 302, 130, get_font(16), (100, 255, 140), (10, 10, 10), 2)
    draw_border_text(draw, "Nút (X), (Y), (B): Tung 3 loại phép thuật", 302, 160, get_font(16), (100, 220, 255), (10, 10, 10), 2)

    return im

def build_entry_3():
    # 736 x 246: Destiny Mode unit & magic select
    orig = Image.open('native_port/scratch/tut_inspect/133/3.png').convert('RGBA')
    im = Image.new('RGBA', (736, 246), (0, 0, 0, 0))

    # Copy bottom unit bar from y=155 (skipping old keyboard keys)
    bar = orig.crop((0, 155, 736, 246))
    im.paste(bar, (0, 155))

    draw = ImageDraw.Draw(im)

    draw_border_text(draw, "CHỌN LÍNH & PHÉP THUẬT (ĐỊNH MỆNH)", 368, 40, get_font(21), (255, 220, 0), (40, 20, 0), 2)
    draw_pill(draw, 120, 80, 380, 125, "[L1] / [R1]  Chọn ô", (200, 100, 20), (255, 255, 255))
    draw_pill(draw, 410, 80, 640, 125, "(A)  Dùng lính / phép", (20, 150, 60), (255, 255, 255))

    return im

def build_entry_4():
    # 738 x 246: Unit summon tutorial
    orig = Image.open('native_port/scratch/tut_inspect/133/4.png').convert('RGBA')
    im = Image.new('RGBA', (738, 246), (0, 0, 0, 0))

    bar = orig.crop((0, 155, 738, 246))
    im.paste(bar, (0, 155))

    draw = ImageDraw.Draw(im)

    draw_border_text(draw, "TRIỆU HỒI QUÂN LÍNH", 369, 40, get_font(22), (255, 220, 0), (40, 20, 0), 2)
    draw_pill(draw, 120, 80, 380, 125, "[L1] / [R1]  Chọn ô", (200, 100, 20), (255, 255, 255))
    draw_pill(draw, 410, 80, 640, 125, "(A)  Triệu hồi lính", (20, 150, 60), (255, 255, 255))

    return im

def build_entry_5():
    # 260 x 350: Warroad mode lane select
    im = Image.new('RGBA', (260, 350), (0, 0, 0, 0))
    draw = ImageDraw.Draw(im)

    draw_border_text(draw, "CHỌN LÀN ĐƯỜNG", 130, 30, get_font(18), (255, 220, 0), (40, 20, 0), 2)
    draw_border_text(draw, "[D-Pad Lên / Xuống]", 130, 60, get_font(14), (100, 220, 255), (10, 10, 10), 1)

    for i in range(5):
        y = 100 + i * 48
        draw_border_text(draw, f"Làn {i+1}", 40, y, get_font(17), (255, 220, 0), (40, 20, 0), 2)
        for k in range(3):
            ax = 90 + k * 22
            draw.polygon([(ax, y - 10), (ax + 16, y), (ax, y + 10)], fill=(240, 120, 20), outline=(20, 10, 5), width=1)
        draw_round_btn(draw, 220, y, "A", (20, 150, 60), (255, 255, 255), 14)

    return im

def build_entry_6():
    # 264 x 256: Magic spell cast
    orig = Image.open('native_port/scratch/tut_inspect/133/6.png').convert('RGBA')
    im = Image.new('RGBA', (264, 256), (0, 0, 0, 0))

    # Copy bottom mace circles from y=145 (below all old keyboard keys)
    maces = orig.crop((0, 145, 264, 256))
    im.paste(maces, (0, 145))

    draw = ImageDraw.Draw(im)

    # Erase old cyan J, K, L badges at bottom left of maces completely
    draw.rectangle([25, 200, 55, 235], fill=(0, 0, 0, 0))
    draw.rectangle([98, 200, 128, 235], fill=(0, 0, 0, 0))
    draw.rectangle([170, 200, 200, 235], fill=(0, 0, 0, 0))

    # Draw pristine X, Y, B badges at bottom left of maces:
    draw_round_btn(draw, 40, 218, "X", (30, 120, 220), (255, 255, 255), 13)
    draw_round_btn(draw, 113, 218, "Y", (220, 180, 20), (255, 255, 255), 13)
    draw_round_btn(draw, 185, 218, "B", (220, 40, 40), (255, 255, 255), 13)

    # Title
    draw_border_text(draw, "DÙNG PHÉP THUẬT", 132, 35, get_font(20), (255, 220, 0), (40, 20, 0), 2)

    # 3 round button badges above maces:
    draw_round_btn(draw, 50, 90, "X", (30, 120, 220), (255, 255, 255), 18)
    draw_round_btn(draw, 132, 90, "Y", (220, 180, 20), (255, 255, 255), 18)
    draw_round_btn(draw, 214, 90, "B", (220, 40, 40), (255, 255, 255), 18)

    return im

def patch_fdat_133():
    atlas_p = os.path.join(BASE_DIR, 'assets', 'atlases', 'fdat_133.png')
    hh_p = os.path.join(BASE_DIR, 'assets', 'atlases', 'fdat_133_handheld.png')

    atlas = Image.open(atlas_p).convert('RGBA')

    print("Building entry 0...")
    e0 = build_entry_0()
    atlas.paste(e0, (0, 976))

    print("Building entry 1...")
    e1 = build_entry_1()
    atlas.paste(e1, (0, 0))

    print("Building entry 2...")
    e2 = build_entry_2()
    atlas.paste(e2, (0, 1230))

    print("Building entry 3...")
    e3 = build_entry_3()
    atlas.paste(e3, (0, 730))

    print("Building entry 4...")
    e4 = build_entry_4()
    atlas.paste(e4, (0, 484))

    print("Building entry 5...")
    e5 = build_entry_5()
    atlas.paste(e5, (748, 256))

    print("Building entry 6...")
    e6 = build_entry_6()
    atlas.paste(e6, (748, 0))

    atlas.save(atlas_p)
    atlas.save(hh_p)
    print(f"Successfully generated fdat_133 -> {atlas_p} & {hh_p}")

if __name__ == '__main__':
    patch_fdat_133()
