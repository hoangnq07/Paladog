# -*- coding: utf-8 -*-
"""Check for TRULY English-only strings (no Vietnamese diacritics at all)"""
import re

with open('extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as', 'r', encoding='utf-8') as f:
    content = f.read()

pattern = r'this\.lib\.(draw(?:String|BorderString|IntroString)(?:24|30)?)\(\s*"([^"]{3,})"'
calls = re.findall(pattern, content)

vn_chars = set('àáảãạăằắẳẵặâầấẩẫậèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵđĐÀÁẢÃẠĂẰẮẲẴẶÂẦẤẨẪẬÈÉẺẼẸÊỀẾỂỄỆÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴ')
korean_chars = re.compile(r'[\uac00-\ud7af\u1100-\u11ff\u3130-\u318f]')

truly_eng = []
has_korean = []

for func, text in calls:
    has_vn = any(c in vn_chars for c in text)
    if korean_chars.search(text):
        has_korean.append((func, text[:80]))
    elif not has_vn and re.search(r'[a-zA-Z]{4,}', text):
        truly_eng.append((func, text[:80]))

print(f"=== Truly English-only strings (no VN diacritics): {len(truly_eng)} ===")
for func, text in truly_eng:
    print(f"  {func}: {text}")

print(f"\n=== Korean strings: {len(has_korean)} ===")
for func, text in has_korean:
    print(f"  {func}: {text}")
