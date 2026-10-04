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
    
    # Click Stage 1
    '--click', '5000:108:175',
    
    # Skip tutorial
    '--click', '5300:70:535',
    '--click', '5400:70:535',
]

# Dismiss tutorial
for f in range(5500, 6800, 50):
    args.extend(['--click', f'{f}:680:50'])

# Battle inputs
for f in range(6800, 13000, 10):
    if f % 25 == 0:
        args.extend(['--key', f'{f}:49']) # Mouse unit
    if f % 20 == 0:
        args.extend(['--key', f'{f}:74']) # Mace punch
    if f % 30 == 0:
        args.extend(['--key', f'{f}:68']) # D walk right

# Level Up banner capture around frame 9200
args.extend([
    '--shot', f'9300:{shots_dir}/ui_08_levelup_banner.png',
])

# Pick level up card
for f in range(9400, 12000, 150):
    args.extend(['--key', f'{f}:49'])

# Stage Clear capture around frame 14500
args.extend([
    '--shot', f'14800:{shots_dir}/ui_09_stage_clear.png',
    '--quit-after', '15200',
    '--fast'
])

print("Running battle and clear test...")
res = subprocess.run(args, cwd='native_port')
print("Completed:", res.returncode)
