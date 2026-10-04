# -*- coding: utf-8 -*-
"""
Paladog Atlas & Sprite Studio - Local Web Server
Provides visual editing, sprite replacement, and instant preview for Paladog assets.
"""
import os
import sys
import io
import re
import glob
import json
import base64
import shutil
import subprocess
from flask import Flask, jsonify, request, send_file, render_template_string

# Ensure project root is in sys.path
STUDIO_DIR = os.path.dirname(os.path.abspath(__file__))
TOOLS_DIR = os.path.dirname(STUDIO_DIR)
PORT_DIR = os.path.dirname(TOOLS_DIR)
ROOT_DIR = os.path.dirname(PORT_DIR)
sys.path.insert(0, ROOT_DIR)
sys.path.insert(0, TOOLS_DIR)

from uitool import Atlas

app = Flask(__name__, static_folder=None)

ATLAS_DIR = os.path.join(PORT_DIR, 'assets', 'atlases')
FONTS_DIR = os.path.join(PORT_DIR, 'assets', 'fonts')

KNOWN_ATLASES = {
    133: {"name": "Hướng Dẫn 1 - Điều Khiển Cơ Bản", "cat": "tutorials", "desc": "Các trang hướng dẫn di chuyển, dùng phép thuật, triệu hồi lính, và sơ đồ tay cầm R36S."},
    129: {"name": "Hướng Dẫn 2 - Trận Đánh & Năng Lượng", "cat": "tutorials", "desc": "Hướng dẫn sử dụng chùy phép X/Y/B, lương thực triệu hồi lính, thanh máu căn cứ & Boss."},
    130: {"name": "Hướng Dẫn 3 - Chế Độ Vận Mệnh (Destiny)", "cat": "tutorials", "desc": "Hướng dẫn chế độ Destiny, chọn thẻ và tung chiêu lính/phép."},
    131: {"name": "Hướng Dẫn 4 - Chế Độ Chiến Trường (Warroad)", "cat": "tutorials", "desc": "Hướng dẫn chọn làn đường và điều quân tiến công."},
    132: {"name": "Hướng Dẫn 5 - Cửa Hàng & Túi Đồ", "cat": "tutorials", "desc": "Hướng dẫn nâng cấp lính, mua trang bị và câu chuyện gấu trúc giang hồ."},
    143: {"name": "Giao Diện Trận Chiến (Battle HUD)", "cat": "hud", "desc": "Các nút mũi tên di chuyển ◀ ▶, huy hiệu phím X/Y/B, 9 ô thẻ lính, cột máu & mana."},
    96:  {"name": "Banner Chọn Kỹ Năng (Level Up)", "cat": "hud", "desc": "Khung chữ chọn kỹ năng mỗi khi Paladog lên cấp trong trận đánh."},
    117: {"name": "Màn Hình Tạm Dừng (Pause Menu)", "cat": "hud", "desc": "Nút Tiếp tục, Bỏ cuộc, nút bật tắt âm thanh & nhạc nền."},
    121: {"name": "Màn Hình Chiến Thắng (Victory / Stage Clear)", "cat": "hud", "desc": "Nút Tiếp tục / OK và các huy hiệu đánh giá sao."},
    92:  {"name": "Màn Hình Thất Bại (Game Over / Defeat)", "cat": "hud", "desc": "Nút Thử lại (Retry) và trở về bản đồ."},
    126: {"name": "Màn Hình Tiêu Đề (Title Screen)", "cat": "menu", "desc": "Viên ngọc xanh nút CHƠI (Play) ở màn hình chính."},
    112: {"name": "Chọn Slot Lưu Game (Save Slots)", "cat": "menu", "desc": "Nút Bắt đầu, Xóa, Đồng ý (Có), Hủy (Không) trong menu lưu game."},
    122: {"name": "Bản Đồ Chọn Màn (Stage Select Map)", "cat": "menu", "desc": "Nút NÂNG CẤP (Upgrade) màu tím ở góc bản đồ."},
    123: {"name": "Cửa Hàng & Túi Đồ (Shop & Inventory)", "cat": "menu", "desc": "Các nút Mua, Bán, Tháo đồ, Nâng cấp và thẻ chuyển danh mục."},
    90:  {"name": "Nút Thoại Cắt Cảnh & Sự Kiện (Dialog Buttons)", "cat": "menu", "desc": "Nút BỎ QUA và TIẾP TỤC ở các đoạn hội thoại trước trận chiến."},
    39:  {"name": "Cắt Cảnh Cốt Truyện (Cinema)", "cat": "story", "desc": "Nút BỎ QUA (Skip) khi xem các đoạn giới thiệu cốt truyện."},
    99:  {"name": "Màn Hình Chờ (Loading Screen)", "cat": "menu", "desc": "Biểu tượng xoay và chữ Đang tải..."}
}

def get_atlas_subs(num):
    txt_path = os.path.join(ATLAS_DIR, f'fdat_{num}.txt')
    if not os.path.exists(txt_path):
        return []
    lines = open(txt_path, 'r', encoding='utf-8').read().splitlines()
    if not lines:
        return []
    subs = []
    for idx, line in enumerate(lines[1:]):
        line = line.strip()
        if not line:
            continue
        parts = list(map(int, line.split()))
        if len(parts) >= 8:
            ax, ay, ow, oh, sx, sy, w, h = parts[:8]
            subs.append({
                "idx": idx,
                "ax": ax,
                "ay": ay,
                "ow": ow,
                "oh": oh,
                "sx": sx,
                "sy": sy,
                "w": w,
                "h": h
            })
    return subs

@app.route('/')
def index():
    html_path = os.path.join(STUDIO_DIR, 'index.html')
    if os.path.exists(html_path):
        with open(html_path, 'r', encoding='utf-8') as f:
            return f.read()
    return "<h1>Studio UI not found</h1>"

@app.route('/fonts/<path:filename>')
def serve_font(filename):
    return send_file(os.path.join(FONTS_DIR, filename))

@app.route('/api/atlases')
def api_atlases():
    result = []
    txt_files = glob.glob(os.path.join(ATLAS_DIR, 'fdat_*.txt'))
    
    # Sort numerically
    def get_num(p):
        m = re.search(r'fdat_(\d+)\.txt', p)
        return int(m.group(1)) if m else 9999
        
    txt_files.sort(key=get_num)
    
    for tf in txt_files:
        num = get_num(tf)
        png_path = os.path.join(ATLAS_DIR, f'fdat_{num}.png')
        hh_path = os.path.join(ATLAS_DIR, f'fdat_{num}_handheld.png')
        if not os.path.exists(png_path):
            continue
            
        subs = get_atlas_subs(num)
        info = KNOWN_ATLASES.get(num, {
            "name": f"Atlas {num}",
            "cat": "other",
            "desc": f"Tập hợp tài nguyên hình ảnh {num}"
        })
        
        result.append({
            "num": num,
            "name": info["name"],
            "cat": info["cat"],
            "desc": info["desc"],
            "sub_count": len(subs),
            "has_handheld": os.path.exists(hh_path)
        })
        
    return jsonify(result)

@app.route('/api/atlas/<int:num>')
def api_atlas_detail(num):
    subs = get_atlas_subs(num)
    info = KNOWN_ATLASES.get(num, {
        "name": f"Atlas {num}",
        "cat": "other",
        "desc": f"Tập hợp tài nguyên hình ảnh {num}"
    })
    hh_path = os.path.join(ATLAS_DIR, f'fdat_{num}_handheld.png')
    png_path = os.path.join(ATLAS_DIR, f'fdat_{num}.png')
    
    # Check dimensions of current atlas
    from PIL import Image
    im = Image.open(png_path)
    
    return jsonify({
        "num": num,
        "name": info["name"],
        "cat": info["cat"],
        "desc": info["desc"],
        "width": im.width,
        "height": im.height,
        "subs": subs,
        "has_handheld": os.path.exists(hh_path)
    })

@app.route('/api/atlas/<int:num>/image')
def api_atlas_image(num):
    use_hh = request.args.get('handheld', '0') == '1'
    hh_path = os.path.join(ATLAS_DIR, f'fdat_{num}_handheld.png')
    png_path = os.path.join(ATLAS_DIR, f'fdat_{num}.png')
    
    target = hh_path if (use_hh and os.path.exists(hh_path)) else png_path
    if not os.path.exists(target):
        return "Not found", 404
        
    return send_file(target, mimetype='image/png')

@app.route('/api/sprite/<int:num>/<int:sub_idx>/current.png')
def api_sprite_current(num, sub_idx):
    use_hh = request.args.get('handheld', '0') == '1'
    subs = get_atlas_subs(num)
    if sub_idx < 0 or sub_idx >= len(subs):
        return "Sub index out of range", 404
    s = subs[sub_idx]
    
    hh_path = os.path.join(ATLAS_DIR, f'fdat_{num}_handheld.png')
    png_path = os.path.join(ATLAS_DIR, f'fdat_{num}.png')
    target = hh_path if (use_hh and os.path.exists(hh_path)) else png_path
    
    from PIL import Image
    im = Image.open(target).convert('RGBA')
    crop = im.crop((s['ax'], s['ay'], s['ax'] + s['w'], s['ay'] + s['h']))
    
    buf = io.BytesIO()
    crop.save(buf, format='PNG')
    buf.seek(0)
    return send_file(buf, mimetype='image/png')

@app.route('/api/sprite/<int:num>/<int:sub_idx>/orig.png')
def api_sprite_orig(num, sub_idx):
    try:
        Ao = Atlas(num, src='orig')
        if sub_idx < 0 or sub_idx >= len(Ao.subs):
            return "Sub index out of range", 404
        crop = Ao.crop(sub_idx)
        buf = io.BytesIO()
        crop.save(buf, format='PNG')
        buf.seek(0)
        return send_file(buf, mimetype='image/png')
    except Exception as e:
        return jsonify({"error": str(e)}), 404

@app.route('/api/sprite/<int:num>/<int:sub_idx>/save', methods=['POST'])
def api_sprite_save(num, sub_idx):
    subs = get_atlas_subs(num)
    if sub_idx < 0 or sub_idx >= len(subs):
        return jsonify({"error": "Sub index out of range"}), 400
    s = subs[sub_idx]
    
    from PIL import Image
    
    # Read incoming image
    img_data = None
    if 'file' in request.files:
        img_data = request.files['file'].read()
    else:
        req_json = request.get_json(silent=True) or {}
        if 'image_base64' in req_json:
            b64 = req_json['image_base64']
            if ',' in b64:
                b64 = b64.split(',', 1)[1]
            img_data = base64.b64decode(b64)
            
    if not img_data:
        return jsonify({"error": "Không có dữ liệu ảnh"}), 400
        
    new_sprite = Image.open(io.BytesIO(img_data)).convert('RGBA')
    
    # Check dimension: if slight mismatch, resize smoothly with Lanczos
    if new_sprite.size != (s['w'], s['h']):
        new_sprite = new_sprite.resize((s['w'], s['h']), Image.LANCZOS)
        
    png_path = os.path.join(ATLAS_DIR, f'fdat_{num}.png')
    hh_path = os.path.join(ATLAS_DIR, f'fdat_{num}_handheld.png')
    
    # Make backup of original png if not already backed up
    bak_path = png_path + '.bak'
    if not os.path.exists(bak_path) and os.path.exists(png_path):
        shutil.copy2(png_path, bak_path)
        
    # Paste into fdat_<num>.png
    im = Image.open(png_path).convert('RGBA')
    # Clear target area first to avoid alpha blending ghosting
    blank = Image.new('RGBA', (s['w'], s['h']), (0, 0, 0, 0))
    im.paste(blank, (s['ax'], s['ay']))
    im.paste(new_sprite, (s['ax'], s['ay']), new_sprite)
    im.save(png_path)
    
    # If handheld atlas exists, paste into it as well
    if os.path.exists(hh_path):
        im_hh = Image.open(hh_path).convert('RGBA')
        im_hh.paste(blank, (s['ax'], s['ay']))
        im_hh.paste(new_sprite, (s['ax'], s['ay']), new_sprite)
        im_hh.save(hh_path)
        
    return jsonify({
        "success": True,
        "message": f"Đã lưu thành công Sprite {sub_idx} vào Atlas {num}!",
        "w": s['w'],
        "h": s['h']
    })

@app.route('/api/sprite/<int:num>/<int:sub_idx>/restore_orig', methods=['POST'])
def api_sprite_restore_orig(num, sub_idx):
    try:
        Ao = Atlas(num, src='orig')
        if sub_idx < 0 or sub_idx >= len(Ao.subs):
            return jsonify({"error": "Sub index out of range"}), 400
            
        subs = get_atlas_subs(num)
        s = subs[sub_idx]
        orig_crop = Ao.crop(sub_idx)
        
        from PIL import Image
        png_path = os.path.join(ATLAS_DIR, f'fdat_{num}.png')
        hh_path = os.path.join(ATLAS_DIR, f'fdat_{num}_handheld.png')
        
        im = Image.open(png_path).convert('RGBA')
        blank = Image.new('RGBA', (s['w'], s['h']), (0, 0, 0, 0))
        im.paste(blank, (s['ax'], s['ay']))
        im.paste(orig_crop, (s['ax'], s['ay']), orig_crop)
        im.save(png_path)
        
        if os.path.exists(hh_path):
            im_hh = Image.open(hh_path).convert('RGBA')
            im_hh.paste(blank, (s['ax'], s['ay']))
            im_hh.paste(orig_crop, (s['ax'], s['ay']), orig_crop)
            im_hh.save(hh_path)
            
        return jsonify({
            "success": True,
            "message": f"Đã khôi phục Sprite {sub_idx} về bản gốc nguyên bản!"
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/api/build/windows', methods=['POST'])
def api_build_windows():
    make_exe = r'C:\msys64\mingw64\bin\mingw32-make.exe'
    if not os.path.exists(make_exe):
        make_exe = 'make'
    cmd = [make_exe, '-C', 'native_port']
    res = subprocess.run(cmd, cwd=ROOT_DIR, capture_output=True, text=True)
    return jsonify({
        "success": res.returncode == 0,
        "stdout": res.stdout,
        "stderr": res.stderr
    })

@app.route('/api/build/r36s', methods=['POST'])
def api_build_r36s():
    ps1 = os.path.join(TOOLS_DIR, 'package_r36s.ps1')
    cmd = ['powershell', '-ExecutionPolicy', 'Bypass', '-File', ps1]
    res = subprocess.run(cmd, cwd=ROOT_DIR, capture_output=True, text=True)
    return jsonify({
        "success": res.returncode == 0,
        "stdout": res.stdout,
        "stderr": res.stderr
    })

@app.route('/api/run/game', methods=['POST'])
def api_run_game():
    exe_path = os.path.join(PORT_DIR, 'build', 'paladog.exe')
    if not os.path.exists(exe_path):
        return jsonify({"error": "Chưa có file paladog.exe, vui lòng bấm Biên dịch Windows trước"}), 400
    subprocess.Popen([exe_path], cwd=PORT_DIR)
    return jsonify({"success": True, "message": "Đã khởi chạy Paladog!"})

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5050))
    print(f"\n=======================================================")
    print(f"  PALADOG ATLAS & SPRITE STUDIO")
    print(f"  Truy cap Studio tai dia chi:")
    print(f"  >>> http://127.0.0.1:{port} <<<")
    print(f"=======================================================\n")
    app.run(host='0.0.0.0', port=port, debug=False)
