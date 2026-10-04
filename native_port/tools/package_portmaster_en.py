import os
import sys
import glob
import re
import shutil
import struct
import subprocess
import zipfile
import zlib
from PIL import Image, ImageDraw, ImageFont

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
sys.path.insert(0, ROOT)
from uitool import Atlas, ORIG

NATIVE = os.path.join(ROOT, 'native_port')
DIST_ROOT = os.path.join(NATIVE, 'dist', 'portmaster_en')
DIST_GAME = os.path.join(DIST_ROOT, 'paladog')
ASSETS_OUT = os.path.join(DIST_GAME, 'assets')
FONT_BOLD = os.path.join(NATIVE, 'assets', 'fonts', 'BeVietnamPro-Bold.ttf')

def export_english_data():
    os.makedirs(os.path.join(ASSETS_OUT, 'data'), exist_ok=True)
    count = 0
    for p in glob.glob(f'{ORIG}/*Library_DB*.bin'):
        m = re.search(r'_DB(\d+)\.bin$', p)
        if not m:
            continue
        raw = open(p, 'rb').read()
        try:
            payload = zlib.decompress(raw)
        except zlib.error:
            payload = raw
        num = int(m.group(1))
        out_p = os.path.join(ASSETS_OUT, 'data', f'db_{num}.bin')
        open(out_p, 'wb').write(payload)
        count += 1
    print(f"[en] Exported {count} DB files in English.")

def export_english_atlases():
    out = os.path.join(ASSETS_OUT, 'atlases')
    os.makedirs(out, exist_ok=True)
    nums = sorted(int(re.search(r'fDat(\d+)\.bin', p).group(1))
                  for p in glob.glob(f'{ORIG}/*Library_fDat*.bin'))
    total = 0
    for num in nums:
        A = Atlas(num, src='orig')
        A.img.save(os.path.join(out, f'fdat_{num}.png'), format='PNG', optimize=True)
        with open(os.path.join(out, f'fdat_{num}.txt'), 'w', encoding='ascii') as f:
            f.write(f'{A.n}\n')
            for s in A.subs:
                f.write(f"{s['ax']} {s['ay']} {s['ow']} {s['oh']} {s['sx']} {s['sy']} {s['w']} {s['h']}\n")
        total += A.n
    print(f"[en] Exported {len(nums)} English atlases ({total} sub-sprites).")

def patch_en_handheld_hud():
    # Patch fdat_143 HUD for handheld controller
    png_path = os.path.join(ASSETS_OUT, 'atlases', 'fdat_143.png')
    im = Image.open(png_path).convert('RGBA')

    crop70 = Image.new('RGBA', (614, 32), (0, 0, 0, 0))
    draw70 = ImageDraw.Draw(crop70)
    bg_color = (45, 22, 12, 255)
    txt_color = (250, 196, 0, 255)
    border_color = (20, 10, 5, 220)

    badges = [
        (0, 1, 25, 26, 'LEFT'),
        (294, 1, 319, 26, 'RIGHT'),
        (348, 6, 373, 31, 'X'),
        (468, 6, 493, 31, 'Y'),
        (588, 6, 613, 31, 'B'),
    ]
    font_letter = ImageFont.truetype(FONT_BOLD, 17)

    for x0, y0, x1, y1, kind in badges:
        draw70.rounded_rectangle([x0, y0, x1, y1], radius=5, fill=bg_color, outline=border_color, width=1)
        cx = (x0 + x1) / 2.0
        cy = (y0 + y1) / 2.0
        if kind == 'LEFT':
            pts = [(cx - 6, cy), (cx + 5, cy - 7), (cx + 5, cy + 7)]
            draw70.polygon(pts, fill=txt_color)
        elif kind == 'RIGHT':
            pts = [(cx + 6, cy), (cx - 5, cy - 7), (cx - 5, cy + 7)]
            draw70.polygon(pts, fill=txt_color)
        else:
            bbox = font_letter.getbbox(kind)
            tw = bbox[2] - bbox[0]
            th = bbox[3] - bbox[1]
            tx = x0 + (x1 - x0 + 1 - tw) // 2 - bbox[0]
            ty = y0 + (y1 - y0 + 1 - th) // 2 - bbox[1] - 1
            draw70.text((tx, ty), kind, font=font_letter, fill=txt_color)

    # Paste entry 70 back into atlas
    im.paste(crop70, (0, 364), crop70)

    # Clear entry 69 (keyboard numbers on unit cards)
    clear69 = Image.new('RGBA', (614, 28), (0, 0, 0, 0))
    im.paste(clear69, (0, 336))
    im.save(png_path, format='PNG', optimize=True)
    print("[en] Patched English handheld HUD (fdat_143).")

def patch_en_handheld_tutorials():
    # Build clean English handheld tutorials into fdat_133
    tut_png = os.path.join(ASSETS_OUT, 'atlases', 'fdat_133.png')
    im133 = Image.open(tut_png).convert('RGBA')
    f_title = ImageFont.truetype(FONT_BOLD, 22)
    f_btn = ImageFont.truetype(FONT_BOLD, 15)

    def draw_border_text(draw, text, cx, cy, font, fill_rgb, border_rgb=(20, 10, 5), border_w=2, anchor='mm'):
        for dx in range(-border_w, border_w + 1):
            for dy in range(-border_w, border_w + 1):
                if dx != 0 or dy != 0:
                    draw.text((cx + dx, cy + dy), text, font=font, fill=border_rgb, anchor=anchor)
        draw.text((cx, cy), text, font=font, fill=fill_rgb, anchor=anchor)

    # Sub 0: Move & Magic (sx=0, sy=0, sw=714, sh=254)
    c0 = im133.crop((0, 0, 714, 254))
    d0 = ImageDraw.Draw(c0)
    # Clear old keyboard headers
    d0.rectangle([0, 0, 714, 80], fill=(0, 0, 0, 0))
    d0.rounded_rectangle([20, 15, 230, 55], radius=8, fill=(45, 22, 12, 240), outline=(20, 10, 5), width=2)
    draw_border_text(d0, "MOVE:  ◀  ▶", 125, 34, f_title, (250, 196, 0))

    d0.rounded_rectangle([390, 15, 690, 55], radius=8, fill=(45, 22, 12, 240), outline=(20, 10, 5), width=2)
    draw_border_text(d0, "MAGIC: [X] [Y] [B]", 540, 34, f_title, (250, 196, 0))

    im133.paste(c0, (0, 0))
    im133.save(tut_png, format='PNG', optimize=True)
    print("[en] Patched English handheld tutorials (fdat_133).")

def generate_cover_and_screenshot():
    cov_src = os.path.join(NATIVE, 'shots', 'cover.png')
    sc_src = os.path.join(NATIVE, 'shots', 'screenshot.png')
    cov_dst = os.path.join(DIST_GAME, 'cover.png')
    sc_dst = os.path.join(DIST_GAME, 'screenshot.png')

    if os.path.exists(sc_src):
        shutil.copy2(sc_src, sc_dst)
    else:
        sim = Image.new('RGB', (640, 480), (30, 20, 15))
        sim.save(sc_dst)

    if os.path.exists(cov_src):
        shutil.copy2(cov_src, cov_dst)
    else:
        cover = Image.new('RGB', (480, 640), (25, 18, 12))
        cover.save(cov_dst)

    print("[en] Deployed high-res cover.png and screenshot.png.")

def main():
    print("=" * 60)
    print("BUILDING PALADOG ENGLISH PORTMASTER PACKAGE")
    print("=" * 60)

    if os.path.exists(DIST_ROOT):
        shutil.rmtree(DIST_ROOT)
    os.makedirs(DIST_GAME, exist_ok=True)

    # 1. Compile ARM64 English binary
    print("Compiling ARM64 binary with LANG_EN=1...")
    env = os.environ.copy()
    env['PATH'] = 'C:\\msys64\\mingw64\\bin;C:\\msys64\\usr\\bin;' + env['PATH']
    cmd_build = ['mingw32-make', 'ARM64=1', 'LANG_EN=1', '-j8']
    subprocess.check_call(cmd_build, cwd=NATIVE, env=env)

    # 2. Strip binary
    zig = None
    for d in glob.glob(os.path.join(NATIVE, 'toolchain', 'zig-*')):
        if os.path.isdir(d):
            zig = os.path.join(d, 'zig.exe')
            break
    
    raw_bin = os.path.join(NATIVE, 'build-arm64-en', 'paladog')
    out_bin = os.path.join(DIST_GAME, 'paladog')
    if zig and os.path.exists(zig):
        subprocess.check_call([zig, 'objcopy', '--strip-all', raw_bin, out_bin])
    else:
        shutil.copy2(raw_bin, out_bin)
    print(f"paladog binary ready: {os.path.getsize(out_bin)/(1024*1024):.2f} MB")

    # 3. Export English assets
    shutil.copytree(os.path.join(NATIVE, 'assets', 'anim'), os.path.join(ASSETS_OUT, 'anim'))
    shutil.copytree(os.path.join(NATIVE, 'assets', 'audio'), os.path.join(ASSETS_OUT, 'audio'))
    shutil.copytree(os.path.join(NATIVE, 'assets', 'embed'), os.path.join(ASSETS_OUT, 'embed'))
    shutil.copytree(os.path.join(NATIVE, 'assets', 'fonts'), os.path.join(ASSETS_OUT, 'fonts'))
    export_english_data()
    export_english_atlases()
    patch_en_handheld_hud()
    patch_en_handheld_tutorials()

    # 4. PortMaster scripts & metadata
    sh_src = os.path.join(NATIVE, 'package', 'Paladog.sh')
    sh_dst = os.path.join(DIST_ROOT, 'Paladog.sh')
    with open(sh_src, 'r', encoding='utf-8') as f:
        sh_content = f.read().replace('\r\n', '\n')
    with open(sh_dst, 'w', encoding='utf-8', newline='\n') as f:
        f.write(sh_content)

    port_json = """{
  "version": 4,
  "name": "paladog.zip",
  "items": [
    "Paladog.sh",
    "paladog"
  ],
  "items_opt": [],
  "attr": {
    "title": "Paladog",
    "porter": [
      "hoangnq07"
    ],
    "desc": "A classic side-scrolling strategy defense game. Lead animal critter armies to victory against demonic monster hordes!",
    "desc_md": null,
    "inst": "Ready to run. Fully self-contained port with bundled original game assets.",
    "inst_md": null,
    "genres": [
      "strategy",
      "action"
    ],
    "image": null,
    "rtr": true,
    "exp": false,
    "runtime": [],
    "store": [],
    "availability": "full",
    "reqs": [],
    "arch": [
      "aarch64"
    ],
    "min_glibc": ""
  }
}
"""
    gameinfo_xml = """<?xml version="1.0" encoding="utf-8"?>
<gameList>
  <game>
    <path>./Paladog.sh</path>
    <name>Paladog</name>
    <desc>A classic side-scrolling strategy defense game. Lead animal critter armies to victory against demonic monster hordes!</desc>
    <releasedate>20110201T000000</releasedate>
    <developer>FazeCat</developer>
    <publisher>FazeCat</publisher>
    <genre>Strategy, Action</genre>
    <image>./paladog/cover.png</image>
  </game>
</gameList>
"""
    readme_md = """# Paladog (English PortMaster Release)

Native C++ / SDL2 port of the classic strategy defense game **Paladog** by FazeCat.

## Handheld Controls:
- **D-Pad Left / Right**: Move Paladog (Normal stage) / Select unit (War Road mode)
- **D-Pad Up / Down**: Change summoning lane (War Road mode)
- **Button A**: Summon selected unit / Confirm in menus
- **Button B**: Magic skill 3 (Mace 3) / Cancel / Back
- **Button X**: Magic skill 1 (Mace 1) / Select in menus
- **Button Y**: Magic skill 2 (Mace 2)
- **L1 / R1**: Cycle through available unit types
- **Start**: Pause game

## Installation:
Extract `Paladog.sh` and the `paladog/` folder into `/roms/ports/` (or `/roms2/ports/`) on your handheld SD card.
"""
    # Write metadata to DIST_GAME
    with open(os.path.join(DIST_GAME, 'port.json'), 'w', encoding='utf-8', newline='\n') as f:
        f.write(port_json)
    with open(os.path.join(DIST_GAME, 'paladog.port.json'), 'w', encoding='utf-8', newline='\n') as f:
        f.write(port_json)
    with open(os.path.join(DIST_GAME, 'gameinfo.xml'), 'w', encoding='utf-8', newline='\n') as f:
        f.write(gameinfo_xml)
    with open(os.path.join(DIST_GAME, 'README.md'), 'w', encoding='utf-8', newline='\n') as f:
        f.write(readme_md)

    generate_cover_and_screenshot()

    # Also write metadata and images to DIST_ROOT for PortMaster-New repo structure
    with open(os.path.join(DIST_ROOT, 'port.json'), 'w', encoding='utf-8', newline='\n') as f:
        f.write(port_json)
    with open(os.path.join(DIST_ROOT, 'gameinfo.xml'), 'w', encoding='utf-8', newline='\n') as f:
        f.write(gameinfo_xml)
    with open(os.path.join(DIST_ROOT, 'README.md'), 'w', encoding='utf-8', newline='\n') as f:
        f.write(readme_md)
    shutil.copy2(os.path.join(DIST_GAME, 'cover.png'), os.path.join(DIST_ROOT, 'cover.png'))
    shutil.copy2(os.path.join(DIST_GAME, 'screenshot.png'), os.path.join(DIST_ROOT, 'screenshot.png'))

    # Prepare PortMaster-New staging repository structure:
    # ports/paladog/
    #   Paladog.sh
    #   README.md
    #   cover.png
    #   screenshot.png
    #   gameinfo.xml
    #   port.json
    #   paladog/
    REPO_STAGE = os.path.join(NATIVE, 'dist', 'portmaster_repo', 'ports', 'paladog')
    if os.path.exists(REPO_STAGE):
        shutil.rmtree(REPO_STAGE)
    os.makedirs(REPO_STAGE, exist_ok=True)

    for fn in ['Paladog.sh', 'README.md', 'cover.png', 'screenshot.png', 'gameinfo.xml', 'port.json']:
        shutil.copy2(os.path.join(DIST_ROOT, fn), os.path.join(REPO_STAGE, fn))
    shutil.copytree(DIST_GAME, os.path.join(REPO_STAGE, 'paladog'))
    print(f"[en] Prepared PortMaster-New repo directory: {REPO_STAGE}")

    # 5. Zip PortMaster release (only Paladog.sh and paladog/ directory)
    zip_root = os.path.join(ROOT, 'Paladog_PortMaster_EN.zip')
    zip_dist = os.path.join(NATIVE, 'dist', 'Paladog_PortMaster_EN.zip')
    zip_pm = os.path.join(NATIVE, 'dist', 'paladog.zip')
    print("Creating PortMaster ZIP archives...")
    for zpath in [zip_root, zip_dist, zip_pm]:
        with zipfile.ZipFile(zpath, 'w', zipfile.ZIP_DEFLATED, compresslevel=6) as zf:
            # Add Paladog.sh
            zf.write(os.path.join(DIST_ROOT, 'Paladog.sh'), 'Paladog.sh')
            # Add paladog folder
            for r, _, files in os.walk(DIST_GAME):
                for f in files:
                    fp = os.path.join(r, f)
                    rel = os.path.relpath(fp, DIST_ROOT)
                    zf.write(fp, rel)
        print(f"  -> {zpath} ({os.path.getsize(zpath)/(1024*1024):.1f} MB)")

    print("\nPortMaster English build completed successfully!")

if __name__ == '__main__':
    main()
