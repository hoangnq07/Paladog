# -*- coding: utf-8 -*-
import sys, os
sys.path.insert(0, os.path.abspath('.'))
from uitool import Atlas

atlases = [126, 92, 123, 117, 112, 121, 122, 96, 115, 39, 90]
for num in atlases:
    try:
        A = Atlas(num, src='orig')
        print(f"=== fDat{num} ({A.n} subs) ===")
        for s in A.subs:
            print(f"  sub {s['i']:2d}: ax={s['ax']:4d}, ay={s['ay']:4d}, w={s['w']:4d}, h={s['h']:4d}, x={s['sx']:4d}, y={s['sy']:4d}")
    except Exception as e:
        print(f"fDat{num} error: {e}")
