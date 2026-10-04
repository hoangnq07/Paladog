from PIL import Image, ImageDraw, ImageFont

def make_play_button(is_pressed=False):
    # Original sub_03 is (204, 140)
    # Let's inspect original sub_03
    orig = Image.open('extracted/ui_subsprites/titlebtn/sub_03.png' if not is_pressed else 'extracted/ui_subsprites/titlebtn/sub_04.png').convert('RGBA')
    w, h = orig.size
    
    # We want to keep the outer dark blue ring and border of the oval,
    # but repaint the interior.
    # The oval center is around (102, 70).
    # Radius rx = 88, ry = 58
    out = orig.copy()
    draw = ImageDraw.Draw(out)
    
    # Let's draw concentric ellipses to recreate the smooth blue gradient of the oval
    # From outer to inner:
    # Outer dark border: around x in [10..194], y in [10..130]
    # Blue shades:
    colors = [
        (25, 75, 135, 255),
        (35, 95, 160, 255),
        (45, 115, 185, 255),
        (55, 130, 205, 255),
        (70, 150, 220, 255),
        (85, 165, 230, 255),
    ]
    for idx, col in enumerate(colors):
        dx = 14 + idx * 8
        dy = 12 + idx * 6
        draw.ellipse([dx, dy, w - dx, h - dy], fill=col)
    
    # Draw light highlight crescent on top
    draw.ellipse([30, 16, w - 30, h // 2 + 10], fill=(100, 180, 240, 120))
    draw.ellipse([35, 22, w - 35, h // 2 + 10], fill=(85, 165, 230, 255))
    
    # Text "CHƠI"
    font = ImageFont.truetype('C:/Windows/Fonts/tahomabd.ttf', 46)
    text = "CHƠI"
    bbox = font.getbbox(text)
    tw = bbox[2] - bbox[0]
    th = bbox[3] - bbox[1]
    
    cx = (w - tw) // 2
    cy = (h - th) // 2 - bbox[1]
    if is_pressed:
        cy += 4
        
    # Thick shadow
    draw.text((cx + 2, cy + 6), text, font=font, fill=(10, 25, 55, 255), stroke_width=8, stroke_fill=(10, 25, 55, 255))
    # Outer dark stroke
    draw.text((cx, cy), text, font=font, fill=(255, 255, 255, 255), stroke_width=7, stroke_fill=(15, 30, 65, 255))
    
    return out

normal_btn = make_play_button(False)
normal_btn.save('extracted/temp_patch/play_vn_normal.png')
pressed_btn = make_play_button(True)
pressed_btn.save('extracted/temp_patch/play_vn_pressed.png')
print('Generated play_vn_normal.png and play_vn_pressed.png')
