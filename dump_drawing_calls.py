import json

with open('extracted/all_texts_catalog.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

calls = data['drawing_calls']
with open('extracted/drawing_calls_dump.txt', 'w', encoding='utf-8') as f:
    for c in calls:
        f.write(f"{c['line']}: [{c['func']}] {c['text']}\n")

print(f"Wrote {len(calls)} calls to extracted/drawing_calls_dump.txt")
