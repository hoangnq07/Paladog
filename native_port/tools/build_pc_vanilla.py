import os
import sys
import shutil
import subprocess
import zipfile

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
sys.path.insert(0, ROOT)
from uitool import Atlas
NATIVE = os.path.join(ROOT, 'native_port')
DIST_PC = os.path.join(NATIVE, 'dist', 'Paladog_PC')

def get_deps(pe_path):
    res = set()
    out = subprocess.check_output(['C:/msys64/mingw64/bin/objdump.exe', '-p', pe_path], text=True)
    for line in out.splitlines():
        if 'DLL Name:' in line:
            dll = line.split('DLL Name:')[1].strip()
            res.add(dll)
    return res

def collect_dlls(exe_path):
    all_dlls = set()
    todo = [exe_path]
    seen = set()
    system_prefixes = (
        'kernel32', 'msvcrt', 'shell32', 'user32', 'gdi32', 'advapi32',
        'ole32', 'winmm', 'imm32', 'version', 'setupapi', 'ws2_32',
        'd3d', 'dxgi', 'ntdll', 'rpcrt4', 'oleaut32', 'shlwapi', 'uxtheme'
    )
    while todo:
        curr = todo.pop()
        if curr in seen:
            continue
        seen.add(curr)
        deps = get_deps(curr)
        for d in deps:
            if d.lower().startswith(system_prefixes):
                continue
            p = os.path.join('C:/msys64/mingw64/bin', d)
            if os.path.exists(p) and p not in all_dlls:
                all_dlls.add(p)
                todo.append(p)
    return sorted(all_dlls)

def main():
    print("Building Paladog PC Vanilla...")
    if os.path.exists(DIST_PC):
        shutil.rmtree(DIST_PC)
    os.makedirs(DIST_PC, exist_ok=True)

    # 1. Compile old_main.o
    old_main_src = os.path.join(NATIVE, 'scratch', 'old_main.cpp')
    old_main_obj = os.path.join(NATIVE, 'scratch', 'old_main.o')
    cmd = [
        'g++', '-O2', '-std=c++17', '-fwrapv', '-Wall', '-Wextra', '-Wno-unused-parameter',
        f'-I{os.path.join(NATIVE, "src")}',
        '-IC:/msys64/mingw64/include/SDL2',
        '-Dmain=SDL_main',
        '-IC:/msys64/mingw64/include/freetype2',
        '-c', old_main_src, '-o', old_main_obj
    ]
    subprocess.check_call(cmd)

    # 2. Link paladog_pc.exe with static gcc/stdc++
    pc_exe = os.path.join(DIST_PC, 'Paladog.exe')
    link_cmd = [
        'g++', '-o', pc_exe,
        old_main_obj,
        os.path.join(NATIVE, 'build/obj/engine/gfx.o'),
        os.path.join(NATIVE, 'build/obj/engine/audio.o'),
        os.path.join(NATIVE, 'build/obj/engine/text.o'),
        os.path.join(NATIVE, 'build/obj/runtime/as3.o'),
        os.path.join(NATIVE, 'build/obj/game/lib.o'),
        os.path.join(NATIVE, 'build/obj/game/drawing_ext.o'),
        os.path.join(NATIVE, 'build/obj/game/ui_overlay.o'),
    ]
    gen_objs = [os.path.join(NATIVE, 'build/obj/gen', f) for f in os.listdir(os.path.join(NATIVE, 'build/obj/gen')) if f.endswith('.o')]
    link_cmd.extend(gen_objs)
    link_cmd.extend([
        '-LC:/msys64/mingw64/lib',
        '-lSDL2_image', '-lSDL2_mixer', '-lSDL2_ttf',
        '-lmingw32', '-mwindows', '-lSDL2main', '-lSDL2',
        '-static-libgcc', '-static-libstdc++'
    ])
    subprocess.check_call(link_cmd)
    print("Paladog.exe linked successfully.")

    # 3. Copy DLL dependencies
    dlls = collect_dlls(pc_exe)
    print(f"Copying {len(dlls)} DLL dependencies...")
    for d in dlls:
        shutil.copy2(d, DIST_PC)

    # 4. Copy base assets
    assets_dst = os.path.join(DIST_PC, 'assets')
    shutil.copytree(os.path.join(NATIVE, 'assets'), assets_dst)

    # 5. Restore pure PC versions of atlases (fdat 133 tutorial & fdat 143 HUD)
    print("Restoring PC keyboard HUD and tutorials...")
    atlases_dst = os.path.join(assets_dst, 'atlases')
    for num in [133, 143]:
        A = Atlas(num, src='cur')
        png_out = os.path.join(atlases_dst, f'fdat_{num}.png')
        txt_out = os.path.join(atlases_dst, f'fdat_{num}.txt')
        A.img.save(png_out, format='PNG', optimize=True)
        with open(txt_out, 'w', encoding='ascii') as f:
            f.write(f'{A.n}\n')
            for s in A.subs:
                f.write(f"{s['ax']} {s['ay']} {s['ow']} {s['oh']} {s['sx']} {s['sy']} {s['w']} {s['h']}\n")
    # Clean up handheld variant images if any in PC assets
    for f in os.listdir(atlases_dst):
        if 'handheld' in f:
            os.remove(os.path.join(atlases_dst, f))

    # 6. Write README_PC.txt
    readme_text = """============================================================
PALADOG VIETNAMESE (BẢN BÀN PHÍM & CHUỘT CHO MÁY TÍNH PC)
============================================================

1. CÁCH CHƠI TRÊN PC:
- Di chuyển Paladog: Phím [A] (sang trái), Phím [D] (sang phải)
- Sử dụng Phép thuật / Gậy: Phím [J], [K], [L]
- Triệu hồi Quân lính: Phím [1] đến [9]
- Tạm dừng (Pause): Phím [ESC]
- Toàn bộ menu, cửa hàng, chọn ải: Dùng CHUỘT bấm trực tiếp

2. ƯU ĐIỂM BẢN NATIVE PORT NÀY:
- Chạy trực tiếp native C++ 60 FPS siêu mượt, không cần trình giả lập Flash.
- Font chữ tiếng Việt sắc nét, rõ đẹp.
- Không có các nút hay icon tay cầm của máy handheld R36S.
- Khởi động chạy ngay bằng cách mở Paladog.exe (đầy đủ DLL đi kèm).

Chúc bạn chơi game vui vẻ!
"""
    with open(os.path.join(DIST_PC, 'README_PC.txt'), 'w', encoding='utf-8') as f:
        f.write(readme_text)

    # 7. Zip package
    zip_path = os.path.join(ROOT, 'Paladog_PC_VN.zip')
    dist_zip_path = os.path.join(NATIVE, 'dist', 'Paladog_PC_VN.zip')
    print("Packaging ZIP...")
    with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED, compresslevel=6) as zf:
        for root_dir, _, files in os.walk(DIST_PC):
            for file in files:
                full_path = os.path.join(root_dir, file)
                rel_path = os.path.relpath(full_path, DIST_PC)
                zf.write(full_path, os.path.join('Paladog_PC', rel_path))
    shutil.copy2(zip_path, dist_zip_path)
    print(f"Done! PC build is in: {DIST_PC}")
    print(f"Zip created at: {zip_path} ({os.path.getsize(zip_path)/(1024*1024):.1f} MB)")

if __name__ == '__main__':
    main()
