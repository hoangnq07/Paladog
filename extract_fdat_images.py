import glob
import os
import re
import zlib
import struct

os.makedirs('extracted/fdat_images', exist_ok=True)

# 1. Map fDat number to bin file path
fdat_to_bin = {}
for as_file in glob.glob('extracted/scripts/scripts/com/fazecat/web/paladog/Library_fDat*.as'):
    with open(as_file, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()
    m_fdat = re.search(r'class Library_fDat(\d+)', content)
    m_bin = re.search(r'source="/_assets/([^"]+)"', content)
    if m_fdat and m_bin:
        fdat_num = int(m_fdat.group(1))
        bin_name = m_bin.group(1)
        bin_path = os.path.join('extracted/binaryData', bin_name)
        if os.path.exists(bin_path):
            fdat_to_bin[fdat_num] = (bin_name, bin_path)

print(f'Mapped {len(fdat_to_bin)} fDat classes to bin files')

# 2. Map constant names from Library.as
const_to_fdat = {}
with open('extracted/scripts/scripts/com/fazecat/web/paladog/Library.as', 'r', encoding='utf-8', errors='ignore') as f:
    for line in f:
        m = re.match(r'\s*public static const (\w+):int = (\d+);', line)
        if m:
            cname = m.group(1)
            cval = int(m.group(2))
            if cval in fdat_to_bin:
                const_to_fdat[cname] = cval

print(f'Mapped {len(const_to_fdat)} named constants to fDat')

# 3. Extract and save PNG/JPG for all fDat
report = []
for cname, fdat_num in sorted(const_to_fdat.items(), key=lambda x: x[1]):
    bin_name, bin_path = fdat_to_bin[fdat_num]
    with open(bin_path, 'rb') as f:
        raw = f.read()
    try:
        data = zlib.decompress(raw)
        n_images = struct.unpack('<I', data[:4])[0]
        header_size = 4 + 8 * 4 * n_images
        img_bytes = data[header_size:]
        ext = 'png' if img_bytes[:8] == b'\x89PNG\r\n\x1a\n' else ('jpg' if img_bytes[:2] == b'\xff\xd8' else 'bin')
        out_name = f'fdat_{fdat_num:03d}_{cname}.{ext}'
        out_path = os.path.join('extracted/fdat_images', out_name)
        with open(out_path, 'wb') as out_f:
            out_f.write(img_bytes)
        
        # Also parse sub-rectangles
        sub_rects = []
        for i in range(n_images):
            off = 4 + i * 32
            sub_rects.append(struct.unpack('<8i', data[off:off+32]))
            
        report.append({
            'const': cname,
            'fdat': fdat_num,
            'bin_name': bin_name,
            'n_images': n_images,
            'ext': ext,
            'sub_rects': sub_rects
        })
    except Exception as e:
        print(f'Error processing {cname} (fDat{fdat_num}): {e}')

print(f'Successfully extracted {len(report)} images to extracted/fdat_images/')

# Look at UI / text relevant constants
targets = ['loading', 'option', 'titlebtn', 'tutorial0', 'tutorial1', 'tutorial2', 'tutorial3', 'tutorial4', 'ui', 'menu', 'store', 'stageselect', 'pause', 'title', 'ending', 'chapterclear', 'btn']
for t in targets:
    if t in const_to_fdat:
        num = const_to_fdat[t]
        bin_n = fdat_to_bin[num][0]
        print(f'{t:15s} -> fdat_{num:03d}_{t}.png (from {bin_n})')
