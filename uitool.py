# -*- coding: utf-8 -*-
"""Shared helpers for patching Paladog fDat atlases (v2 patcher).

An fDat bin = zlib( uint32 N | N * 8 int32 (ax,ay,orgW,orgH,sx,sy,w,h) | PNG atlas ).
"""
import glob, io, os, shutil, struct, zlib
from PIL import Image, ImageDraw, ImageFont, ImageChops

FONT_DIR = 'C:/Windows/Fonts/'
F_BLACK = FONT_DIR + 'seguibl.ttf'     # chunky headline
F_BOLD = FONT_DIR + 'tahomabd.ttf'     # body bold
F_SEGB = FONT_DIR + 'segoeuib.ttf'

ORIG = 'extracted/orig_bin'
DEST = 'extracted/binaryData'


def font(size, path=F_BOLD):
    return ImageFont.truetype(path, size)


class Atlas:
    def __init__(self, num, src='orig'):
        self.num = num
        base = ORIG if src == 'orig' else DEST
        cands = glob.glob(f'{ORIG}/*Library_fDat{num}.bin')
        assert cands, num
        self.orig_path = cands[0]
        self.name = os.path.basename(self.orig_path)
        self.tag = int(self.name.split('_')[0])
        path = glob.glob(f'{base}/*Library_fDat{num}.bin')[0]
        d = zlib.decompress(open(path, 'rb').read())
        self.n = struct.unpack('<I', d[:4])[0]
        self.header = d[:4 + 32 * self.n]
        self.subs = []
        for i in range(self.n):
            ax, ay, ow, oh, sx, sy, w, h = struct.unpack('<8i', d[4 + i * 32:36 + i * 32])
            self.subs.append(dict(i=i, ax=ax, ay=ay, ow=ow, oh=oh, sx=sx, sy=sy, w=w, h=h))
        self.img = Image.open(io.BytesIO(d[len(self.header):])).convert('RGBA')

    def crop(self, i):
        s = self.subs[i]
        return self.img.crop((s['ax'], s['ay'], s['ax'] + s['w'], s['ay'] + s['h']))

    def paste(self, i, im):
        s = self.subs[i]
        assert im.size == (s['w'], s['h']), (im.size, s)
        # replace (not blend) so transparent pixels stay transparent
        self.img.paste(im, (s['ax'], s['ay']))

    def save(self):
        buf = io.BytesIO()
        self.img.save(buf, format='PNG')
        out = zlib.compress(self.header + buf.getvalue())
        os.makedirs(DEST, exist_ok=True)
        with open(f'{DEST}/{self.name}', 'wb') as f:
            f.write(out)
        print(f'  saved fDat{self.num} tag {self.tag}: {len(out)} bytes')


# ---------------------------------------------------------------- erase
def clear(im, box):
    """Make box fully transparent."""
    x0, y0, x1, y1 = box
    ImageDraw.Draw(im).rectangle([x0, y0, x1 - 1, y1 - 1], fill=(0, 0, 0, 0))


def fill(im, box, color):
    x0, y0, x1, y1 = box
    ImageDraw.Draw(im).rectangle([x0, y0, x1 - 1, y1 - 1], fill=color)


def inpaint_rows(im, box, k=3):
    """Row-wise linear interpolation between pixels left and right of box.
    Good for text on smooth (gradient / parchment) backgrounds."""
    x0, y0, x1, y1 = box
    px = im.load()
    W, H = im.size
    for y in range(max(0, y0), min(H, y1)):
        def samp(xs):
            cols = [px[x, y] for x in xs if 0 <= x < W]
            return tuple(sum(c[j] for c in cols) / len(cols) for j in range(4))
        l = samp(range(x0 - k, x0))
        r = samp(range(x1, x1 + k))
        for x in range(max(0, x0), min(W, x1)):
            t = (x - x0 + 0.5) / (x1 - x0)
            px[x, y] = tuple(int(round(l[j] * (1 - t) + r[j] * t)) for j in range(4))


def inpaint_cols(im, box, k=3):
    x0, y0, x1, y1 = box
    px = im.load()
    W, H = im.size
    for x in range(max(0, x0), min(W, x1)):
        def samp(ys):
            rows = [px[x, y] for y in ys if 0 <= y < H]
            return tuple(sum(c[j] for c in rows) / len(rows) for j in range(4))
        t_ = samp(range(y0 - k, y0))
        b_ = samp(range(y1, y1 + k))
        for y in range(max(0, y0), min(H, y1)):
            t = (y - y0 + 0.5) / (y1 - y0)
            px[x, y] = tuple(int(round(t_[j] * (1 - t) + b_[j] * t)) for j in range(4))


def recolor_keep_alpha(im, box, color):
    """Paint opaque pixels in box with a color, keeping alpha."""
    x0, y0, x1, y1 = box
    px = im.load()
    for y in range(y0, y1):
        for x in range(x0, x1):
            a = px[x, y][3]
            if a:
                px[x, y] = color[:3] + (a,)


from PIL import ImageFilter


def make_mask(im, box, pred, grow=0):
    """L-mask (255 = erase) of pixels inside box where pred(r,g,b,a) is true, dilated by grow."""
    x0, y0, x1, y1 = box
    m = Image.new('L', im.size, 0)
    mp = m.load()
    px = im.load()
    for y in range(max(0, y0), min(im.height, y1)):
        for x in range(max(0, x0), min(im.width, x1)):
            r, g, b, a = px[x, y]
            if a and pred(r, g, b, a):
                mp[x, y] = 255
    if grow:
        m = m.filter(ImageFilter.MaxFilter(2 * grow + 1))
        # keep inside box
        keep = Image.new('L', im.size, 0)
        ImageDraw.Draw(keep).rectangle([x0, y0, x1 - 1, y1 - 1], fill=255)
        m = Image.composite(m, Image.new('L', im.size, 0), keep)
    return m


def inpaint_mask(im, mask, passes=1, mode='both'):
    """Fill masked pixels by averaging row interpolation and column interpolation
    between nearest unmasked pixels (works for text on smooth gradients)."""
    W, H = im.size
    px = im.load()
    mp = mask.load()
    src = im.copy().load()
    rowv = {}
    for y in range(H):
        x = 0
        while x < W:
            if mp[x, y]:
                s = x
                while x < W and mp[x, y]:
                    x += 1
                e = x  # first unmasked
                l = src[s - 1, y] if s > 0 else None
                r = src[e, y] if e < W else None
                for xx in range(s, e):
                    if l and r:
                        t = (xx - s + 1) / (e - s + 1)
                        rowv[(xx, y)] = tuple(l[j] * (1 - t) + r[j] * t for j in range(4))
                    else:
                        rowv[(xx, y)] = tuple(l or r)
            else:
                x += 1
    colv = {}
    for x in range(W):
        y = 0
        while y < H:
            if mp[x, y]:
                s = y
                while y < H and mp[x, y]:
                    y += 1
                e = y
                t_ = src[x, s - 1] if s > 0 else None
                b_ = src[x, e] if e < H else None
                for yy in range(s, e):
                    if t_ and b_:
                        t = (yy - s + 1) / (e - s + 1)
                        colv[(x, yy)] = tuple(t_[j] * (1 - t) + b_[j] * t for j in range(4))
                    else:
                        colv[(x, yy)] = tuple(t_ or b_)
            else:
                y += 1
    for (x, y), rv in rowv.items():
        cv = colv.get((x, y), rv)
        if mode == 'col':
            rv = cv
        elif mode == 'row':
            cv = rv
        px[x, y] = tuple(int(round((rv[j] * 2 + cv[j]) / 3)) for j in range(4))


# ---------------------------------------------------------------- text
def erase_dilate(im, box, seed_pred, grow=3, bg=None):
    """Erase glyphs found by seed_pred (+ dilation to cover outline) by filling with flat bg colour."""
    m = make_mask(im, box, lambda r, g, b, a: seed_pred(r, g, b), grow=0)
    m = m.filter(ImageFilter.MaxFilter(2 * grow + 1))
    keep = Image.new('L', im.size, 0)
    x0, y0, x1, y1 = box
    ImageDraw.Draw(keep).rectangle([x0, y0, x1 - 1, y1 - 1], fill=255)
    m = ImageChops.multiply(m, keep)
    if bg is None:
        bg = im.getpixel((x0 + 1, y0 + 1))
    im.paste(Image.new('RGBA', im.size, tuple(bg)), (0, 0), m)
    return bg


def erase_flat(im, box, seed_pred, bg=None, tol=14, grow=1):
    """Erase text sitting on a flat colour: flood from seed pixels (e.g. white glyphs)
    through every pixel inside box that differs from the background colour, then fill with bg."""
    from collections import Counter, deque
    x0, y0, x1, y1 = box
    px = im.load()
    if bg is None:
        bg = px[x0 + 1, y0 + 1]
        if seed_pred(*bg[:3]):
            cnt = Counter(px[x, y] for y in range(y0, y1) for x in range(x0, x1) if px[x, y][3] > 0)
            for col, _ in cnt.most_common():
                if not seed_pred(*col[:3]):
                    bg = col
                    break
    far = lambda p: sum(abs(p[j] - bg[j]) for j in range(3)) > tol
    seen = set()
    dq = deque()
    for y in range(y0, y1):
        for x in range(x0, x1):
            if seed_pred(*px[x, y][:3]):
                seen.add((x, y))
                dq.append((x, y))
    while dq:
        x, y = dq.popleft()
        for dx in (-1, 0, 1):
            for dy in (-1, 0, 1):
                nx, ny = x + dx, y + dy
                if x0 <= nx < x1 and y0 <= ny < y1 and (nx, ny) not in seen and far(px[nx, ny]):
                    seen.add((nx, ny))
                    dq.append((nx, ny))
    m = Image.new('L', im.size, 0)
    mp = m.load()
    for (x, y) in seen:
        mp[x, y] = 255
    if grow:
        m = m.filter(ImageFilter.MaxFilter(2 * grow + 1))
        mp = m.load()
    for y in range(y0, y1):
        for x in range(x0, x1):
            if mp[x, y] and far(px[x, y]) or (mp[x, y] and (x, y) in seen):
                px[x, y] = bg
    return bg


# ---------------------------------------------------------------- text
def text_layer(text, size, fill=(255, 255, 255, 255), stroke=0, stroke_fill=(0, 0, 0, 255),
               shadow=None, path=F_BOLD, line_gap=2, spacing=0):
    """Return tight RGBA layer containing (multi-line) text with stroke and shadow."""
    S = 3
    ft = ImageFont.truetype(path, size * S)
    lines = text.split('\n')
    pad = (stroke + 3) * S + (max(abs(shadow[0]), abs(shadow[1])) * S if shadow else 0)
    metrics = [ft.getbbox(l, stroke_width=stroke * S) for l in lines]
    lw = [m[2] - m[0] for m in metrics]
    asc, desc = ft.getmetrics()
    hb = ft.getbbox('H')
    cap_top, base = hb[1], hb[3]
    line_h = asc + desc + line_gap * S
    Wd = max(lw) + 2 * pad
    Ht = line_h * len(lines) + 2 * pad
    lay = Image.new('RGBA', (Wd, Ht), (0, 0, 0, 0))
    d = ImageDraw.Draw(lay)
    for n, l in enumerate(lines):
        x = pad + (max(lw) - lw[n]) // 2 - metrics[n][0]
        y = pad + n * line_h
        if shadow:
            sx, sy, sc = shadow
            d.text((x + sx * S, y + sy * S), l, font=ft, fill=sc, stroke_width=stroke * S, stroke_fill=sc)
        d.text((x, y), l, font=ft, fill=fill, stroke_width=stroke * S, stroke_fill=stroke_fill if stroke else None)
    bb = lay.getbbox()
    lay = lay.crop(bb)
    capc = (pad + (cap_top + base) / 2 - bb[1]) / S
    lay = lay.resize((max(1, round(lay.width / S)), max(1, round(lay.height / S))), Image.LANCZOS)
    if len(lines) == 1:
        lay.info['capc'] = capc
    return lay


def fit_text(text, box, size=40, min_size=8, **kw):
    """Largest font size (<= size) that fits inside box (w,h)."""
    bw, bh = box
    for s in range(size, min_size - 1, -1):
        lay = text_layer(text, s, **kw)
        if lay.width <= bw and lay.height <= bh:
            return lay
    return text_layer(text, min_size, **kw)


def put(im, lay, box, dx=0, dy=0, anchor='c'):
    """Alpha-composite layer inside box=(x0,y0,x1,y1); anchor c/l/r."""
    x0, y0, x1, y1 = box
    if anchor == 'c':
        x = x0 + (x1 - x0 - lay.width) // 2
    elif anchor == 'l':
        x = x0
    else:
        x = x1 - lay.width
    if 'capc' in lay.info:
        y = int(round(y0 + (y1 - y0) / 2 - lay.info['capc']))
    else:
        y = y0 + (y1 - y0 - lay.height) // 2
    im.alpha_composite(lay, (x + dx, y + dy))


def sheet(atlas_or_images, path, scale=2, bg=(90, 90, 120, 255), cols=3, idx=None):
    """Debug: save contact of sub images (list of (label,img))."""
    items = atlas_or_images
    ims = []
    for lab, im in items:
        ims.append((lab, im))
    pad = 6
    cw = max(i.width for _, i in ims) * scale + pad
    rows = []
    x = y = 0
    rowh = 0
    pos = []
    W = cols * cw
    for lab, im in ims:
        w, h = im.width * scale + pad, im.height * scale + pad + 12
        if x + w > W and x:
            x = 0
            y += rowh
            rowh = 0
        pos.append((x, y))
        x += w
        rowh = max(rowh, h)
    Ht = y + rowh
    out = Image.new('RGBA', (W, Ht), bg)
    d = ImageDraw.Draw(out)
    for (lab, im), (px_, py_) in zip(ims, pos):
        d.text((px_ + 2, py_), str(lab), fill=(255, 255, 0, 255))
        out.alpha_composite(im.resize((im.width * scale, im.height * scale), Image.NEAREST), (px_ + 2, py_ + 12))
    out.save(path)
