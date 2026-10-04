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
    
    # Capture Intro text around frame 2500
    '--shot', '2500:shots/intro_natural.png',
    '--click', '3700:670:42',   # Skip intro
    
    # Stage 1
    '--click', '5200:108:175',  # Click Stage 1
    
    # Capture Cutscene 1 dialogue at frame 5280
    '--shot', '5280:shots/cutscene1_natural.png',
    
    '--click', '5350:70:535',   # Skip cutscene
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

# Level-up choices:
for f in range(8000, 13000, 150):
    args.extend(['--click', f'{f}:380:300'])

# Stage Clear "TIẾP" button (x=551, y=472):
for f in range(13000, 16000, 100):
    args.extend(['--click', f'{f}:551:472'])

# Map Stage 2 unlocked at frame 16500:
# Click Upgrade (NÂNG CẤP) button at (85, 520) at frame 17000:
args.extend([
    '--shot', '16500:shots/map_stage2_unlocked.png',
    '--click', '17000:85:520',
    '--shot', '17800:shots/upgrade_menu_vn.png',
])

# Dismiss upgrade tutorial hand tooltip:
for f in range(18000, 19000, 60):
    args.extend(['--click', f'{f}:700:530'])

# Navigate: Case 200 -> Case 300 -> Case 400 -> Case 100 (Map):
# Top-right button is at (680, 30):
args.extend([
    '--click', '19200:680:30', # to Store
    '--click', '19600:680:30', # to Inven
    '--click', '20000:680:30', # to Stage Select Map
    
    # On map: Click Stage 2 (x=220, y=175)
    '--shot', '20400:shots/map_stage2_ready.png',
    '--click', '20600:220:175',
    '--click', '20800:220:175',
])

# Battle inputs for Stage 2 (frames 21000 - 25000):
for f in range(21000, 25000, 10):
    if f % 20 == 0:
        args.extend(['--key', f'{f}:49']) # Mouse
    if f % 15 == 0:
        args.extend(['--key', f'{f}:74']) # Mace punch
    if f % 25 == 0:
        args.extend(['--key', f'{f}:68']) # D walk right
    if f % 100 == 0:
        args.extend(['--click', f'{f}:380:300']) # level-up choice

args.extend([
    '--shot', '23000:shots/stage2_battle.png',
    '--quit-after', '25000',
    '--fast'
])

print(f"Launching full simulation (Intro -> Stage 1 -> Clear -> Upgrade VN -> Stage 2)...")
res = subprocess.run(args, cwd='native_port')
print("Completed with exit code:", res.returncode)
