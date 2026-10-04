# -*- coding: utf-8 -*-
import re

with open('extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as', 'r', encoding='utf-8') as f:
    code = f.read()

calls = re.findall(r'this\.lib\.(?:draw(?:String|BorderString|IntroString)(?:24|30)?)\(\s*"([^"]+)"', code)
print(f"Total drawString calls: {len(calls)}")
unique = sorted(set(calls))
vn_chars = 'àáảãạăằắẳẵặâầấẩẫậèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵđĐ'
untrans = [c for c in unique if not any(ch in c for ch in vn_chars)]
print(f"Untranslated: {len(untrans)}")
for u in untrans:
    print('  ', repr(u))
