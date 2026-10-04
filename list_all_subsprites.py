import os
import glob
from PIL import Image

def analyze_sheet(folder):
    p = os.path.join('extracted/ui_subsprites', folder)
    if not os.path.exists(p):
        return
    files = sorted([f for f in os.listdir(p) if f.startswith('sub_')])
    print(f'=== Sheet: {folder} ({len(files)} subsprites) ===')
    for f in files:
        fp = os.path.join(p, f)
        im = Image.open(fp)
        print(f'  {f}: size={im.size}')

sheets = ['loading', 'titlebtn', 'option', 'tutorial0', 'tutorial1', 'tutorial2', 'tutorial3', 'tutorial4', 'pause', 'menu', 'store', 'ui', 'btn', 'chapterclear']
for s in sheets:
    analyze_sheet(s)
