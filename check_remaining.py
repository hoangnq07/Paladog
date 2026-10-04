import re

with open('extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as', 'r', encoding='utf-8') as f:
    content = f.read()

matches = re.findall(r'this\.lib\.(?:draw(?:String|BorderString|IntroString)(?:24|30)?)\(\s*"([^"]+)"', content)
vn_chars = 'àáảãạăằắẳẵặâầấẩẫậèéẻẽẹêềếểễệìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵđĐ'
non_vn = [m for m in matches if not any(c in m for c in vn_chars)]

with open('extracted/remaining_non_vn.txt', 'w', encoding='utf-8') as f:
    for s in sorted(set(non_vn)):
        f.write(repr(s) + '\n')

print(f"Total non_vn: {len(set(non_vn))}")
