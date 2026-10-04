import os
from PIL import Image
import json

targets = [
    'fdat_099_loading.png',
    'fdat_115_option.png',
    'fdat_126_titlebtn.png',
    'fdat_129_tutorial0.png',
    'fdat_130_tutorial1.png',
    'fdat_131_tutorial2.png',
    'fdat_132_tutorial3.png',
    'fdat_133_tutorial4.png',
    'fdat_117_pause.png',
    'fdat_112_menu.png',
    'fdat_123_store.png',
    'fdat_143_ui.png',
    'fdat_031_btn.png',
    'fdat_033_chapterclear.png',
    'fdat_122_stageselect.png',
    'fdat_125_title.png',
]

for t in targets:
    p = os.path.join('extracted/fdat_images', t)
    if os.path.exists(p):
        im = Image.open(p)
        print(f'{t:30s}: size={im.size}, mode={im.mode}')
