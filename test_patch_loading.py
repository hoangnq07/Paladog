import zlib, struct, os
from PIL import Image, ImageDraw, ImageFont

def patch_loading():
    bin_path = 'extracted/binaryData/154_com.fazecat.web.paladog.Library_fDat99.bin'
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    
    n_images = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 8 * 4 * n_images
    header = data[:header_size]
    img_bytes = data[header_size:]
    
    # Save original atlas to temp
    os.makedirs('extracted/temp_patch', exist_ok=True)
    atlas_path = 'extracted/temp_patch/loading_atlas.png'
    with open(atlas_path, 'wb') as f:
        f.write(img_bytes)
    
    im = Image.open(atlas_path).convert('RGBA')
    
    # sub_00 coords: ax=0, ay=810, w=218, h=36
    # Clean the old "NOW LOADING" area (it has transparent background!)
    # Let's clear the rectangle (0, 810, 218, 810+36)
    draw = ImageDraw.Draw(im)
    draw.rectangle([0, 810, 218, 810+36], fill=(0, 0, 0, 0))
    
    # Render "ĐANG TẢI..."
    font = ImageFont.truetype('C:/Windows/Fonts/tahomabd.ttf', 24)
    text = "ĐANG TẢI..."
    
    # Get text size
    bbox = font.getbbox(text)
    tw = bbox[2] - bbox[0]
    th = bbox[3] - bbox[1]
    
    # Center horizontally and vertically within 218x36
    x = 0 + (218 - tw) // 2
    y = 810 + (36 - th) // 2 - bbox[1]
    
    # Shadow
    draw.text((x + 2, y + 2), text, font=font, fill=(80, 30, 0, 255), stroke_width=3, stroke_fill=(80, 30, 0, 255))
    # Main with dark orange/brown outline and bright yellow fill
    draw.text((x, y), text, font=font, fill=(255, 230, 20, 255), stroke_width=3, stroke_fill=(130, 50, 0, 255))
    
    # Save test crop
    crop = im.crop((0, 810, 218, 810+36))
    crop.save('extracted/temp_patch/test_loading_sub00.png')
    print('Saved test_loading_sub00.png')

patch_loading()
