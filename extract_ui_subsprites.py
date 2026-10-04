import os
import zlib
import struct
from PIL import Image

fdat_targets = {
    'loading': (99, 'extracted/binaryData/154_com.fazecat.web.paladog.Library_fDat99.bin'),
    'option': (115, 'extracted/binaryData/186_com.fazecat.web.paladog.Library_fDat115.bin'),
    'titlebtn': (126, 'extracted/binaryData/138_com.fazecat.web.paladog.Library_fDat126.bin'),
    'tutorial0': (129, 'extracted/binaryData/141_com.fazecat.web.paladog.Library_fDat129.bin'),
    'tutorial1': (130, 'extracted/binaryData/147_com.fazecat.web.paladog.Library_fDat130.bin'),
    'tutorial2': (131, 'extracted/binaryData/146_com.fazecat.web.paladog.Library_fDat131.bin'),
    'tutorial3': (132, 'extracted/binaryData/145_com.fazecat.web.paladog.Library_fDat132.bin'),
    'tutorial4': (133, 'extracted/binaryData/144_com.fazecat.web.paladog.Library_fDat133.bin'),
    'pause': (117, 'extracted/binaryData/180_com.fazecat.web.paladog.Library_fDat117.bin'),
    'menu': (112, 'extracted/binaryData/185_com.fazecat.web.paladog.Library_fDat112.bin'),
    'store': (123, 'extracted/binaryData/139_com.fazecat.web.paladog.Library_fDat123.bin'),
    'ui': (143, 'extracted/binaryData/168_com.fazecat.web.paladog.Library_fDat143.bin'),
    'btn': (31, 'extracted/binaryData/205_com.fazecat.web.paladog.Library_fDat31.bin'),
}

os.makedirs('extracted/ui_subsprites', exist_ok=True)

for name, (fdat_num, bin_path) in fdat_targets.items():
    with open(bin_path, 'rb') as f:
        raw = f.read()
    data = zlib.decompress(raw)
    n_images = struct.unpack('<I', data[:4])[0]
    header_size = 4 + 8 * 4 * n_images
    img_bytes = data[header_size:]
    
    sheet_dir = os.path.join('extracted/ui_subsprites', name)
    os.makedirs(sheet_dir, exist_ok=True)
    
    # Save the full atlas image
    atlas_path = os.path.join(sheet_dir, 'atlas.png')
    with open(atlas_path, 'wb') as f:
        f.write(img_bytes)
    
    atlas_img = Image.open(atlas_path).convert('RGBA')
    
    meta = []
    for i in range(n_images):
        off = 4 + i * 32
        ax, ay, orgw, orgh, sx, sy, w, h = struct.unpack('<8i', data[off:off+32])
        meta.append({'idx': i, 'ax': ax, 'ay': ay, 'orgw': orgw, 'orgh': orgh, 'sx': sx, 'sy': sy, 'w': w, 'h': h})
        if w > 0 and h > 0:
            sub = atlas_img.crop((ax, ay, ax + w, ay + h))
            sub.save(os.path.join(sheet_dir, f'sub_{i:02d}.png'))
    
    print(f'{name:12s}: {n_images:2d} subsprites extracted to {sheet_dir}')
