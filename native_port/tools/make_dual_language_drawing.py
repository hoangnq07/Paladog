import re

with open('extracted/orig_scripts/scripts/com/fazecat/web/paladog/Drawing.as', 'r', encoding='utf-8', errors='ignore') as f:
    orig_text = f.read()

with open('native_port/src/gen/Drawing.cpp', 'r', encoding='utf-8', errors='ignore') as f:
    cpp_text = f.read()

orig_matches = list(re.finditer(r'this\.lib\.drawString\((.+?)\);', orig_text))
cpp_matches = list(re.finditer(r'this->lib->drawString\((.+?)\);', cpp_text))

assert len(orig_matches) == len(cpp_matches) == 117

# Build replacement list (from back to front so offsets don't change)
replacements = []
for i in range(117):
    oc = orig_matches[i].group(1).strip()
    cc = cpp_matches[i].group(1).strip()
    
    if i in [23, 24]: # Store price (nItemPrice + " Gold" / " Vàng")
        en_call = 'this->lib->drawString((as3::str(this->nItemPrice) + as3::str(std::string(" Gold"))), 710, 130, 16744448, 100, (kDrawing::TOP | kDrawing::RIGHT));'
        vi_call = cpp_matches[i].group(0)
        replacement = f"#if defined(PALADOG_LANG_EN)\n                                {en_call}\n#else\n                                {vi_call}\n#endif"
        replacements.append((cpp_matches[i].start(), cpp_matches[i].end(), replacement))
    elif 'std::string(' in cc:
        # Convert AS3 parameters to C++ parameters for English
        # e.g. "Thank you for saving me.",210,135,0,100,TOP | LEFT
        # -> std::string("Thank you for saving me."), 210, 135, 0, 100, (kDrawing::TOP | kDrawing::LEFT)
        parts = [p.strip() for p in oc.split(',')]
        en_str = parts[0]
        # Remove any escaping like \' -> '
        en_str_clean = en_str.replace("\\'", "'")
        rest_parts = parts[1:]
        # Convert TOP | LEFT to (kDrawing::TOP | kDrawing::LEFT)
        anchor_part = rest_parts[-1]
        anchor_c = anchor_part.replace('TOP', 'kDrawing::TOP').replace('LEFT', 'kDrawing::LEFT').replace('RIGHT', 'kDrawing::RIGHT').replace('HCENTER', 'kDrawing::HCENTER').replace('VCENTER', 'kDrawing::VCENTER')
        rest_parts[-1] = f'({anchor_c})'
        
        en_call = f'this->lib->drawString(std::string({en_str_clean}), {", ".join(rest_parts)});'
        vi_call = cpp_matches[i].group(0)
        replacement = f"#if defined(PALADOG_LANG_EN)\n                {en_call}\n#else\n                {vi_call}\n#endif"
        replacements.append((cpp_matches[i].start(), cpp_matches[i].end(), replacement))

print(f"Applying {len(replacements)} dual-language replacements to Drawing.cpp...")
# Apply from bottom up
new_cpp = cpp_text
for start, end, repl in reversed(replacements):
    new_cpp = new_cpp[:start] + repl + new_cpp[end:]

with open('native_port/src/gen/Drawing.cpp', 'w', encoding='utf-8') as f:
    f.write(new_cpp)

print("Done! Drawing.cpp updated with dual-language support.")
