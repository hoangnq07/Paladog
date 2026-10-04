import sys
import re
from PIL import ImageFont

sys.stdout.reconfigure(encoding='utf-8')

font = ImageFont.truetype('native_port/assets/fonts/BeVietnamPro-Bold.ttf', 20)
with open('extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as', encoding='utf-8', errors='ignore') as f:
    lines = f.readlines()

print("Scanning Drawing.as for dialog drawString calls:")
for idx, l in enumerate(lines):
    m = re.search(r'drawString\("([^"]+)",\s*(\d+),\s*(\d+)', l)
    if m:
        text, x, y = m.group(1), int(m.group(2)), int(m.group(3))
        w = font.getlength(text)
        # In 760x570 screen, or if line is wide
        if w > 320 or (x + w) > 650:
            print(f"L{idx+1}: x={x} y={y} w={round(w)} right={round(x+w)} | {text}")
