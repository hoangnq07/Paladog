"""Create Vietnamese version of the splash 'NOW LOADING' overlay (Library_Logo02Img, tag 226)."""
from PIL import Image, ImageDraw, ImageFont
import os

FONT_PATH = r"C:\Windows\Fonts\tahomabd.ttf"
SRC = "extracted/swf_images/226_com.fazecat.web.paladog.Library_Logo02Img.png"
OUT = "extracted/swf_images/226_vn.png"
BROWN = (166, 72, 20, 255)

im = Image.open(SRC).convert("RGBA")
px = im.load()
# erase original brown text
minx, miny, maxx, maxy = 10**6, 10**6, -1, -1
for y in range(526, 558):
    for x in range(372, 718):
        if px[x, y] == BROWN:
            minx, miny = min(minx, x), min(miny, y)
            maxx, maxy = max(maxx, x), max(maxy, y)
            px[x, y] = (0, 0, 0, 0)
print("orig text bbox", minx, miny, maxx, maxy)

text = "ĐANG TẢI"
S = 4
font = ImageFont.truetype(FONT_PATH, 17 * S)
tmp = Image.new("L", (400 * S, 60 * S), 0)
d = ImageDraw.Draw(tmp)
d.text((10 * S, 10 * S), text, font=font, fill=255)
bb = tmp.getbbox()
glyph = tmp.crop(bb)
w, h = glyph.size[0] // S, glyph.size[1] // S
glyph = glyph.resize((w, h), Image.LANCZOS)
cx = (minx + maxx) // 2
cy = (miny + maxy) // 2
ox, oy = cx - w // 2, cy - h // 2
mask = glyph.point(lambda v: 255 if v > 110 else 0)  # hard edge like original
layer = Image.new("RGBA", im.size, (0, 0, 0, 0))
layer.paste(Image.new("RGBA", (w, h), BROWN), (ox, oy), mask)
im = Image.alpha_composite(im, layer)
im.save(OUT)
print("saved", OUT, (ox, oy, w, h))
