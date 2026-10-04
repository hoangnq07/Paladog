# -*- coding: utf-8 -*-
"""
clean_button_atlases.py
Creates pristine blank button surfaces on native_port/assets/atlases/fdat_*.png.
For each button:
1. Takes the original button from extracted/orig_bin (so no previous patches/blur exist).
2. Inpaints or paints a seamless background over the original text area.
3. Pastes the pristine blank button into native_port/assets/atlases/fdat_*.png.
"""

import sys, os
sys.path.insert(0, os.path.abspath('.'))
from PIL import Image, ImageDraw
from uitool import Atlas, inpaint_rows

ATLAS_DIR = 'native_port/assets/atlases'

def clean_fdat_126():
    """Title PLAY button (blue crystal orb)"""
    path = f'{ATLAS_DIR}/fdat_126.png'
    im_atlas = Image.open(path).convert('RGBA')
    Ao = Atlas(126, src='orig')
    
    colors = [
        (25, 75, 135, 255),
        (35, 95, 160, 255),
        (45, 115, 185, 255),
        (55, 130, 205, 255),
        (70, 150, 220, 255),
        (85, 165, 230, 255),
    ]
    
    for sub_idx in [3, 4]:
        sub = Ao.crop(sub_idx)
        w, h = sub.size
        d = ImageDraw.Draw(sub)
        for idx, col in enumerate(colors):
            dx = 14 + idx * 8
            dy = 12 + idx * 6
            d.ellipse([dx, dy, w - dx, h - dy], fill=col)
        # Highlight crescent
        d.ellipse([30, 16, w - 30, h // 2 + 10], fill=(100, 180, 240, 120))
        d.ellipse([35, 22, w - 35, h // 2 + 10], fill=(85, 165, 230, 255))
        
        s_info = Ao.subs[sub_idx]
        im_atlas.paste(sub, (s_info['ax'], s_info['ay']))
    
    im_atlas.save(path)
    print('Cleaned fdat_126.png (PLAY button orb)')

def clean_fdat_117():
    """Pause screen buttons (GIVE UP & RESUME)"""
    path = f'{ATLAS_DIR}/fdat_117.png'
    im_atlas = Image.open(path).convert('RGBA')
    Ao = Atlas(117, src='orig')
    
    boxes = {
        1: (15, 12, 188, 58), # GIVE UP pressed
        2: (15, 10, 188, 56), # GIVE UP normal
        3: (15, 12, 188, 58), # RESUME pressed
        4: (15, 10, 188, 56), # RESUME normal
    }
    for sub_idx, box in boxes.items():
        sub = Ao.crop(sub_idx)
        inpaint_rows(sub, box, k=5)
        s_info = Ao.subs[sub_idx]
        im_atlas.paste(sub, (s_info['ax'], s_info['ay']))
    
    im_atlas.save(path)
    print('Cleaned fdat_117.png (Pause buttons)')

def clean_fdat_121():
    """Stage clear OK button"""
    path = f'{ATLAS_DIR}/fdat_121.png'
    im_atlas = Image.open(path).convert('RGBA')
    Ao = Atlas(121, src='orig')
    
    boxes = {
        2: (15, 12, 172, 60), # OK pressed
        3: (15, 12, 172, 60), # OK normal
    }
    for sub_idx, box in boxes.items():
        sub = Ao.crop(sub_idx)
        inpaint_rows(sub, box, k=5)
        s_info = Ao.subs[sub_idx]
        im_atlas.paste(sub, (s_info['ax'], s_info['ay']))
        
    im_atlas.save(path)
    print('Cleaned fdat_121.png (Stage Clear button)')

def clean_fdat_92():
    """Fail / Retry button"""
    path = f'{ATLAS_DIR}/fdat_92.png'
    im_atlas = Image.open(path).convert('RGBA')
    Ao = Atlas(92, src='orig')
    
    boxes = {
        2: (15, 10, 188, 56), # RETRY normal
        3: (15, 12, 188, 58), # RETRY pressed
    }
    for sub_idx, box in boxes.items():
        sub = Ao.crop(sub_idx)
        inpaint_rows(sub, box, k=5)
        s_info = Ao.subs[sub_idx]
        im_atlas.paste(sub, (s_info['ax'], s_info['ay']))
        
    im_atlas.save(path)
    print('Cleaned fdat_92.png (Fail button)')

def clean_fdat_122():
    """Stage select UPGRADE button"""
    path = f'{ATLAS_DIR}/fdat_122.png'
    im_atlas = Image.open(path).convert('RGBA')
    Ao = Atlas(122, src='orig')
    
    # sub 23: normal UPGRADE
    s23 = Ao.crop(23)
    d23 = ImageDraw.Draw(s23)
    d23.rectangle([38, 8, 226, 56], fill=(111, 44, 201, 255))
    s_info = Ao.subs[23]
    im_atlas.paste(s23, (s_info['ax'], s_info['ay']))
    
    # sub 22: pressed UPGRADE
    s22 = Ao.crop(22)
    d22 = ImageDraw.Draw(s22)
    d22.rectangle([38, 8, 226, 56], fill=(57, 33, 164, 255))
    s_info = Ao.subs[22]
    im_atlas.paste(s22, (s_info['ax'], s_info['ay']))
    
    im_atlas.save(path)
    print('Cleaned fdat_122.png (Stage Select UPGRADE button)')

def clean_fdat_112():
    """Menu / Slot screen buttons"""
    path = f'{ATLAS_DIR}/fdat_112.png'
    im_atlas = Image.open(path).convert('RGBA')
    Ao = Atlas(112, src='orig')
    
    boxes = {
        2:  (15, 10, 157, 76), # START normal
        13: (15, 12, 157, 78), # START pressed
        14: (12,  8, 148, 66), # DELETE normal
        15: (12, 10, 148, 68), # DELETE pressed
        20: (10, 10, 136, 54), # YES normal
        21: (10, 12, 136, 56), # YES pressed
        22: (10, 10, 136, 54), # NO normal
        23: (10, 12, 136, 56), # NO pressed
    }
    for sub_idx, box in boxes.items():
        sub = Ao.crop(sub_idx)
        inpaint_rows(sub, box, k=5)
        s_info = Ao.subs[sub_idx]
        im_atlas.paste(sub, (s_info['ax'], s_info['ay']))
        
    im_atlas.save(path)
    print('Cleaned fdat_112.png (Menu buttons)')

def clean_fdat_123():
    """Store / Unit Upgrade buttons"""
    path = f'{ATLAS_DIR}/fdat_123.png'
    im_atlas = Image.open(path).convert('RGBA')
    Ao = Atlas(123, src='orig')
    
    boxes = {
        0:  (15,  8, 117, 50), # BUY normal
        1:  (15, 10, 117, 52), # BUY pressed
        6:  (15,  8, 117, 50), # SELL normal
        7:  (15, 10, 117, 52), # SELL pressed
        19: (15,  8, 135, 50), # UNEQUIP normal
        20: (15, 10, 135, 52), # UNEQUIP pressed
        24: (15, 10, 189, 56), # UPGRADE normal
        25: (15, 12, 189, 58), # UPGRADE pressed
        35: (10,  8, 122, 50), # NEED MORE GOLD
        # Navigation tabs
        8:  (12,  6, 136, 48),
        9:  (12,  6, 136, 48),
        10: (12,  6, 136, 48),
        11: (12,  6, 136, 48),
        2:  (12,  6, 136, 48),
        3:  (12,  6, 136, 48),
        4:  (12,  6, 136, 48),
        5:  (12,  6, 136, 48),
        21: (12,  6, 136, 48),
        22: (12,  6, 136, 48),
    }
    for sub_idx, box in boxes.items():
        sub = Ao.crop(sub_idx)
        inpaint_rows(sub, box, k=5)
        s_info = Ao.subs[sub_idx]
        im_atlas.paste(sub, (s_info['ax'], s_info['ay']))
        
    im_atlas.save(path)
    print('Cleaned fdat_123.png (Store buttons)')

def clean_fdat_39():
    """Cinema SKIP button"""
    path = f'{ATLAS_DIR}/fdat_39.png'
    im_atlas = Image.open(path).convert('RGBA')
    Ao = Atlas(39, src='orig')
    
    boxes = {
        0: (10, 6, 102, 36), # SKIP pressed
        1: (10, 4, 102, 34), # SKIP normal
    }
    for sub_idx, box in boxes.items():
        sub = Ao.crop(sub_idx)
        inpaint_rows(sub, box, k=4)
        s_info = Ao.subs[sub_idx]
        im_atlas.paste(sub, (s_info['ax'], s_info['ay']))
        
    im_atlas.save(path)
    print('Cleaned fdat_39.png (Cinema Skip button)')

def clean_fdat_96():
    """Level Up Skill banner (standalone text -> make transparent)"""
    path = f'{ATLAS_DIR}/fdat_96.png'
    im_atlas = Image.open(path).convert('RGBA')
    Ao = Atlas(96, src='orig')
    
    # sub 1: banner at bottom (270x46)
    sub = Ao.crop(1)
    d = ImageDraw.Draw(sub)
    d.rectangle([0, 0, sub.width, sub.height], fill=(0, 0, 0, 0))
    s_info = Ao.subs[1]
    im_atlas.paste(sub, (s_info['ax'], s_info['ay']))
    im_atlas.save(path)
    print('Cleaned fdat_96.png (Level Up banner cleared to transparent)')

def clean_fdat_99():
    """Loading text (standalone text -> make transparent)"""
    path = f'{ATLAS_DIR}/fdat_99.png'
    im_atlas = Image.open(path).convert('RGBA')
    Ao = Atlas(99, src='orig')
    
    # sub 0: (0, 810, 218, 36)
    sub = Ao.crop(0)
    d = ImageDraw.Draw(sub)
    d.rectangle([0, 0, sub.width, sub.height], fill=(0, 0, 0, 0))
    s_info = Ao.subs[0]
    im_atlas.paste(sub, (s_info['ax'], s_info['ay']))
    im_atlas.save(path)
    print('Cleaned fdat_99.png (Loading text cleared to transparent)')

def clean_fdat_90():
    """Event / Dialog buttons (SKIP & NEXT)"""
    path = f'{ATLAS_DIR}/fdat_90.png'
    im_atlas = Image.open(path).convert('RGBA')
    Ao = Atlas(90, src='orig')
    boxes = {
        0: (15, 6, 133, 46),
        1: (15, 6, 133, 46),
        2: (15, 6, 133, 48),
        3: (15, 6, 133, 46),
    }
    for sub_idx, box in boxes.items():
        sub = Ao.crop(sub_idx)
        inpaint_rows(sub, box, k=5)
        s_info = Ao.subs[sub_idx]
        im_atlas.paste(sub, (s_info['ax'], s_info['ay']))
    im_atlas.save(path)
    print('Cleaned fdat_90.png (Event dialogue buttons)')

def clean_all():
    print('Cleaning button atlases for dynamic native vector text rendering...')
    clean_fdat_126()
    clean_fdat_117()
    clean_fdat_121()
    clean_fdat_92()
    clean_fdat_122()
    clean_fdat_112()
    clean_fdat_123()
    clean_fdat_39()
    clean_fdat_96()
    clean_fdat_99()
    clean_fdat_90()
    print('All button atlases cleaned successfully!')

if __name__ == '__main__':
    clean_all()
