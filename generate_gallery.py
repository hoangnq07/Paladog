import os
from PIL import Image

def generate_html_gallery():
    html = ['<html><head><style>',
            'body { background: #333; color: #fff; font-family: sans-serif; padding: 20px; }',
            '.sheet { margin-bottom: 40px; border-bottom: 2px solid #555; padding-bottom: 20px; }',
            '.grid { display: flex; flex-wrap: wrap; gap: 10px; align-items: flex-start; }',
            '.item { background: #222; border: 1px solid #444; border-radius: 4px; padding: 8px; text-align: center; }',
            '.item img { max-width: 300px; max-height: 200px; display: block; margin: 0 auto 5px; background: #555; }',
            '.label { font-size: 12px; color: #aaa; }',
            '</style></head><body>']
    
    sheets = ['loading', 'titlebtn', 'option', 'tutorial0', 'tutorial1', 'tutorial2', 'tutorial3', 'tutorial4', 'pause', 'menu', 'store', 'btn']
    for s in sheets:
        p = os.path.join('extracted/ui_subsprites', s)
        if not os.path.exists(p):
            continue
        html.append(f'<div class="sheet"><h2>{s}</h2><div class="grid">')
        files = sorted([f for f in os.listdir(p) if f.startswith('sub_')])
        for f in files:
            fp = os.path.join(p, f)
            rel_path = f'{s}/{f}'
            im = Image.open(fp)
            w, h = im.size
            html.append(f'<div class="item"><img src="{rel_path}" title="{f} ({w}x{h})"/><div class="label">{f}<br>{w}x{h}</div></div>')
        html.append('</div></div>')
    
    html.append('</body></html>')
    with open('extracted/ui_subsprites/gallery.html', 'w', encoding='utf-8') as out:
        out.write('\n'.join(html))
    print('Gallery generated at extracted/ui_subsprites/gallery.html')

generate_html_gallery()
