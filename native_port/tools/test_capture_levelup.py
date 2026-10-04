import os
import subprocess

exe = os.path.abspath('build/paladog.exe')
args = [
    exe,
    '--click', '1000:110:490',  # PLAY
    '--click', '1200:480:160',  # Slot 1
    '--click', '1300:645:130',  # Start
    '--click', '1500:326:272',  # Normal diff
    '--click', '1600:565:385',  # OK
    '--click', '3700:670:42',   # Skip intro
    '--click', '5200:108:175',  # Click Stage 1
    '--click', '5300:70:535',   # Skip cutscene 1 to tutorial
]

# Dismiss tutorial (both top and bottom buttons)
for f in range(5400, 6800, 40):
    args.extend(['--click', f'{f}:680:50'])
    args.extend(['--click', f'{f}:700:535'])

# Battle inputs frame 6800 to 12000:
for f in range(6800, 11000, 10):
    if f % 25 == 0:
        args.extend(['--key', f'{f}:49']) # Mouse unit
    if f % 20 == 0:
        args.extend(['--key', f'{f}:74']) # Mace punch
    if f % 30 == 0:
        args.extend(['--key', f'{f}:68']) # D walk right

# Take screenshots around level-up frames (do NOT dismiss levelup)
for f in range(8500, 10500, 200):
    args.extend(['--shot', f'{f}:shots/lvl_{f}.png'])

args.extend([
    '--quit-after', '10600',
    '--fast'
])

print("Running test_capture_levelup.py...")
res = subprocess.run(args, cwd='.')
print("Completed with exit code:", res.returncode)
