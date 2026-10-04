# -*- coding: utf-8 -*-
"""v2 patcher: redoes UI atlases from the *original* bins with proper alignment.
Run after extract_clean_fdat.py + patch_all_ui_assets.py (legacy ones) -- this
script reads from extracted/orig_bin and overwrites the atlases it owns.
"""
import sys
from uitool import *

lum = lambda r, g, b: 0.3 * r + 0.59 * g + 0.11 * b
OUTLINE_BLACK = (0, 0, 0, 255)


# ============================================================ fDat112 menu / slot
def patch_112():
    A = Atlas(112)

    # --- header parchment (LV / GOLD / PLAY TIME / h m s)
    s = A.crop(12)
    pred = lambda r, g, b, a: lum(r, g, b) < 135 or (max(r, g, b) - min(r, g, b)) > 135
    boxes = [(18, 24, 92, 68), (88, 68, 202, 106), (22, 99, 202, 141),
             (256, 106, 290, 142), (334, 106, 372, 142), (414, 106, 452, 142)]
    m = Image.new('L', s.size, 0)
    for b in boxes:
        mm = make_mask(s, b, pred, grow=2)
        m = ImageChops.lighter(m, mm)
    inpaint_mask(s, m)
    put(s, fit_text('CẤP:', (62, 32), 30, path=F_BLACK, fill=(40, 175, 240, 255), stroke=2, stroke_fill=(10, 30, 60, 255)),
        (22, 24, 90, 68), anchor='l')
    put(s, fit_text('VÀNG :', (110, 30), 30, path=F_BLACK, fill=(255, 236, 0, 255), stroke=2, stroke_fill=(90, 55, 0, 255)),
        (92, 68, 202, 106), anchor='r')
    put(s, fit_text('THỜI GIAN :', (172, 30), 30, path=F_BLACK, fill=(140, 190, 20, 255), stroke=2, stroke_fill=(50, 70, 0, 255)),
        (26, 106, 202, 144), anchor='r')
    unit = dict(path=F_BOLD, fill=(110, 82, 52, 255))
    put(s, fit_text('giờ', (34, 24), 20, **unit), (256, 106, 292, 142), anchor='l')
    put(s, fit_text('phút', (40, 24), 20, **unit), (334, 106, 376, 142), anchor='l')
    put(s, fit_text('giây', (36, 24), 20, **unit), (412, 106, 452, 142), anchor='l')
    A.paste(12, s)

    # --- EMPTY slot
    s = A.crop(0)
    m = make_mask(s, (140, 50, 320, 110), lambda r, g, b, a: lum(r, g, b) < 150, grow=2)
    inpaint_mask(s, m)
    put(s, fit_text('TRỐNG', (170, 40), 40, path=F_BOLD, fill=(88, 60, 32, 255)), (140, 50, 320, 110))
    A.paste(0, s)

    # --- round difficulty icons: white text + black outline on dark glossy circle
    def circle_icon(i, label, fillc, strokec, grey_pred=None):
        s = A.crop(i)
        if grey_pred is None:
            pred = lambda r, g, b, a: lum(r, g, b) > 175 or lum(r, g, b) < 30
        else:
            pred = grey_pred
        m = make_mask(s, (8, 38, 104, 78), pred, grow=1)
        # only inside inner circle
        inner = Image.new('L', s.size, 0)
        ImageDraw.Draw(inner).ellipse([8, 8, 103, 103], fill=255)
        m = ImageChops.multiply(m, inner)
        inpaint_mask(s, m, mode='col')
        put(s, fit_text(label, (82, 30), 24, path=F_BLACK, fill=fillc, stroke=2, stroke_fill=strokec),
            (13, 36, 99, 78), dy=0)
        A.paste(i, s)

    W = (255, 255, 255, 255)
    for i, lab in ((6, 'KHÓ'), (5, 'THƯỜNG'), (4, 'DỄ')):
        circle_icon(i, lab, W, OUTLINE_BLACK)
    circle_icon(9, 'THƯỜNG', W, OUTLINE_BLACK)
    circle_icon(10, 'KHÓ', W, OUTLINE_BLACK)
    circle_icon(8, 'DỄ', W, OUTLINE_BLACK)
    circle_icon(11, 'CỰC KHÓ', (235, 30, 30, 255), (0, 0, 0, 255),
                grey_pred=lambda r, g, b, a: (r > 120 and g < 90))
    circle_icon(7, 'CỰC KHÓ', (150, 150, 150, 255), (0, 0, 0, 255),
                grey_pred=lambda r, g, b, a: lum(r, g, b) > 95)

    # --- START / DELETE buttons (white text, dark outline)
    def btn(i, label, size, fillc, strokec, box, pred, grow=4):
        s = A.crop(i)
        m = make_mask(s, box, pred, grow=grow)
        inpaint_mask(s, m)
        put(s, fit_text(label, (box[2] - box[0] - 4, box[3] - box[1] - 10), size, path=F_BLACK, fill=fillc,
                        stroke=3, stroke_fill=strokec), box)
        A.paste(i, s)

    for i in (13, 2):
        btn(i, 'BẮT ĐẦU', 34, (255, 255, 255, 255), (20, 80, 90, 255), (26, 18, 164, 82),
            lambda r, g, b, a: lum(r, g, b) > 215, grow=5)
    for i in (14, 15):
        btn(i, 'XÓA', 36, (240, 240, 240, 255), (70, 20, 20, 255), (26, 8, 152, 62),
            lambda r, g, b, a: lum(r, g, b) > 185, grow=5)

    # --- YES / NO
    def yn(i, label):
        s = A.crop(i)
        box = (16, 12, 130, 52)
        m = make_mask(s, box, lambda r, g, b, a: lum(r, g, b) < 110 or (r > 240 and g > 215 and b < 120), grow=2)
        inpaint_mask(s, m)
        put(s, fit_text(label, (100, 36), 30, path=F_BLACK, fill=(70, 40, 12, 255), stroke=2, stroke_fill=(255, 238, 0, 255)),
            box)
        A.paste(i, s)

    for i in (20, 21):
        yn(i, 'CÓ')
    for i in (22, 23):
        yn(i, 'KHÔNG')

    # --- difficulty strip labels (shown on slot panel)
    def strip(i, label):
        s = A.crop(i)
        clear(s, (0, 0, s.width, s.height))
        put(s, fit_text(label, (s.width - 2, s.height - 2), 22, path=F_BLACK, fill=(255, 70, 0, 255), stroke=2,
                        stroke_fill=(0, 0, 0, 255)), (0, 0, s.width, s.height))
        A.paste(i, s)

    strip(16, 'DỄ'); strip(17, 'THƯỜNG'); strip(18, 'KHÓ'); strip(19, 'CỰC KHÓ')

    # --- header banner "SELECT SLOT" (sub 1 : big frame with green title bar)
    s = A.crop(1)
    pred = lambda r, g, b, a: lum(r, g, b) > 200 or lum(r, g, b) < 35
    m = make_mask(s, (130, 10, 410, 62), pred, grow=1)
    inpaint_mask(s, m)
    put(s, fit_text('CHỌN Ô LƯU', (280, 44), 44, path=F_BLACK, fill=(255, 255, 255, 255), stroke=3,
                    stroke_fill=(30, 30, 10, 255), shadow=(2, 3, (30, 40, 0, 255))), (110, 8, 430, 62))
    A.paste(1, s)
    A.save()


# ============================================================ fDat122 stage select
def patch_122():
    A = Atlas(122)
    white = lambda r, g, b, a: min(r, g, b) > 200 or max(r, g, b) < 60

    # header "Stage Select" on the frame (sub 24 = full 760x570 frame)
    s = A.crop(24)
    box = (60, 9, 380, 67)
    hm = make_mask(s, box, lambda r, g, b, a: min(r, g, b) > 235 or max(r, g, b) < 80, grow=4)
    inpaint_mask(s, hm, mode='row')
    put(s, fit_text('CHỌN MÀN', (290, 50), 46, path=F_BLACK, fill=(255, 255, 255, 255), stroke=3,
                    stroke_fill=(55, 40, 30, 255)), (60, 8, 372, 68))
    A.paste(24, s)

    # world banners
    banners = {
        27: ('RỪNG TÂM TRÍ', (1, 57, 8, 255)),
        28: ('RỪNG\nTỬ THẦN', (45, 0, 75, 255)),
        29: ('THUNG LŨNG\nBĂNG GIÁ', (0, 70, 80, 255)),
        30: ('HANG TỐI', (40, 40, 40, 255)),
        31: ('CUNG ĐIỆN\nLÃNG QUÊN', (60, 8, 4, 255)),
    }
    for i, (label, oc) in banners.items():
        s = A.crop(i)
        two = '\n' in label
        box = (14, 36, 176, 78) if not two else (26, 34, 164, 82)
        erase_dilate(s, box, lambda r, g, b: min(r, g, b) > 235, grow=4, bg=s.getpixel((box[0] + 2, 55)))
        lay = fit_text(label, (box[2] - box[0] - 8, box[3] - box[1] - 2), 28 if not two else 22, path=F_BLACK,
                       fill=(255, 255, 255, 255), stroke=2, stroke_fill=oc, line_gap=0)
        put(s, lay, box)
        A.paste(i, s)

    # LOCK tile: clean solid bevel on the right without vertical text
    s = A.crop(14)
    erase_dilate(s, (72, 4, 97, 72), lambda r, g, b: lum(r, g, b) > 120, grow=2, bg=s.getpixel((72, 40)))
    A.paste(14, s)

    # UPGRADE buttons
    for i in (22, 23):
        s = A.crop(i)
        box = (38, 9, 228, 60)
        m = make_mask(s, box, lambda r, g, b, a: (r > 200 and 60 < g < 210 and b < 90) or max(r, g, b) < 45, grow=2)
        inpaint_mask(s, m)
        put(s, fit_text('NÂNG CẤP', (186, 40), 36, path=F_BLACK, fill=(255, 150, 0, 255), stroke=3,
                        stroke_fill=(10, 5, 0, 255)), box)
        A.paste(i, s)
    A.save()


# ---------------------------------------------------------------- generic helpers
nonyellow = lambda r, g, b, a: not (r > 225 and g > 165 and b < 120)
nonwhite = lambda r, g, b, a: min(r, g, b) < 238
oncyan = lambda r, g, b, a: r > 185 or max(r, g, b) < 95
ykey = lambda r, g, b, a: (r > 215 and g > 200 and b < 110) or max(r, g, b) < 75

YEL = (255, 236, 0, 255)
ORG = (255, 134, 20, 255)
WHT = (255, 255, 255, 255)
BLK = (0, 0, 0, 255)


def retext(s, box, label, pred, mode='col', grow=2, size=30, tbox=None, anchor='c', dx=0, dy=0,
           path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK, erase=True, line_gap=0, **kw):
    """Erase text inside `box` (mask by pred, inpainted) and draw `label` fitted in tbox/box."""
    if erase:
        m = make_mask(s, box, pred, grow=grow)
        inpaint_mask(s, m, mode=mode)
    tb = tbox or box
    lay = fit_text(label, (tb[2] - tb[0], tb[3] - tb[1]), size, path=path, fill=fill, stroke=stroke,
                   stroke_fill=stroke_fill, line_gap=line_gap, **kw)
    put(s, lay, tb, anchor=anchor, dx=dx, dy=dy)


def blue_banner_text(label, size, maxw):
    """Chunky white text with blue + white + navy outlines (battle start banner)."""
    S = 3
    for sz in range(size, 10, -1):
        ft = ImageFont.truetype(F_BLACK, sz * S)
        bb = ft.getbbox(label, stroke_width=7 * S)
        if (bb[2] - bb[0]) // S <= maxw:
            break
    pad = 10 * S
    lay = Image.new('RGBA', (bb[2] - bb[0] + 2 * pad, bb[3] - bb[1] + 2 * pad), (0, 0, 0, 0))
    d = ImageDraw.Draw(lay)
    o = (pad - bb[0], pad - bb[1])
    d.text(o, label, font=ft, fill=(8, 40, 80, 255), stroke_width=7 * S, stroke_fill=(8, 40, 80, 255))
    d.text(o, label, font=ft, fill=(255, 255, 255, 255), stroke_width=6 * S, stroke_fill=(255, 255, 255, 255))
    d.text(o, label, font=ft, fill=(0, 112, 190, 255), stroke_width=3 * S, stroke_fill=(0, 112, 190, 255))
    d.text(o, label, font=ft, fill=(255, 255, 255, 255))
    lay = lay.crop(lay.getbbox())
    return lay.resize((max(1, lay.width // S), max(1, lay.height // S)), Image.LANCZOS)


KEYBOARD = 'Bàn phím'

import numpy as np
from collections import deque
from scipy.ndimage import binary_fill_holes


def redraw_board_sign(s, box=(270, 0, 500, 95), label='CỬA HÀNG', text_fill=(255, 235, 30, 255), stroke_fill=(30, 15, 5, 255)):
    """Cleanly replaces the interior of the cartoon wooden board within `box` without modifying borders."""
    x0, y0, x1, y1 = box
    crop = s.crop(box)
    w, h = crop.size
    arr = np.array(crop)
    border = (arr[:, :, 0] < 45) & (arr[:, :, 1] < 45) & (arr[:, :, 2] < 45)

    # Flood fill interior starting from known wood pixel (30, 45)
    visited = np.zeros((h, w), dtype=bool)
    q = deque([(45, 30)])
    visited[45, 30] = True
    while q:
        y, x = q.popleft()
        for dy, dx in ((-1,0), (1,0), (0,-1), (0,1)):
            ny, nx = y + dy, x + dx
            if 0 <= ny < h and 0 <= nx < w:
                if not visited[ny, nx] and not border[ny, nx]:
                    visited[ny, nx] = True
                    q.append((ny, nx))
    mask = Image.fromarray((binary_fill_holes(visited) * 255).astype(np.uint8))

    # Smooth cartoon wood vertical gradient
    wood = Image.new('RGBA', (w, h), (0, 0, 0, 0))
    wd = ImageDraw.Draw(wood)
    for y in range(h):
        t = y / h
        if t < 0.45:
            u = t / 0.45
            r = int(218 * (1-u) + 228 * u)
            g = int(125 * (1-u) + 142 * u)
            b = int(62 * (1-u) + 75 * u)
        else:
            u = (t - 0.45) / 0.55
            r = int(228 * (1-u) + 175 * u)
            g = int(142 * (1-u) + 95 * u)
            b = int(75 * (1-u) + 42 * u)
        wd.line([(0, y), (w, y)], fill=(r, g, b, 255))

    res = crop.copy()
    res.paste(wood, (0, 0), mask)
    lay = fit_text(label, (w - 30, h - 25), 32, path=F_BLACK, fill=text_fill, stroke=3, stroke_fill=stroke_fill, shadow=(1, 2, (15, 8, 2, 200)))
    put(res, lay, (15, 10, w - 15, h - 10))
    s.paste(res, (x0, y0))


def redraw_unit_leaves(s, box=(320, 0, 520, 95)):
    """Inpaints dark letters U N I T off the cartoon leaves and places QUÂN LÍNH cleanly."""
    x0, y0, x1, y1 = box
    m = make_mask(s, (320, 10, 520, 85), lambda r, g, b, a: (r < 50 and g < 75 and b < 40), grow=2)
    inpaint_mask(s, m, mode='col')
    lay = fit_text('QUÂN LÍNH', (190, 48), 30, path=F_BLACK, fill=(255, 255, 50, 255), stroke=3, stroke_fill=(15, 45, 10, 255), shadow=(1, 2, (5, 20, 5, 200)))
    put(s, lay, (325, 20, 515, 75))



# ============================================================ fDat129 tutorial0 (battle basics)
def patch_129():
    A = Atlas(129)

    # sub 4: HUD explanation bubbles
    s = A.crop(4)
    lab = dict(fill=YEL, stroke=2)
    retext(s, (111, 103, 191, 133), 'Cấp độ', nonwhite, mode='row', size=22, tbox=(113, 104, 189, 132), **lab)
    retext(s, (36, 152, 189, 181), 'Kinh nghiệm', nonwhite, mode='row', size=24, tbox=(40, 154, 186, 180), **lab)
    retext(s, (524, 49, 619, 86), 'Vàng', nonwhite, mode='row', size=30, tbox=(528, 52, 616, 84), **lab)
    retext(s, (647, 78, 740, 107), 'Tạm dừng', nonwhite, mode='row', size=26, tbox=(650, 80, 738, 106),
           fill=ORG, stroke=2)
    retext(s, (242, 162, 367, 207), 'Máu', nonwhite, mode='row', size=32, tbox=(246, 166, 364, 205), **lab)
    retext(s, (389, 162, 515, 207), 'Máu căn cứ /\nMáu Boss', nonwhite, mode='row', size=18,
           tbox=(392, 166, 512, 205), **lab)
    A.paste(4, s)

    # sub 2: Food bubble + Keyboard label
    s = A.crop(2)
    mm = Image.new('L', s.size, 0)
    for b in ((102, 8, 231, 47), (99, 47, 231, 66), (85, 66, 231, 87)):
        mm = ImageChops.lighter(mm, make_mask(s, b, nonyellow, grow=2))
    inpaint_mask(s, mm, mode='col')
    put(s, fit_text('Lương thực', (126, 38), 34, path=F_BLACK, fill=ORG, stroke=2, stroke_fill=BLK), (104, 10, 230, 48))
    lay = fit_text('Dùng để\ntriệu hồi lính', (128, 38), 22, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK,
                   line_gap=0)
    put(s, lay, (100, 48, 230, 86))
    retext(s, (606, 86, 714, 114), KEYBOARD, ykey, mode='row', size=22, tbox=(608, 88, 712, 113),
           fill=YEL, stroke=2)
    A.paste(2, s)

    # sub 3: Mana bubble + keyboard label
    s = A.crop(3)
    retext(s, (397, 10, 532, 88), 'Năng lượng', oncyan, mode='col', size=30, tbox=(400, 10, 530, 44),
           fill=YEL, stroke=2)
    lay = fit_text('Dùng để\nthi triển phép', (128, 38), 22, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK,
                   line_gap=0)
    put(s, lay, (400, 46, 530, 86))
    retext(s, (100, 207, 208, 239), KEYBOARD, ykey, mode='row', size=22, tbox=(102, 210, 206, 238),
           fill=YEL, stroke=2)
    A.paste(3, s)

    # sub 1: Keyboard label + "To Move"
    s = A.crop(1)
    retext(s, (24, 74, 132, 100), KEYBOARD, ykey, mode='row', size=22, tbox=(26, 76, 130, 100), fill=YEL, stroke=2)
    retext(s, (326, 12, 470, 62), 'Di chuyển', nonyellow, mode='col', size=32, tbox=(330, 14, 468, 60))
    A.paste(1, s)

    # sub 5: TIP bubble
    s = A.crop(5)
    m = make_mask(s, (284, 8, 486, 122), nonyellow, grow=2)
    inpaint_mask(s, m, mode='col')
    put(s, fit_text('MẸO', (80, 28), 28, path=F_BLACK, fill=ORG, stroke=2, stroke_fill=BLK), (288, 14, 400, 46),
        anchor='l')
    lay = fit_text('Mỗi lính có thể dùng\nkỹ năng đặc biệt\ntrong phạm vi hào quang', (190, 70), 20, path=F_BLACK,
                   fill=WHT, stroke=2, stroke_fill=BLK, line_gap=0)
    put(s, lay, (288, 50, 484, 118))
    A.paste(5, s)

    # sub 6: battle start banner (text on transparent)
    s = A.crop(6)
    clear(s, (0, 0, s.width, s.height))
    l1 = blue_banner_text('TRẬN CHIẾN BẮT ĐẦU!', 26, 470)
    l2 = blue_banner_text('CHÚC BẠN MAY MẮN!', 26, 440)
    s.alpha_composite(l1, ((s.width - l1.width) // 2, 0))
    s.alpha_composite(l2, ((s.width - l2.width) // 2, 40))
    A.paste(6, s)

    # sub 7 / 8: "NEXT >" -> "TIẾP >"
    for i, col in ((7, (35, 170, 10, 255)), (8, (90, 255, 0, 255))):
        s = A.crop(i)
        gp = lambda r, g, b, a: (g > 140 and r < 140 and b < 100) or max(r, g, b) < 40
        m = make_mask(s, (0, 44, 96, 84), gp, grow=1)
        px = s.load(); mp = m.load()
        for y in range(s.height):
            for x in range(s.width):
                if mp[x, y]:
                    px[x, y] = (0, 0, 0, 0)
        lay = fit_text('TIẾP', (92, 34), 34, path=F_BLACK, fill=col, stroke=3, stroke_fill=BLK)
        put(s, lay, (2, 44, 96, 82))
        A.paste(i, s)
    A.save()

# ============================================================ fDat130 tutorial 1 (Destiny & Escort)
def patch_130():
    A = Atlas(130)

    # sub 0: Destiny mode title + subtitle + nomnom bubble
    s = A.crop(0)
    clear(s, (0, 0, 430, 110))
    put(s, fit_text('Chế độ Định Mệnh', (320, 36), 30, path=F_BLACK, fill=YEL, stroke=3, stroke_fill=BLK),
        (10, 8, 330, 44), anchor='l')
    put(s, fit_text('Tiêu diệt quân địch bằng\nbinh lính và phép thuật.', (350, 50), 18, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK, line_gap=2),
        (12, 46, 362, 98), anchor='l')
    box_nom = (65, 322, 400, 407)
    mb = make_mask(s, box_nom, lambda r, g, b, a: not (r > 220 and g > 180 and b < 50), grow=2)
    inpaint_mask(s, mb, mode='row')
    lay = fit_text('Lính và phép có thể\ndùng ngay khi chui\nra khỏi miệng quái!', (320, 75), 18, path=F_BLACK, fill=(20, 20, 20, 255), stroke=0, line_gap=2)
    put(s, lay, (65, 323, 400, 405))
    A.paste(0, s)

    # sub 1: Keyboard label
    s = A.crop(1)
    retext(s, (595, 30, 715, 65), KEYBOARD, ykey, mode='row', size=20, fill=YEL, stroke=2)
    A.paste(1, s)

    # sub 3: Waves speech bubbles
    s = A.crop(3)
    b1 = (6, 50, 336, 139)
    m1 = make_mask(s, b1, lambda r, g, b, a: min(r, g, b) > 220 or max(r, g, b) < 60, grow=2)
    inpaint_mask(s, m1, mode='row')
    lay1 = fit_text('Chống đỡ các đợt quái cho đến khi\ntam giác vàng chạm tới cờ đỏ.', (315, 65), 17, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK, line_gap=2)
    put(s, lay1, b1)

    b2 = (82, 151, 412, 268)
    m2 = make_mask(s, b2, lambda r, g, b, a: min(r, g, b) > 220 or max(r, g, b) < 60, grow=2)
    inpaint_mask(s, m2, mode='row')
    lay2 = fit_text('Chú ý biểu tượng đầu lâu!\nKhi tam giác vàng vượt qua, lượng lớn\nquân địch sẽ ồ ạt tấn công!', (315, 80), 16, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK, line_gap=2)
    put(s, lay2, b2)
    A.paste(3, s)

    # sub 4: Destroy enemy units
    s = A.crop(4)
    clear(s, (0, 0, s.width, s.height))
    put(s, fit_text('Tiêu diệt quân địch bằng\nbinh lính và phép thuật.', (s.width - 8, s.height - 4), 20, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK, line_gap=2),
        (0, 0, s.width, s.height))
    A.paste(4, s)

    # sub 5: Escort the carriage
    s = A.crop(5)
    clear(s, (0, 10, 200, 110))
    put(s, fit_text('Hộ tống\ncỗ xe', (180, 70), 26, path=F_BLACK, fill=YEL, stroke=3, stroke_fill=BLK, line_gap=2),
        (6, 15, 186, 95), anchor='l')

    bb = (340, 75, 545, 165)
    mb = make_mask(s, bb, lambda r, g, b, a: min(r, g, b) > 220 or max(r, g, b) < 60, grow=2)
    inpaint_mask(s, mb, mode='row')
    lay_b = fit_text('Đưa cỗ xe vận chuyển\nan toàn đến đích.', (195, 75), 18, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK, line_gap=2)
    put(s, lay_b, bb)

    by = (245, 305, 485, 385)
    my = make_mask(s, by, lambda r, g, b, a: not (r > 220 and g > 180 and b < 50), grow=2)
    inpaint_mask(s, my, mode='row')
    lay_y = fit_text('Bảo vệ cỗ xe\nbằng mọi giá!', (230, 65), 22, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK, line_gap=2)
    put(s, lay_y, by)
    A.paste(5, s)
    A.save()


# ============================================================ fDat131 tutorial 2 (Battlefield)
def patch_131():
    A = Atlas(131)

    # sub 1: Battlefield mode
    s = A.crop(1)
    clear(s, (0, 0, 390, 110))
    put(s, fit_text('Chế độ Chiến Trường', (320, 36), 30, path=F_BLACK, fill=YEL, stroke=3, stroke_fill=BLK),
        (10, 8, 330, 44), anchor='l')
    put(s, fit_text('Bạn phải tiến lên phía trước\ntrên chiến trường.', (360, 50), 18, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK, line_gap=2),
        (12, 46, 372, 98), anchor='l')

    # Erase old 'To advance' and restore crisp bubble border & cyan fill
    d = ImageDraw.Draw(s)
    # 1. Clear above bubble
    d.rectangle([10, 240, 275, 267], fill=(0, 0, 0, 0))
    # 2. Bubble top black line & inner highlight
    d.rectangle([18, 268, 275, 271], fill=BLK)
    d.line([(18, 272), (275, 272)], fill=(104, 201, 205, 255), width=1)
    d.line([(18, 273), (275, 273)], fill=(115, 248, 255, 255), width=1)
    d.line([(18, 274), (275, 274)], fill=(81, 253, 255, 255), width=1)

    # 3. Line 1: erase '1. select unit' and bottom of 'To advance'
    CYAN_TOP = (66, 222, 255, 255)
    d.rectangle([18, 275, 160, 332], fill=CYAN_TOP)
    d.rectangle([160, 275, 240, 288], fill=CYAN_TOP)
    # 4. Line 2: fill cleanly all the way across x=18..334
    d.rectangle([18, 333, 334, 341], fill=CYAN_TOP)
    d.line([(18, 342), (334, 342)], fill=(57, 213, 253, 255), width=1)
    d.line([(18, 343), (334, 343)], fill=(64, 198, 237, 255), width=1)
    d.line([(18, 344), (334, 344)], fill=(51, 186, 246, 255), width=1)
    d.rectangle([18, 345, 334, 365], fill=(41, 189, 255, 255))

    # Draw Vietnamese text
    lay_adv = fit_text('Để tiến lên:', (165, 26), 22, path=F_BLACK, fill=(255, 235, 0, 255), stroke=3, stroke_fill=BLK)
    put(s, lay_adv, (25, 244, 190, 272), anchor='l')
    lay1 = fit_text('1. Chọn lính', (130, 22), 18, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=(10, 30, 50, 255))
    put(s, lay1, (25, 304, 158, 328), anchor='l')
    lay2 = fit_text('2. Chọn làn', (130, 22), 18, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=(10, 30, 50, 255))
    put(s, lay2, (25, 334, 158, 358), anchor='l')
    A.paste(1, s)

    # sub 2: Keyboard label
    s = A.crop(2)
    retext(s, (25, 30, 165, 68), KEYBOARD, ykey, mode='row', size=20, fill=YEL, stroke=2)
    A.paste(2, s)

    # sub 3 & sub 4: Tactics
    PURPLE_LIGHT = (104, 67, 183, 255)
    PURPLE_DARK = (86, 56, 151, 255)
    for idx in (3, 4):
        s = A.crop(idx)
        draw = ImageDraw.Draw(s)
        dx = 0 if idx == 3 else 24

        # 1. Clean Title: erase from y=8 to 56
        draw.rectangle([10 + dx, 8, 516 + dx, 56], fill=PURPLE_LIGHT)
        lay_t = fit_text('Chỉ huy quân bằng 3 chiến thuật:', (470, 30), 22, path=F_BLACK, fill=YEL, stroke=2, stroke_fill=BLK)
        put(s, lay_t, (25 + dx, 16, 505 + dx, 52), anchor='l')

        # 2. Clean Row 1: y=57..110
        draw.rectangle([89 + dx, 57, 516 + dx, 110], fill=PURPLE_LIGHT)
        lay1 = fit_text('Xếp lính theo hàng dọc', (400, 28), 22, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK)
        put(s, lay1, (96 + dx, 65, 505 + dx, 105), anchor='l')

        # 3. Clean Rows 2 & 3: y=111..215
        draw.rectangle([89 + dx, 111, 516 + dx, 215], fill=PURPLE_DARK)
        lay2 = fit_text('Xếp lính theo hàng ngang', (400, 28), 22, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK)
        put(s, lay2, (96 + dx, 120, 505 + dx, 160), anchor='l')
        lay3 = fit_text('Hồi phục toàn bộ máu', (400, 28), 22, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK)
        put(s, lay3, (96 + dx, 175, 505 + dx, 215), anchor='l')

        if idx == 4:
            clear(s, (0, 355, 210, 395))
            put(s, fit_text('DÙNG PHÉP', (180, 30), 22, path=F_BLACK, fill=YEL, stroke=2, stroke_fill=BLK), (10, 362, 190, 392), anchor='l')
        A.paste(idx, s)


    # sub 5: Frontline gauges
    s = A.crop(5)
    my = make_mask(s, (15, 55, 525, 275), nonyellow, grow=2)
    inpaint_mask(s, my, mode='col')
    lay_desc = fit_text('Đẩy lùi phòng tuyến địch sang phải để tăng thanh xanh,\nthanh đỏ sẽ tăng khi phòng thủ của bạn bị yếu đi.', (490, 50), 16, path=F_BLACK, fill=(20, 20, 20, 255), stroke=0, line_gap=2)
    put(s, lay_desc, (20, 65, 510, 120))
    lay_v = fit_text('Thanh xanh đầy: Chiến thắng', (380, 30), 22, path=F_BLACK, fill=(0, 160, 240, 255), stroke=2, stroke_fill=BLK)
    put(s, lay_v, (20, 160, 510, 195))
    lay_d = fit_text('Thanh đỏ đầy: Thất bại', (380, 30), 22, path=F_BLACK, fill=(240, 40, 20, 255), stroke=2, stroke_fill=BLK)
    put(s, lay_d, (20, 225, 510, 260))
    A.paste(5, s)
    A.save()


def clean_inven_bar(s, y_offset=0, dimmed=False):
    px = s.load()
    if dimmed:
        pouch_asset = Image.open('extracted/pouch_icon_dimmed.png')
        for y in range(416, 481):
            c = (41, 8, 9, 255) if y < 424 else (49, 8, 8, 255)
            for x in range(140, 280):
                px[x, y] = c
        s.paste(pouch_asset, (150, 423), pouch_asset)
        lay = fit_text('TÚI ĐỒ', (82, 34), 22, path=F_BLACK, fill=(130, 110, 18, 255), stroke=3, stroke_fill=(0, 0, 0, 255))
        put(s, lay, (198, 435, 280, 475))
    else:
        pouch_asset = Image.open('extracted/pouch_icon_clean.png')
        for y in range(24, 84):
            c = (99, 18, 22, 255) if y < 27 else (124, 23, 27, 255)
            for x in range(140, 280):
                px[x, y] = c
        s.paste(pouch_asset, (150, 26), pouch_asset)
        lay = fit_text('TÚI ĐỒ', (82, 34), 22, path=F_BLACK, fill=(255, 225, 20, 255), stroke=3, stroke_fill=(0, 0, 0, 255))
        put(s, lay, (198, 38, 280, 78))


# ============================================================ fDat132 tutorial 3 (Shop & Upgrades)
def patch_132():
    A = Atlas(132)

    def yellow_bubble(s, box, text, size=18, stroke=2):
        m = make_mask(s, box, nonyellow, grow=2)
        inpaint_mask(s, m, mode='col')
        pad = 6
        tb = (box[0] + pad, box[1] + pad, box[2] - pad, box[3] - pad)
        lay = fit_text(text, (tb[2] - tb[0], tb[3] - tb[1]), size, path=F_BLACK, fill=WHT, stroke=stroke, stroke_fill=BLK, line_gap=2)
        put(s, lay, tb)

    # sub 0: Unit info / upgrade
    s = A.crop(0)
    # top sign: UNIT -> QUÂN LÍNH
    redraw_unit_leaves(s, (320, 0, 520, 95))
    # top right button: SHOP > -> CỬA HÀNG >
    retext(s, (610, 8, 750, 52), 'CỬA HÀNG >', lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 40, mode='row', size=16, fill=(255, 230, 20, 255), stroke=3, stroke_fill=BLK)

    # Status card on tutorial screen (rows 2, 3, 4)
    d0 = ImageDraw.Draw(s)
    CARD_BG_DIM = (33, 24, 15, 255)
    rows_y_dim = [(155, 180), (198, 223), (241, 266)]
    for y1, y2 in rows_y_dim:
        d0.rectangle([547, y1, 645, y2], fill=CARD_BG_DIM)
    labels_dim = ['TẤN CÔNG', 'TỐC ĐỘ', 'HỒI CHIÊU']
    for text, (y1, y2) in zip(labels_dim, rows_y_dim):
        lay = fit_text(text, (95, 22), 17, path=F_BLACK, fill=(110, 110, 110, 255), stroke=2, stroke_fill=BLK)
        put(s, lay, (550, y1, 645, y2), anchor='l')

    yellow_bubble(s, (13, 208, 220, 286), 'XEM\nTHÔNG TIN', 20)
    yellow_bubble(s, (24, 399, 231, 477), 'VÀNG\nHIỆN CÓ', 20)
    yellow_bubble(s, (549, 63, 716, 141), 'VÀO\nCỬA HÀNG', 20)
    yellow_bubble(s, (313, 344, 510, 432), 'NÂNG CẤP\nLÍNH CHỌN', 20)
    yellow_bubble(s, (538, 344, 725, 432), 'VÀNG CẦN\nĐỂ NÂNG CẤP', 18)
    # UPGRADE button
    btn_box = (315, 279, 505, 328)
    mb = make_mask(s, btn_box, lambda r, g, b, a: lum(r, g, b) > 180, grow=2)
    inpaint_mask(s, mb, mode='row')
    put(s, fit_text('NÂNG CẤP', (170, 36), 28, path=F_BLACK, fill=WHT, stroke=3, stroke_fill=(60, 40, 0, 255)), btn_box)
    A.paste(0, s)

    # sub 1: Shop
    s = A.crop(1)
    # top left button: < UNIT -> < QUÂN LÍNH
    retext(s, (15, 8, 150, 52), '< QUÂN LÍNH', lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 40, mode='row', size=14, fill=(255, 230, 20, 255), stroke=3, stroke_fill=BLK)
    # top center sign: SHOP -> CỬA HÀNG
    redraw_board_sign(s, (270, 0, 500, 95), 'CỬA HÀNG')
    # top right button: HERO > -> ANH HÙNG >
    retext(s, (610, 8, 750, 52), 'ANH HÙNG >', lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 40, mode='row', size=14, fill=(255, 230, 20, 255), stroke=3, stroke_fill=BLK)
    # bottom inventory bar: INVEN -> TÚI ĐỒ (clean pouch preservation)
    clean_inven_bar(s, y_offset=397, dimmed=True)

    yellow_bubble(s, (35, 62, 242, 140), 'NÂNG CẤP\nLÍNH', 20)
    yellow_bubble(s, (494, 62, 721, 150), 'TRANG BỊ\nANH HÙNG', 20)
    yellow_bubble(s, (467, 341, 674, 419), 'VÀNG\nHIỆN CÓ', 20)
    yellow_bubble(s, (63, 477, 220, 555), 'SẮP XẾP', 22)
    A.paste(1, s)

    # sub 2: Hero
    s = A.crop(2)
    # top left button: < SHOP -> < CỬA HÀNG
    retext(s, (15, 8, 150, 52), '< CỬA HÀNG', lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 40, mode='row', size=16, fill=(255, 230, 20, 255), stroke=3, stroke_fill=BLK)
    # top wooden board: HERO -> ANH HÙNG
    redraw_board_sign(s, (270, 0, 500, 95), 'ANH HÙNG')
    # top right button: MAP > -> BẢN ĐỒ >
    retext(s, (605, 8, 750, 52), 'BẢN ĐỒ >', lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 40, mode='row', size=20, fill=(255, 255, 0, 255), stroke=3, stroke_fill=(30, 45, 0, 255))

    yellow_bubble(s, (35, 63, 202, 141), 'VÀO\nCỬA HÀNG', 20)
    yellow_bubble(s, (514, 62, 721, 140), 'CHỌN MÀN', 22)
    box_hero = (110, 320, 400, 375)
    m = make_mask(s, box_hero, lambda r, g, b, a: min(r, g, b) > 160 or max(r, g, b) < 40, grow=2)
    inpaint_mask(s, m, mode='row')
    lay_hero = fit_text('TRANG BỊ ANH HÙNG', (270, 40), 28, path=F_BLACK, fill=WHT, stroke=3, stroke_fill=BLK)
    put(s, lay_hero, box_hero)
    A.paste(2, s)

    # sub 3 & 4: NEXT > -> TIẾP >
    for i, col in ((3, (35, 170, 10, 255)), (4, (90, 255, 0, 255))):
        s = A.crop(i)
        gp = lambda r, g, b, a: (g > 100 and r < 160 and b < 120) or max(r, g, b) < 40
        m = make_mask(s, (0, 5, 118, 38), gp, grow=1)
        px = s.load(); mp = m.load()
        for y in range(s.height):
            for x in range(s.width):
                if mp[x, y]:
                    px[x, y] = (0, 0, 0, 0)
        lay = fit_text('TIẾP', (90, 30), 30, path=F_BLACK, fill=col, stroke=3, stroke_fill=BLK)
        put(s, lay, (2, 6, 94, 36))
        A.paste(i, s)
    A.save()


# ============================================================ fDat123 store / unit / hero
def patch_123():
    A = Atlas(123)

    # --- BUY buttons: sub 0 & 1 -> MUA (132, 58)
    for i in (0, 1):
        s = A.crop(i)
        d = ImageDraw.Draw(s)
        d.rounded_rectangle([10, 6, 122, 52], radius=14, fill=(255, 200, 0, 255))
        put(s, fit_text('MUA', (100, 38), 24, path=F_BLACK, fill=WHT, stroke=3, stroke_fill=(40, 20, 0, 255)), (10, 6, 122, 52))
        A.paste(i, s)

    # --- SELL buttons: sub 6 & 7 -> BÁN (132, 58)
    for i in (6, 7):
        s = A.crop(i)
        d = ImageDraw.Draw(s)
        d.rounded_rectangle([10, 6, 122, 52], radius=14, fill=(210, 30, 20, 255))
        put(s, fit_text('BÁN', (100, 38), 24, path=F_BLACK, fill=WHT, stroke=3, stroke_fill=(40, 5, 0, 255)), (10, 6, 122, 52))
        A.paste(i, s)

    # --- UNEQUIP buttons: sub 19 & 20 -> THÁO (150, 58)
    for i in (19, 20):
        s = A.crop(i)
        d = ImageDraw.Draw(s)
        d.rounded_rectangle([10, 6, 140, 52], radius=14, fill=(210, 30, 20, 255))
        put(s, fit_text('THÁO', (110, 38), 24, path=F_BLACK, fill=WHT, stroke=3, stroke_fill=(40, 5, 0, 255)), (10, 6, 140, 52))
        A.paste(i, s)

    # --- UPGRADE buttons: sub 23, 24, 25 -> NÂNG CẤP (204, 66)
    for i in (23, 24, 25):
        s = A.crop(i)
        d = ImageDraw.Draw(s)
        d.rounded_rectangle([10, 8, 194, 58], radius=16, fill=(110, 110, 110, 255))
        put(s, fit_text('NÂNG CẤP', (170, 40), 26, path=F_BLACK, fill=WHT, stroke=3, stroke_fill=(20, 20, 20, 255)), (10, 8, 194, 58))
        A.paste(i, s)

    # --- NEED MORE GOLD: sub 35 -> THIẾU VÀNG (132, 58)
    s = A.crop(35)
    d = ImageDraw.Draw(s)
    d.rounded_rectangle([10, 6, 122, 52], radius=14, fill=(130, 130, 130, 255))
    put(s, fit_text('THIẾU VÀNG', (110, 38), 18, path=F_BLACK, fill=(220, 220, 220, 255), stroke=3, stroke_fill=(40, 40, 40, 255)), (10, 6, 122, 52))
    A.paste(35, s)

    # --- Navigation buttons:
    # sub 8 & 9: SHOP > -> CỬA HÀNG > (148, 54 & 148, 52)
    for i in (8, 9):
        s = A.crop(i)
        retext(s, (12, 6, 138, s.height - 6), 'CỬA HÀNG >', lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 40, mode='row', size=16, fill=(255, 230, 20, 255), stroke=3, stroke_fill=BLK)
        A.paste(i, s)

    # sub 10 & 11: < SHOP -> < CỬA HÀNG (148, 54 & 148, 52)
    for i in (10, 11):
        s = A.crop(i)
        retext(s, (12, 6, 138, s.height - 6), '< CỬA HÀNG', lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 40, mode='row', size=16, fill=(255, 230, 20, 255), stroke=3, stroke_fill=BLK)
        A.paste(i, s)

    # sub 21 & 22: < UNIT -> < QUÂN LÍNH (148, 54 & 148, 52)
    for i in (21, 22):
        s = A.crop(i)
        retext(s, (10, 6, 138, s.height - 6), '< QUÂN LÍNH', lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 40, mode='row', size=14, fill=(255, 230, 20, 255), stroke=3, stroke_fill=BLK)
        A.paste(i, s)

    # sub 2 & 3: HERO > -> ANH HÙNG > (148, 54 & 148, 52)
    for i in (2, 3):
        s = A.crop(i)
        retext(s, (10, 6, 138, s.height - 6), 'ANH HÙNG >', lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 40, mode='row', size=14, fill=(255, 230, 20, 255), stroke=3, stroke_fill=BLK)
        A.paste(i, s)

    # sub 4 & 5: MAP > -> BẢN ĐỒ > (148, 52)
    # sub 5 (normal green):
    s = A.crop(5)
    retext(s, (16, 6, 134, 46), 'BẢN ĐỒ >', lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 40, mode='row', size=20, fill=(255, 255, 0, 255), stroke=3, stroke_fill=(30, 45, 0, 255))
    A.paste(5, s)

    # sub 4 (active cyan):
    s = A.crop(4)
    retext(s, (16, 6, 134, 46), 'BẢN ĐỒ >', lambda r, g, b, a: (g > 150 and b > 150 and r < 50) or max(r, g, b) < 40, mode='row', size=20, fill=(200, 255, 255, 255), stroke=3, stroke_fill=(0, 45, 45, 255))
    A.paste(4, s)

    # --- sub 30: LOCK -> KHÓA (66, 20)
    # MUST BE 100% SOLID OPAQUE (39, 30, 23, 255) to completely cover /20 underneath!
    s = Image.new('RGBA', (66, 20), (39, 30, 23, 255))
    put(s, fit_text('KHÓA', (58, 16), 14, path=F_BOLD, fill=WHT, stroke=2, stroke_fill=BLK), (0, 0, 66, 20))
    A.paste(30, s)

    # --- sub 31: INVEN bar (760, 178) -> TÚI ĐỒ (clean pouch preservation)
    s = A.crop(31)
    clean_inven_bar(s, y_offset=0, dimmed=False)
    A.paste(31, s)

    # --- sub 76: Unit screen background (760, 570) -> QUÂN LÍNH sign + STATUS CARD
    s = A.crop(76)
    redraw_unit_leaves(s, (320, 0, 520, 95))

    # Redraw Status Card: MÁU, TẤN CÔNG, TỐC ĐỘ, HỒI CHIÊU
    d76 = ImageDraw.Draw(s)
    CARD_BG = (94, 62, 42, 255)
    rows_y = [(112, 137), (155, 180), (198, 223), (241, 266)]
    for y1, y2 in rows_y:
        d76.rectangle([547, y1, 645, y2], fill=CARD_BG)
    labels = ['MÁU', 'TẤN CÔNG', 'TỐC ĐỘ', 'HỒI CHIÊU']
    for text, (y1, y2) in zip(labels, rows_y):
        lay = fit_text(text, (95, 22), 17, path=F_BLACK, fill=(255, 255, 255, 255), stroke=2, stroke_fill=BLK)
        put(s, lay, (550, y1, 645, y2), anchor='l')
    A.paste(76, s)

    # --- sub 48: Shop screen background (760, 384) -> CỬA HÀNG sign
    s = A.crop(48)
    redraw_board_sign(s, (270, 0, 500, 95), 'CỬA HÀNG')
    A.paste(48, s)

    # --- sub 26: Hero screen background (760, 408) -> ANH HÙNG sign
    s = A.crop(26)
    redraw_board_sign(s, (270, 0, 500, 95), 'ANH HÙNG')
    A.paste(26, s)

    # --- sub 64..72: Unit titles in Store
    unit_titles = [
        (64, 'CHUỘT ĐẤU SĨ'),
        (65, 'THỎ CUNG THỦ'),
        (66, 'GẤU HỘ VỆ'),
        (67, 'CHUỘT TÚI VÕ SĨ'),
        (68, 'RÙA PHÒNG THỦ'),
        (69, 'KHỈ CƯỚP BIỂN'),
        (70, 'TÊ GIÁC TINH NHUỆ'),
        (71, 'CÁNH CỤT PHÁP SƯ'),
        (72, 'RỒNG HỒNG'),
    ]
    for sub_idx, utext in unit_titles:
        s = A.crop(sub_idx)
        clear(s, (0, 0, s.width, s.height))
        put(s, fit_text(utext, (s.width - 4, s.height - 4), 18, path=F_BLACK, fill=(255, 235, 20, 255), stroke=3, stroke_fill=BLK), (0, 0, s.width, s.height))
        A.paste(sub_idx, s)

    A.save()


# ============================================================ fDat133 tutorial 4 (Controls & Mouse)
def patch_133():
    A = Atlas(133)

    # sub 0: MOVE, MACE
    s = A.crop(0)
    retext(s, (20, 45, 130, 78), 'DI CHUYỂN', ykey, mode='row', size=18, fill=YEL, stroke=2)
    retext(s, (360, 45, 490, 78), 'PHÉP THUẬT', ykey, mode='row', size=18, fill=YEL, stroke=2)
    A.paste(0, s)

    # sub 1: PAUSE, UNIT SELECT
    s = A.crop(1)
    retext(s, (580, 45, 720, 78), 'TẠM DỪNG', ykey, mode='row', size=18, fill=YEL, stroke=2)
    retext(s, (30, 280, 205, 315), 'CHỌN LÍNH', ykey, mode='row', size=18, fill=YEL, stroke=2)
    A.paste(1, s)

    # sub 2: Mouse notice
    s = A.crop(2)
    clear(s, (0, 150, s.width, s.height))
    put(s, fit_text('MỌI THAO TÁC CŨNG CÓ THỂ DÙNG CHUỘT.', (s.width - 20, 36), 22, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK),
        (0, 155, s.width, 195))
    A.paste(2, s)

    # sub 3: UNIT & MACE SELECT
    s = A.crop(3)
    retext(s, (15, 45, 310, 78), 'CHỌN LÍNH & PHÉP', ykey, mode='row', size=18, fill=YEL, stroke=2)
    A.paste(3, s)

    # sub 4: UNIT SELECT
    s = A.crop(4)
    retext(s, (20, 45, 210, 78), 'CHỌN LÍNH', ykey, mode='row', size=18, fill=YEL, stroke=2)
    A.paste(4, s)

    # sub 5: LINE SELECT
    s = A.crop(5)
    retext(s, (6, 45, 205, 76), 'CHỌN LÀN', ykey, mode='row', size=18, fill=YEL, stroke=2)
    A.paste(5, s)

    # sub 6: SKILL ACTIVATE
    s = A.crop(6)
    retext(s, (8, 45, 250, 76), 'DÙNG PHÉP', ykey, mode='row', size=18, fill=YEL, stroke=2)
    A.paste(6, s)
    A.save()


# ============================================================ fDat117 Pause screen
def patch_117():
    A = Atlas(117)

    # sub 0: Board with green banner PAUSE -> TẠM DỪNG
    s = A.crop(0)
    m = make_mask(s, (60, 15, 220, 60), lambda r, g, b, a: min(r, g, b) > 200 or (r < 40 and g < 50 and b < 10), grow=2)
    inpaint_mask(s, m, mode='row')
    put(s, fit_text('TẠM DỪNG', (150, 38), 32, path=F_BLACK, fill=WHT, stroke=3, stroke_fill=(50, 85, 10, 255)), (60, 16, 220, 58))
    A.paste(0, s)

    # sub 1 & 2: GIVE UP -> BỎ CUỘC
    for i in (1, 2):
        s = A.crop(i)
        retext(s, (15, 8, 189, 58), 'BỎ CUỘC', lambda r, g, b, a: lum(r, g, b) > 180, mode='row', size=28, fill=WHT, stroke=3, stroke_fill=(40, 0, 0, 255))
        A.paste(i, s)

    # sub 3 & 4: RESUME -> TIẾP TỤC
    for i in (3, 4):
        s = A.crop(i)
        retext(s, (15, 8, 189, 58), 'TIẾP TỤC', lambda r, g, b, a: lum(r, g, b) > 180, mode='row', size=28, fill=WHT, stroke=3, stroke_fill=(60, 40, 0, 255))
        A.paste(i, s)

    # sub 6: GET READY! -> CHUẨN BỊ!
    s = A.crop(6)
    clear(s, (0, 0, s.width, s.height))
    put(s, fit_text('CHUẨN BỊ!', (s.width - 20, s.height - 10), 38, path=F_BLACK, fill=(255, 175, 0, 255), stroke=4, stroke_fill=(0, 60, 140, 255)),
        (0, 0, s.width, s.height))
    A.paste(6, s)
    A.save()


# ============================================================ fDat96 Level Up screen
def patch_96():
    A = Atlas(96)

    # sub 0: Golden ribbon LEVEL UP -> LÊN CẤP
    s = A.crop(0)
    pred = lambda r, g, b, a: (min(r, g, b) > 170) or (r < 115 and g < 80 and b < 50)
    m = make_mask(s, (220, 22, 545, 98), pred, grow=3)
    inpaint_mask(s, m, mode='col')
    put(s, fit_text('LÊN CẤP', (260, 56), 48, path=F_BLACK, fill=WHT, stroke=3, stroke_fill=(80, 40, 10, 255), shadow=(2, 3, (60, 30, 5, 255))),
        (220, 25, 545, 95))
    A.paste(0, s)

    # sub 1: PICK A SKILL -> CHỌN KỸ NĂNG
    s = A.crop(1)
    clear(s, (0, 0, s.width, s.height))
    put(s, fit_text('CHỌN KỸ NĂNG', (s.width - 10, s.height - 6), 26, path=F_BLACK, fill=(255, 175, 20, 255), stroke=3, stroke_fill=BLK),
        (0, 0, s.width, s.height))
    A.paste(1, s)
    A.save()


# ============================================================ fDat121 Stage Clear screen
def patch_121():
    A = Atlas(121)

    # sub 0: LEVEL CLEARED, CLEAR BONUS:, h m s
    s = A.crop(0)
    # 1. LEVEL CLEARED
    m_lc = make_mask(s, (12, 55, 360, 135), lambda r, g, b, a: (r > 180 and g > 100 and b < 70) or lum(r, g, b) > 220 or max(r, g, b) < 60, grow=2)
    inpaint_mask(s, m_lc, mode='row')
    put(s, fit_text('HOÀN THÀNH', (310, 56), 46, path=F_BLACK, fill=(255, 220, 0, 255), stroke=3, stroke_fill=(90, 45, 5, 255), shadow=(2, 3, (60, 25, 0, 255))),
        (15, 60, 350, 130))

    # 2. CLEAR BONUS:
    m_cb = make_mask(s, (35, 142, 255, 172), lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 50, grow=2)
    inpaint_mask(s, m_cb, mode='row')
    put(s, fit_text('THƯỞNG MÀN:', (160, 24), 20, path=F_BLACK, fill=YEL, stroke=2, stroke_fill=BLK), (38, 144, 205, 170), anchor='l')

    # 3. h, m, s
    m_hms = make_mask(s, (35, 180, 325, 208), lambda r, g, b, a: (r > 200 and g > 180 and b < 50) or max(r, g, b) < 50, grow=2)
    inpaint_mask(s, m_hms, mode='row')
    unit = dict(path=F_BOLD, fill=YEL, stroke=1, stroke_fill=BLK)
    put(s, fit_text('giờ', (30, 20), 14, **unit), (135, 182, 170, 204), anchor='l')
    put(s, fit_text('phút', (36, 20), 14, **unit), (212, 182, 252, 204), anchor='l')
    put(s, fit_text('giây', (34, 20), 14, **unit), (293, 182, 332, 204), anchor='l')
    A.paste(0, s)

    # sub 2 & 3: NEXT -> TIẾP
    for i in (2, 3):
        s = A.crop(i)
        retext(s, (20, 10, 165, 66), 'TIẾP', lambda r, g, b, a: lum(r, g, b) > 180, mode='row', size=32, fill=WHT, stroke=4, stroke_fill=(30, 45, 0, 255))
        A.paste(i, s)

    # sub 5: NEW RECORD! -> KỶ LỤC MỚI!
    s = A.crop(5)
    clear(s, (0, 0, s.width, s.height))
    put(s, fit_text('KỶ LỤC MỚI!', (s.width - 4, s.height - 4), 16, path=F_BLACK, fill=WHT, stroke=2, stroke_fill=BLK),
        (0, 0, s.width, s.height))
    A.paste(5, s)
    A.save()


ALL_PATCHES = ['112', '122', '123', '129', '130', '131', '132', '133', '117', '96', '121']

if __name__ == '__main__':
    which = sys.argv[1:] or ALL_PATCHES
    for w in which:
        print(f"Applying patch_{w}...")
        globals()['patch_' + w]()
    print("All requested v2 patches applied successfully!")


