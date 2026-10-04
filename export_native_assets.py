# -*- coding: utf-8 -*-
"""
Export Paladog assets for the native C++/SDL2 port (native_port/assets).

Layout produced:
  atlases/fdat_<N>.png   atlas image (Vietnamese-patched version when available)
  atlases/fdat_<N>.txt   first line = sub-sprite count, then one line per sub:
                         "ax ay orgW orgH x y w h"  (same order as Library.fbyteLoadDone)
  anim/ani_<N>.bin       fAni<N> data, zlib already removed (raw int32 LE stream)
  data/db_<N>.bin        DB<N> data, zlib already removed
  embed/logo_<N>.png     EMBEDIMG Logo00..02
  audio/snd_<N>.mp3      EMBEDSND index N  (Library_snd<N>)

The C++ side only needs SDL2_image + SDL2_mixer; no JSON / zlib dependency.
"""
import glob
import os
import re
import shutil
import zlib

from uitool import Atlas, DEST, ORIG

OUT = 'native_port/assets'


def export_atlases():
    out = f'{OUT}/atlases'
    os.makedirs(out, exist_ok=True)
    nums = sorted(int(re.search(r'fDat(\d+)\.bin', p).group(1))
                  for p in glob.glob(f'{ORIG}/*Library_fDat*.bin'))
    total, vn = 0, 0
    for num in nums:
        cur = glob.glob(f'{DEST}/*Library_fDat{num}.bin')
        orig = glob.glob(f'{ORIG}/*Library_fDat{num}.bin')
        src = 'cur' if cur else 'orig'
        A = Atlas(num, src=src)
        patched = bool(cur) and open(cur[0], 'rb').read() != open(orig[0], 'rb').read()
        A.img.save(f'{out}/fdat_{num}.png', format='PNG', optimize=True)
        with open(f'{out}/fdat_{num}.txt', 'w', encoding='ascii') as f:
            f.write(f'{A.n}\n')
            for s in A.subs:
                f.write(f"{s['ax']} {s['ay']} {s['ow']} {s['oh']} {s['sx']} {s['sy']} {s['w']} {s['h']}\n")
        total += A.n
        vn += patched
    # drop JSON files left over from the first exporter version
    for j in glob.glob(f'{out}/*.json'):
        os.remove(j)
    print(f'[atlas] {len(nums)} atlases, {total} sub-sprites ({vn} Vietnamese-patched)')


def export_zlib_group(pattern, out_dir, prefix):
    os.makedirs(out_dir, exist_ok=True)
    count = 0
    for p in glob.glob(f'{ORIG}/{pattern}'):
        m = re.search(r'_(?:fAni|DB)(\d+)\.bin$', p)
        if not m:
            continue
        raw = open(p, 'rb').read()
        try:
            raw = zlib.decompress(raw)
        except zlib.error:
            pass  # already plain
        with open(f'{out_dir}/{prefix}_{m.group(1)}.bin', 'wb') as f:
            f.write(raw)
        count += 1
    return count


def export_embed():
    out = f'{OUT}/embed'
    os.makedirs(out, exist_ok=True)
    n = 0
    for p in glob.glob('extracted/embed_images/*Logo0*Img.png'):
        idx = int(re.search(r'Logo0(\d)Img', p).group(1))
        shutil.copy2(p, f'{out}/logo_{idx}.png')
        n += 1
    print(f'[embed] {n} embedded images')


def export_audio():
    out = f'{OUT}/audio'
    os.makedirs(out, exist_ok=True)
    n = 0
    for p in glob.glob('extracted/sounds/*.mp3'):
        m = re.search(r'Library_snd(\d+)(?:_|\.mp3$)', os.path.basename(p))
        if m:
            shutil.copy2(p, f'{out}/snd_{int(m.group(1))}.mp3')
            n += 1
    print(f'[audio] {n} sounds')


if __name__ == '__main__':
    export_atlases()
    print(f"[anim] {export_zlib_group('*Library_fAni*.bin', f'{OUT}/anim', 'ani')} animation files")
    print(f"[data] {export_zlib_group('*Library_DB*.bin', f'{OUT}/data', 'db')} database files")
    export_embed()
    export_audio()
    old = f'{OUT}/manifest.json'
    if os.path.exists(old):
        os.remove(old)
