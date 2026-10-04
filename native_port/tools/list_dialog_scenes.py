import sys
import re
from PIL import ImageFont

sys.stdout.reconfigure(encoding='utf-8')
font = ImageFont.truetype('native_port/assets/fonts/BeVietnamPro-Bold.ttf', 20)

with open('extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as', encoding='utf-8', errors='ignore') as f:
    lines = f.readlines()

print("Listing all dialog blocks:")
current_func = ""
for idx, line in enumerate(lines):
    if "function " in line:
        current_func = line.strip()
    m = re.search(r'drawString\("([^"]+)",\s*(\d+),\s*(\d+)', line)
    if m:
        text, x, y = m.group(1), int(m.group(2)), int(m.group(3))
        w = round(font.getlength(text))
        # Dialog lines are typically in event/cutscene functions or have y around 130-280
        if y >= 120 and y <= 300 and ('cứu' in text or 'chìa' in text or 'ma' in text or 'Đa tạ' in text or 'Đói' in text or 'Cước pháp' in text or 'bản ngã' in text or 'chiến' in text or 'rừng' in text or 'sinh mạng' in text or 'pháo' in text):
            print(f"L{idx+1} [x={x}, y={y}, w={w}, r={x+w}]: {text}")
