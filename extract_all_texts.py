import os
import re
import zlib
import struct
import json

def parse_db_file(filepath):
    with open(filepath, 'rb') as f:
        data = zlib.decompress(f.read())
    
    pos = 0
    rows = struct.unpack('<I', data[pos:pos+4])[0]
    pos += 4
    cols = struct.unpack('<I', data[pos:pos+4])[0]
    pos += 4
    
    table = []
    for r in range(rows):
        row = []
        for c in range(cols):
            slen = struct.unpack('<I', data[pos:pos+4])[0]
            pos += 4
            sbytes = data[pos:pos+slen]
            pos += slen
            try:
                s = sbytes.decode('utf-8')
            except:
                s = sbytes.decode('latin1', errors='replace')
            row.append(s)
        table.append(row)
    return table

# 1. DB0
db0 = parse_db_file('extracted/binaryData/408_com.fazecat.web.paladog.Library_DB0.bin')
# 2. DB4
db4 = parse_db_file('extracted/binaryData/416_com.fazecat.web.paladog.Library_DB4.bin')
# 3. DB6
db6 = parse_db_file('extracted/binaryData/420_com.fazecat.web.paladog.Library_DB6.bin')

# 4. Drawing.as
with open('extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as', 'r', encoding='utf-8') as f:
    drawing_content = f.read()

drawing_calls = []
# Find all drawString/drawBorderString/drawIntroString calls with line numbers
for m in re.finditer(r'this\.lib\.(draw(?:String|BorderString|IntroString)(?:24|30)?)\(\s*"([^"]+)"', drawing_content):
    func_name = m.group(1)
    text = m.group(2)
    start_pos = m.start()
    line_no = drawing_content[:start_pos].count('\n') + 1
    drawing_calls.append({
        'line': line_no,
        'func': func_name,
        'text': text
    })

# Check other files in com/fazecat/web/paladog
other_scripts = {}
for root, dirs, files in os.walk('extracted/scripts/scripts/com/fazecat/web/paladog'):
    for file in files:
        if file.startswith('Library_f') or file.startswith('Library_snd') or file == 'Drawing.as':
            continue
        filepath = os.path.join(root, file)
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            code = f.read()
        # Find string literals that look like UI text (more than 1 char, letters, not identifiers)
        matches = re.findall(r'"([^"\\]*(?:\\.[^"\\]*)*)"', code)
        ui_matches = []
        for s in matches:
            if len(s) > 2 and any(c.isalpha() for c in s):
                if not any(s.startswith(p) for p in ['com.', 'flash.', 'mx.', 'http', 'paladog_', 'btn', 'snd', 'img', 'Ani_', 'Library_']):
                    if not s.endswith('.png') and not s.endswith('.jpg') and not s.endswith('.mp3') and not s.endswith('.dat'):
                        ui_matches.append(s)
        if ui_matches:
            other_scripts[file] = list(set(ui_matches))

summary = {
    'db0_boss_dialogs_count': len(db0),
    'db0_sample': db0[:2],
    'db4_store_info_count': len(db4),
    'db4_sample': db4[:2],
    'db6_unit_info_count': len(db6),
    'db6_sample': db6[:2],
    'drawing_calls_count': len(drawing_calls),
    'drawing_unique_texts': len(set(d['text'] for d in drawing_calls)),
    'other_scripts': other_scripts
}

print(json.dumps(summary, indent=2, ensure_ascii=False))

with open('extracted/all_texts_catalog.json', 'w', encoding='utf-8') as f:
    json.dump({
        'db0': db0,
        'db4': db4,
        'db6': db6,
        'drawing_calls': drawing_calls,
        'other_scripts': other_scripts
    }, f, indent=2, ensure_ascii=False)

print('Saved extracted/all_texts_catalog.json')
