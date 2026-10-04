# -*- coding: utf-8 -*-
from build_vietnamese_data import DRAWING_REPLACEMENTS

with open('extracted/paladog_swf_dialogue_candidates.txt', 'r', encoding='utf-8') as f:
    lines = [eval(line.strip()) for line in f if line.strip()]

missing = []
for s in lines:
    if s not in DRAWING_REPLACEMENTS:
        # Check if it's Flex internal string
        if any(w in s for w in ['RSL', 'Flex', 'Layout', 'Repeater', 'FTE', 'DataGroup', 'Zoom', 'child', 'Class', 'Row %1', 'Level %1', 'Screen', 'left top', 'tl tr', 'Video', 'View']):
            continue
        missing.append(s)

print(f"Total missing game strings: {len(missing)}")
for m in missing:
    print("  ", repr(m))
