import os
import subprocess

exe = os.path.abspath('native_port/build/paladog.exe')
shots_dir = os.path.abspath('native_port/shots')

args = [
    exe,
    '--click', '1050:110:490',  # PLAY
    '--click', '1450:480:160',  # Slot 1
    '--click', '1600:645:130',  # Start
    '--click', '1850:271:270',  # Normal
    '--click', '1950:565:385',  # OK
    
    # Skip intro cutscenes
    '--click', '2500:670:42',
    '--click', '3000:670:42',
    '--click', '3500:670:42',
    '--click', '4000:670:42',
    
    # Click Stage 1 at (108, 175)
    '--click', '5000:108:175',
    
    # Skip tutorial
    '--click', '5300:70:535',
    '--click', '5400:70:535',
]

# Dismiss tutorial
for f in range(5500, 6800, 50):
    args.extend(['--click', f'{f}:680:50'])

# In battle, press Pause button (top right: 710, 40) around frame 7200
args.extend([
    '--click', '7200:710:40',
    # Screenshot of Pause screen
    '--shot', f'7400:{shots_dir}/ui_07_pause_screen.png',
    '--quit-after', '7600',
    '--fast'
])

print("Running test for Pause screen...")
res = subprocess.run(args, cwd='native_port')
print("Completed:", res.returncode)
