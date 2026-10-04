with open('extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as', 'r', encoding='utf-8', errors='ignore') as f:
    lines = f.readlines()

for idx, line in enumerate(lines):
    for kw in ['imgOption', 'imgTitleBtn', 'imgPause', 'imgLoading']:
        if kw in line and 'public static const' not in line:
            print(f'{idx+1:5d}: {line.strip()}')
