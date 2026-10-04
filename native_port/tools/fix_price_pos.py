import os

drawing_path = 'native_port/src/gen/Drawing.cpp'
with open(drawing_path, 'r', encoding='utf-8') as f:
    content = f.read()

target = 'this->lib->drawString((as3::str(this->nItemPrice) + as3::str(std::string(" V\\303\\240ng"))), 760, 130, 16744448, 100, (kDrawing::TOP | kDrawing::RIGHT));'
replacement = 'this->lib->drawString((as3::str(this->nItemPrice) + as3::str(std::string(" V\\303\\240ng"))), 710, 130, 16744448, 100, (kDrawing::TOP | kDrawing::RIGHT));'

count = content.count(target)
print('Matches found:', count)
assert count == 2, f'Expected 2 occurrences, found {count}'

new_content = content.replace(target, replacement)
with open(drawing_path, 'w', encoding='utf-8') as f:
    f.write(new_content)

print('Updated Drawing.cpp successfully!')
