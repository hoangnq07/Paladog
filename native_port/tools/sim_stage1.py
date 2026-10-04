import os
import subprocess

exe = os.path.abspath('native_port/build/paladog.exe')
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

# Spam dismiss tutorial
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

# Level-up choices if any pop up:
for f in range(8000, 13000, 150):
    args.extend(['--click', f'{f}:380:300'])

# Stage Clear "TIẾP" button is at x=551, y=472:
for f in range(13000, 16000, 100):
    args.extend(['--click', f'{f}:551:472'])

# Stage Select with Stage 2 unlocked at frame 16500:
# Click Upgrade (NÂNG CẤP) button at (85, 520) at frame 17000:
args.extend([
    '--shot', '16500:shots/map_stage2_unlocked.png',
    '--click', '17000:85:520',
    '--shot', '17800:shots/upgrade_menu.png',
    '--quit-after', '18500',
    '--fast'
])

print(f"Launching Stage 1 -> Clear -> Stage 2 & Upgrade test...")
res = subprocess.run(args, cwd='native_port')
print("Completed with exit code:", res.returncode)
