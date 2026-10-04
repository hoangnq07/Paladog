# -*- coding: utf-8 -*-
import patch_abc_strings
import re

sig, ver, file_len, body = patch_abc_strings.read_swf('Paladog_VN.swf')
abc_tags = patch_abc_strings.find_abc_tags(body)

vn_chars = 'àáảãạăằắẳẵặâầấẩẫậèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵđĐ'

print("=== Checking ABC Strings in Paladog_VN.swf ===")
for tag in abc_tags:
    data_start = tag['data_start']
    abc_start = data_start + 4 if tag['type'] == 82 else data_start
    if tag['type'] == 82:
        while body[abc_start] != 0:
            abc_start += 1
        abc_start += 1
    strings, _ = patch_abc_strings.parse_abc_string_pool(body, abc_start)
    print(f"Tag {tag['type']}: {len(strings)} strings")
    for s in strings:
        v = s['value']
        if v and len(v) >= 15:
            # Skip code-like strings
            if any(v.startswith(p) for p in ['com.', 'flash.', 'mochi.', 'http', 'private', 'public', 'protected']):
                continue
            if '{' in v or '}' in v or ';' in v or 'var ' in v:
                continue
            has_vn = any(c in v for c in vn_chars)
            if not has_vn:
                # check if english sentence
                if ' ' in v and any(w in v.lower() for w in ['the', 'and', 'you', 'is', 'to', 'for', 'mode', 'game', 'level', 'play', 'stage', 'win', 'defeat']):
                    print("   [Candidate English Sentence]:", repr(v))
