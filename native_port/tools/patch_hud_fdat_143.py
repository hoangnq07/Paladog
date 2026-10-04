"""
Patch fdat_143.png:
1. Entry 70: Replace A, D, J, K, L with:
   - Left arrow:  ◀ (D-Pad Left)
   - Right arrow: ▶ (D-Pad Right)
   - Mace 1:      X (Button X)
   - Mace 2:      Y (Button Y)
   - Mace 3:      B (Button B)
2. Entry 69: Remove keyboard digits 1..9 from unit card corners so handheld UI is clean.
Outputs to assets/atlases/fdat_143.png and fdat_143_handheld.png.
"""
import os
from PIL import Image, ImageDraw, ImageFont

def patch_fdat_143():
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    png_path = os.path.join(base_dir, 'assets', 'atlases', 'fdat_143.png')
    hh_path = os.path.join(base_dir, 'assets', 'atlases', 'fdat_143_handheld.png')
    font_path = os.path.join(base_dir, 'assets', 'fonts', 'BeVietnamPro-Bold.ttf')

    im = Image.open(png_path).convert('RGBA')

    # --- 1. Entry 70 (sx=0, sy=364, sw=614, sh=32) ---
    crop70 = Image.new('RGBA', (614, 32), (0, 0, 0, 0))
    draw70 = ImageDraw.Draw(crop70)

    bg_color = (45, 22, 12, 255)       # Original dark brown badge background
    txt_color = (250, 196, 0, 255)     # Original golden yellow glyph color
    border_color = (20, 10, 5, 220)    # Subtle dark border

    badges = [
        (0, 1, 25, 26, 'LEFT'),
        (294, 1, 319, 26, 'RIGHT'),
        (348, 6, 373, 31, 'X'),
        (468, 6, 493, 31, 'Y'),
        (588, 6, 613, 31, 'B'),
    ]

    font_letter = ImageFont.truetype(font_path, 17)

    for x0, y0, x1, y1, kind in badges:
        # Draw badge background
        draw70.rounded_rectangle([x0, y0, x1, y1], radius=5, fill=bg_color, outline=border_color, width=1)
        cx = (x0 + x1) / 2.0
        cy = (y0 + y1) / 2.0

        if kind == 'LEFT':
            pts = [(cx - 6, cy), (cx + 5, cy - 7), (cx + 5, cy + 7)]
            draw70.polygon(pts, fill=txt_color)
        elif kind == 'RIGHT':
            pts = [(cx + 6, cy), (cx - 5, cy - 7), (cx - 5, cy + 7)]
            draw70.polygon(pts, fill=txt_color)
        else:
            bbox = font_letter.getbbox(kind)
            tw = bbox[2] - bbox[0]
            th = bbox[3] - bbox[1]
            tx = x0 + (x1 - x0 + 1 - tw) // 2 - bbox[0]
            ty = y0 + (y1 - y0 + 1 - th) // 2 - bbox[1] - 1
            draw70.text((tx, ty), kind, font=font_letter, fill=txt_color)

    # Paste entry 70 back into atlas
    im.paste(crop70, (0, 364))

    # --- 2. Entry 69 (sx=0, sy=328, sw=682, sh=36) ---
    # Clear out 1..9 keyboard numbers
    blank69 = Image.new('RGBA', (682, 36), (0, 0, 0, 0))
    im.paste(blank69, (0, 328))

    im.save(png_path)
    im.save(hh_path)
    print(f'Successfully patched fdat_143 -> {png_path} and {hh_path}')

if __name__ == '__main__':
    patch_fdat_143()
