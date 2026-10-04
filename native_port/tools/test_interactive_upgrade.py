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
    '--click', '5400:70:535',
]

# Dismiss in-battle tutorial
for f in range(5500, 6800, 50):
    if f % 100 == 0:
        args.extend(['--click', f'{f}:680:50'])
    else:
        args.extend(['--click', f'{f}:680:520'])

# Battle inputs frame 6800 to 14000:
for f in range(6800, 14000, 10):
    if f % 25 == 0:
        args.extend(['--key', f'{f}:49']) # Mouse
    if f % 20 == 0:
        args.extend(['--key', f'{f}:74']) # Mace punch
    if f % 30 == 0:
        args.extend(['--key', f'{f}:68']) # D walk right

# Level-up: take shot at frame 9800
args.extend([
    '--shot', '9800:shots/levelup_card_glow.png',
])

# Level-up choices:
for f in range(8000, 13000, 150):
    args.extend(['--click', f'{f}:380:300'])

# Stage Clear "TIẾP" button:
for f in range(13000, 16000, 100):
    args.extend(['--click', f'{f}:551:472'])

# Stage Select with Stage 2 unlocked:
# Click Upgrade (NÂNG CẤP) button at (85, 520) at frame 17000:
args.extend([
    '--click', '17000:85:520',
])

# Dismiss upgrade tutorial slide at (710, 535) or with Controller button A
for f in range(17400, 18200, 50):
    args.extend(['--click', f'{f}:710:535'])

# Now in Scene 200 (Unit Upgrade Book)!
# Take screenshot of selected unit 0 with glowing cyan border and [X] NÂNG CẤP prompt:
args.extend([
    '--shot', '18500:shots/unit_upgrade_scene200.png',
    '--quit-after', '18800',
    '--fast'
])

print("Running test_interactive_upgrade.py...")
res = subprocess.run(args, cwd='.')
print("Completed with exit code:", res.returncode)
