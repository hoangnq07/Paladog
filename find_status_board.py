# -*- coding: utf-8 -*-
import glob
import os
import zlib
import struct
from PIL import Image

# Search in all fDat bins in extracted/orig_bin
bins = glob.glob('extracted/orig_bin/*Library_fDat*.bin')
print(f"Checking {len(bins)} fDat files...")

for b in sorted(bins):
    fname = os.path.basename(b)
    with open(b, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    header = data[:4 + 32 * n]
    try:
        atlas = Image.open(io.BytesIO(data[len(header):])).convert('RGBA')
    except:
        import io
        atlas = Image.open(io.BytesIO(data[len(header):])).convert('RGBA')
    
    # Check each sub sprite
    for i in range(n):
        ax, ay, ow, oh, sx, sy, w, h = struct.unpack('<8i', data[4 + i * 32:36 + i * 32])
        # Look for status board aspect ratio and dimensions ~ 150-300 width, 150-350 height
        if 100 <= w <= 400 and 100 <= h <= 400:
            crop = atlas.crop((ax, ay, ax + w, ay + h))
            # Check if brown color exists
            # Let's save candidates
            # Brown in screenshot: r ~ 80..100, g ~ 50..70, b ~ 35..50
            arr = list(crop.getdata())
            brown_px = sum(1 for p in arr if 70 <= p[0] <= 110 and 45 <= p[1] <= 80 and 25 <= p[2] <= 60 and p[3] > 200)
            if brown_px > 5000:
                print(f"Candidate: {fname} sub {i} ({w}x{h}), brown_px={brown_px}")
                crop.save(f"scratch_cand_{fname}_sub{i}.png")
