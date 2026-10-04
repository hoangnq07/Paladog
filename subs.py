import sys
from uitool import *
num = int(sys.argv[1])
src = 'orig'
ids = None
scale = 2
for a in sys.argv[2:]:
    if a in ('orig', 'cur'): src = a
    elif a.startswith('x'): scale = int(a[1:])
    else:
        ids = (ids or []) + [int(t) for t in a.split(',')]
A = Atlas(num, src)
ids = ids if ids is not None else range(A.n)
os.makedirs('extracted/subs', exist_ok=True)
out = f'extracted/subs/fdat{num}_{src}.png'
sheet([(f"{i} {A.subs[i]['w']}x{A.subs[i]['h']} s({A.subs[i]['sx']},{A.subs[i]['sy']})", A.crop(i)) for i in ids], out, scale=scale, cols=2 if scale>1 else 3)
print(out)
