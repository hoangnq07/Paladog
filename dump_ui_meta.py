import zlib, struct, os

def get_sheet_meta(bin_path):
    with open(bin_path, 'rb') as f:
        data = zlib.decompress(f.read())
    n = struct.unpack('<I', data[:4])[0]
    sub_rects = []
    for i in range(n):
        off = 4 + i * 32
        ax, ay, orgw, orgh, sx, sy, w, h = struct.unpack('<8i', data[off:off+32])
        sub_rects.append({'i': i, 'ax': ax, 'ay': ay, 'w': w, 'h': h, 'sx': sx, 'sy': sy})
    return n, sub_rects

sheets = {
    'loading': 'extracted/binaryData/154_com.fazecat.web.paladog.Library_fDat99.bin',
    'titlebtn': 'extracted/binaryData/138_com.fazecat.web.paladog.Library_fDat126.bin',
    'option': 'extracted/binaryData/186_com.fazecat.web.paladog.Library_fDat115.bin',
    'tutorial0': 'extracted/binaryData/141_com.fazecat.web.paladog.Library_fDat129.bin',
    'tutorial1': 'extracted/binaryData/147_com.fazecat.web.paladog.Library_fDat130.bin',
    'tutorial2': 'extracted/binaryData/146_com.fazecat.web.paladog.Library_fDat131.bin',
    'tutorial3': 'extracted/binaryData/145_com.fazecat.web.paladog.Library_fDat132.bin',
    'tutorial4': 'extracted/binaryData/144_com.fazecat.web.paladog.Library_fDat133.bin',
    'pause': 'extracted/binaryData/180_com.fazecat.web.paladog.Library_fDat117.bin',
    'menu': 'extracted/binaryData/185_com.fazecat.web.paladog.Library_fDat112.bin',
    'store': 'extracted/binaryData/139_com.fazecat.web.paladog.Library_fDat123.bin',
    'stageclear': 'extracted/binaryData/189_com.fazecat.web.paladog.Library_fDat121.bin',
    'stageselect': 'extracted/binaryData/190_com.fazecat.web.paladog.Library_fDat122.bin',
    'fail': 'extracted/binaryData/164_com.fazecat.web.paladog.Library_fDat92.bin',
    'chapterclear': 'extracted/binaryData/203_com.fazecat.web.paladog.Library_fDat33.bin',
    'cinemabtn': 'extracted/binaryData/228_com.fazecat.web.paladog.Library_fDat39.bin',
}

for name, path in sheets.items():
    n, rects = get_sheet_meta(path)
    print(f'=== {name} (N={n}) ===')
    for r in rects:
        if r['w'] > 0 and r['h'] > 0:
            print(f"  sub_{r['i']:02d}: pos=({r['ax']},{r['ay']}), size=({r['w']},{r['h']})")
