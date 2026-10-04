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
    '--shot',  '5450:shots/tutorial_handheld_1.png',
    '--click', '5600:680:50',   # Next tutorial slide
    '--shot',  '5700:shots/tutorial_handheld_2.png',
    '--click', '5850:680:50',   # Next tutorial slide
    '--shot',  '5950:shots/tutorial_handheld_3.png',
]

# Dismiss remaining tutorial slides
for f in range(6000, 6800, 50):
    args.extend(['--click', f'{f}:680:50'])

# Battle inputs frame 6800 to 14000:
for f in range(6800, 14000, 10):
    if f % 25 == 0:
        args.extend(['--key', f'{f}:49']) # Mouse unit
    if f % 20 == 0:
        args.extend(['--key', f'{f}:74']) # Mace punch
    if f % 30 == 0:
        args.extend(['--key', f'{f}:68']) # D walk right

# Level-up screenshot around frame 9200 and 10000:
args.extend([
    '--shot', '9500:shots/battle_levelup_test.png',
])

# Level-up choices if any pop up:
for f in range(9600, 13000, 150):
    args.extend(['--key', f'{f}:49']) # choose card 1

# Stage Clear "TIẾP" button:
for f in range(13000, 16000, 100):
    args.extend(['--click', f'{f}:551:472'])

# Stage Select: Click Upgrade button at (85, 520) at frame 17000
args.extend([
    '--click', '17000:85:520',
    '--shot', '17800:shots/upgrade_menu_with_glow.png',
    '--quit-after', '18200',
    '--fast'
])

print("Running test_verify_handheld.py...")
res = subprocess.run(args, cwd='.')
print("Completed with exit code:", res.returncode)
