import os
import subprocess

exe = os.path.abspath('native_port/build/paladog.exe')
args = [
    exe,
    '--click', '1000:110:490',  # PLAY
    '--click', '1200:480:160',  # Slot 1
    '--click', '1300:645:130',  # Start
    '--click', '1400:410:385',  # Click "CÓ" on delete confirmation popup!
    '--click', '1500:271:270',  # Normal difficulty
    '--click', '1600:565:385',  # OK
    
    # Intro scenes:
    '--shot', '1850:shots/intro_fresh_scene15.png',
    '--shot', '2100:shots/intro_fresh_scene17.png',
    '--shot', '2400:shots/intro_fresh_scene19.png',
    '--shot', '2700:shots/intro_fresh_scene21.png',
    '--shot', '3000:shots/intro_fresh_scene23.png',
    '--shot', '3300:shots/intro_fresh_scene24.png',
    '--shot', '3800:shots/intro_fresh_scene26.png',
    '--quit-after', '4000',
    '--fast'
]

print("Running fresh Intro test with Slot 1 reset...")
res = subprocess.run(args, cwd='native_port')
print("Completed:", res.returncode)
