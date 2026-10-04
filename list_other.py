# -*- coding: utf-8 -*-
import os, glob
print('--- non-fDat as files')
for root, d, files in os.walk('extracted/scripts'):
    for f in files:
        if f.endswith('.as') and 'Library_fDat' not in f:
            print(os.path.join(root, f).replace('extracted\\scripts\\', ''))
print('--- non-fDat bins')
for p in sorted(glob.glob('extracted/orig_bin/*.bin')):
    if 'fDat' not in p:
        print(os.path.basename(p), os.path.getsize(p))
