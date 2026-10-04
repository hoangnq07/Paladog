# -*- coding: utf-8 -*-
import patch_abc_strings

sig, ver, file_len, body = patch_abc_strings.read_swf('Paladog.swf')
abc_tags = patch_abc_strings.find_abc_tags(body)

print("=== Analyzing Paladog.swf ABC pool ===")
all_game_strings = []

for tag in abc_tags:
    data_start = tag['data_start']
    abc_start = data_start + 4 if tag['type'] == 82 else data_start
    if tag['type'] == 82:
        while body[abc_start] != 0:
            abc_start += 1
        abc_start += 1
    strings, _ = patch_abc_strings.parse_abc_string_pool(body, abc_start)
    for s in strings:
        v = s['value']
        if not v or len(v.strip()) == 0:
            continue
        # Skip package names, namespaces, actionscript internal symbols
        if any(v.startswith(p) for p in ['com.', 'flash.', 'mx.', 'mochi.', 'http', 'private', 'public', 'protected', '_']):
            continue
        if any(c in v for c in ['{', '}', ';', '(', ')', '=']):
            continue
        # If it has spaces and letters, or punctuation typical of dialogues
        if ' ' in v or any(p in v for p in ['!', '?', '...']):
            if len(v) > 3:
                all_game_strings.append(v)

print(f"Total candidate game strings: {len(all_game_strings)}")
with open('extracted/paladog_swf_dialogue_candidates.txt', 'w', encoding='utf-8') as f:
    for g in sorted(set(all_game_strings)):
        f.write(repr(g) + '\n')

print("Wrote extracted/paladog_swf_dialogue_candidates.txt")
