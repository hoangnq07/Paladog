import zlib, struct, os
from PIL import Image, ImageDraw, ImageFont

def patch_titlebtn():
    bin_path = 'extracted/binaryData/138_com.fazecat.web.paladog.Library_fDat126.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    
    n_images = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 8 * 4 * n_images
    header = data[:header_size]
    img_bytes = data[header_size:]
    
    atlas_path = 'extracted/temp_patch/titlebtn_atlas.png'
    with open(atlas_path, 'wb') as f:
        f.write(img_bytes)
    
    im = Image.open(atlas_path).convert('RGBA')
    
    # In titlebtn:
    # sub_03: (ax=0, ay=0, w=204, h=140) -> Normal PLAY
    # sub_04: (ax=0, ay=140, w=204, h=140) -> Pressed PLAY
    
    font = ImageFont.truetype('C:/Windows/Fonts/tahomabd.ttf', 48)
    text = "CHƠI"
    
    for sub_idx, ay in [(3, 0), (4, 140)]:
        # Crop the button area
        btn_crop = im.crop((0, ay, 204, ay + 140))
        
        # We need to paint over the old 'PLAY' text with the blue colors of the oval interior
        # Let's inspect the oval center color: around (100, 70) it's #276ea9 or #3c88c7
        # Let's fill the central ellipse of the oval where PLAY was
        draw_btn = ImageDraw.Draw(btn_crop)
        
        # Cover old PLAY with concentric blue ellipse
        draw_btn.ellipse([45, 30, 160, 105], fill=(42, 115, 185, 255))
        draw_btn.ellipse([55, 38, 150, 98], fill=(55, 135, 205, 255))
        draw_btn.ellipse([65, 45, 140, 90], fill=(65, 148, 218, 255))
        
        bbox = font.getbbox(text)
        tw = bbox[2] - bbox[0]
        th = bbox[3] - bbox[1]
        
        cx = (204 - tw) // 2
        cy = (140 - th) // 2 - bbox[1] - 4
        
        if sub_idx == 4: # pressed
            cy += 4
            
        # Draw shadow
        draw_btn.text((cx + 3, cy + 5), text, font=font, fill=(10, 30, 60, 255), stroke_width=7, stroke_fill=(10, 30, 60, 255))
        # Draw main outline
        draw_btn.text((cx, cy), text, font=font, fill=(255, 255, 255, 255), stroke_width=6, stroke_fill=(20, 25, 40, 255))
        
        # Paste back into atlas
        im.paste(btn_crop, (0, ay))
        btn_crop.save(f'extracted/temp_patch/test_titlebtn_sub{sub_idx:02d}.png')

patch_titlebtn()
print('Patched titlebtn test')
