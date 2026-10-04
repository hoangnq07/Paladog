import re
import glob
import sys

sys.stdout.reconfigure(encoding='utf-8')

def check_file(fn):
    with open(fn, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()
    results = []
    for idx, line in enumerate(lines, 1):
        strs = re.findall(r'"([^"]*[\u00C0-\u1EF9][^"]*)"', line)
        for s in strs:
            results.append((idx, s))
    return results

print("=== SCANNING AS FILES ===")
for fn in sorted(glob.glob('extracted/scripts/scripts/com/fazecat/web/paladog/*.as')):
    res = check_file(fn)
    if res:
        print(f"\n--- {fn} ({len(res)} strings) ---")
        for idx, s in res:
            print(f"L{idx:4d}: {s}")

print("\n=== SCANNING CPP FILES ===")
for fn in sorted(glob.glob('native_port/src/game/*.cpp')):
    res = check_file(fn)
    if res:
        print(f"\n--- {fn} ({len(res)} strings) ---")
        for idx, s in res:
            print(f"L{idx:4d}: {s}")
