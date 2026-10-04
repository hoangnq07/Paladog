# -*- coding: utf-8 -*-
"""Dump an fDat atlas: list subs and render a labelled contact sheet.
usage: python dump_atlas.py <fdat number> [swf-source: orig|cur]
"""
import sys, zlib, struct, io, glob, os
from PIL import Image, ImageDraw, ImageFont

def find_bin(num, base='extracted/orig_bin'):
    for p in glob.glob(f'{base}/*Library_fDat{num}.bin'):
        return p
    raise FileNotFoundError(num)

def load(num, base='extracted/orig_bin'):
    p = find_bin(num, base)
    d = zlib.decompress(open(p, 'rb').read())
    n = struct.unpack('<I', d[:4])[0]
    subs = []
    for i in range(n):
        ax, ay, ow, oh, sx, sy, w, h = struct.unpack('<8i', d[4+i*32:4+i*32+32])
        subs.append(dict(i=i, ax=ax, ay=ay, ow=ow, oh=oh, sx=sx, sy=sy, w=w, h=h))
    atlas = Image.open(io.BytesIO(d[4+32*n:])).convert('RGBA')
    return p, subs, atlas

if __name__ == '__main__':
    num = int(sys.argv[1])
    p, subs, atlas = load(num)
    print(p, atlas.size)
    for s in subs:
        print(s)
    bg = Image.new('RGBA', atlas.size, (90, 90, 120, 255))
    bg.alpha_composite(atlas)
    d = ImageDraw.Draw(bg)
    f = ImageFont.load_default()
    for s in subs:
        d.rectangle([s['ax'], s['ay'], s['ax']+s['w']-1, s['ay']+s['h']-1], outline=(255, 0, 0, 255))
        d.text((s['ax']+2, s['ay']+2), str(s['i']), fill=(255, 255, 0, 255), font=f)
    os.makedirs('extracted/atlas_dump', exist_ok=True)
    bg.save(f'extracted/atlas_dump/fdat{num}.png')
