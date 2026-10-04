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

# Level-up choices:
for f in range(8000, 13000, 150):
    args.extend(['--click', f'{f}:380:300'])

# Stage Clear "TIẾP" button:
for f in range(13000, 16000, 100):
    args.extend(['--click', f'{f}:551:472'])

# Stage Select: Click Upgrade button at (85, 520) at frame 17000:
args.extend(['--click', '17000:85:520'])

# Dismiss upgrade tutorial slide at (710, 535)
for f in range(17400, 18200, 50):
    args.extend(['--click', f'{f}:710:535'])

# In Scene 200 (Upgrade screen): Click Store button at (680, 30) at frame 18500
args.extend(['--click', '18500:680:30'])

# Dismiss store tutorial slide if present:
for f in range(18800, 19500, 50):
    args.extend(['--click', f'{f}:710:535'])

# Now in Scene 300 (Pig Store)!
# Click first store item at (45, 335) to display item description in speech bubble:
args.extend(['--click', '20000:45:335'])
args.extend(['--shot', '20500:native_port/shots/store_pig_item0.png'])

# Click second store item at (120, 335)
args.extend(['--click', '21000:120:335'])
args.extend(['--shot', '21500:native_port/shots/store_pig_item1.png'])

# Click Equip Store button at (680, 30) to go to Larva Equip Store (Scene 400)
args.extend(['--click', '22000:680:30'])
# Dismiss larva equip tutorial if any:
for f in range(22300, 23000, 50):
    args.extend(['--click', f'{f}:710:535'])

# In Scene 400 (Hero Equip / Larva store):
# Wait for Larva dialogue or click equip item:
args.extend(['--shot', '23500:native_port/shots/store_larva_dialog.png'])

# Click equip inventory item 0 at (35, 335) to show item details
args.extend(['--click', '24000:35:335'])
args.extend(['--shot', '24500:native_port/shots/store_larva_item0.png'])
args.extend(['--fast', '--quit-after', '25000'])

print("Launching Paladog store test...")
os.makedirs('native_port/shots', exist_ok=True)
p = subprocess.run(args, cwd='.', capture_output=True, text=True)
print("Return code:", p.returncode)
if p.stdout:
    print("STDOUT:", p.stdout[-500:])
if p.stderr:
    print("STDERR:", p.stderr[-500:])
