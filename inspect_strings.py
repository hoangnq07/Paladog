import re
import os

with open('extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as', 'r', encoding='utf-8') as f:
    content = f.read()

# Match any drawString call with a string literal
pattern = re.compile(r'draw(?:String|BorderString|IntroString)(?:24|30)?\(\s*"([^"]+)"')
matches = pattern.findall(content)

print(f'Total drawString string literals: {len(matches)}')
unique_strings = sorted(set(matches))
print(f'Unique string literals: {len(unique_strings)}')

# Also search for all other classes in com/fazecat/web/paladog
all_literals = set()
for root, dirs, files in os.walk('extracted/scripts/scripts/com/fazecat/web/paladog'):
    for file in files:
        if file.startswith('Library_f') or file.startswith('Library_snd'):
            continue
        filepath = os.path.join(root, file)
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            c = f.read()
        for lit in re.findall(r'"([^"\\]*(?:\\.[^"\\]*)*)"', c):
            if len(lit) > 2 and any(ch.isalpha() for ch in lit) and not lit.startswith('com.') and not lit.startswith('flash.') and not lit.startswith('mx.'):
                all_literals.add((file, lit))

print(f'Total general string literals across game scripts: {len(all_literals)}')

# Let's save the drawString unique strings to a text file for analysis
with open('extracted/drawString_literals.txt', 'w', encoding='utf-8') as f:
    for s in unique_strings:
        f.write(s + '\n')

print('Wrote extracted/drawString_literals.txt')
