import os
import shutil
import struct
import subprocess

appdata = os.environ.get('APPDATA', '')
save_dir = os.path.join(appdata, 'paladog', 'paladog-vn')
game_sol = os.path.join(save_dir, 'paladog_game0.sol')
bak_sol = os.path.join(save_dir, 'paladog_game0.sol.bak')
shots_dir = os.path.abspath('native_port/shots')
os.makedirs(shots_dir, exist_ok=True)

if os.path.exists(game_sol):
    shutil.copyfile(game_sol, bak_sol)

# Unlock stages 1..12 in slot 0
with open(game_sol, 'rb') as f:
    data = bytearray(f.read())

ints = [struct.unpack('<i', data[i:i+4])[0] for i in range(0, len(data), 4)]
ints[17] = 0   # Chapter 1 (0-indexed)
ints[19] = 1   # nClearChapter
ints[20] = 12  # nClearStage
ints[21] = 12  # nRealClearStage

new_data = bytearray()
for val in ints:
    new_data.extend(struct.pack('<i', val))
with open(game_sol, 'wb') as f:
    f.write(new_data)

exe = os.path.abspath('native_port/build/paladog.exe')

# ----------------- TEST 1: STAGE 3 (DESTINY) -----------------
args_destiny = [
    exe,
    '--click', '1050:110:490',  # PLAY
    '--click', '1450:480:160',  # Slot 1
    '--click', '1600:645:130',  # Start
    '--click', '1850:271:270',  # Normal diff if popup
    '--click', '1950:565:385',  # OK
    
    # Skip cutscenes if any
    '--click', '2500:670:42',
    '--click', '3000:670:42',
    '--click', '3500:670:42',
    '--click', '4000:670:42',
    
    # Click Stage 3 on Map at (326, 175)
    '--click', '5000:326:175',
    '--click', '5200:326:175',
    
    # Skip cutscene/tutorial
    '--click', '5300:70:535',
    '--click', '5400:70:535',
]

for f in range(5500, 6800, 50):
    args_destiny.extend(['--click', f'{f}:680:50'])

# Activate gamepad mode
args_destiny.extend([
    '--pad', '6850:9:1',       # L1
    '--pad', '6855:9:0',
    # Capture Stage 3 with unit selector at y=431 on slot 0
    '--shot', f'6900:{shots_dir}/verify_stage3_destiny_slot0.png',
    # Move to slot 1 with R1
    '--pad', '7000:10:1',      # R1
    '--pad', '7005:10:0',
    '--shot', f'7100:{shots_dir}/verify_stage3_destiny_slot1.png',
    '--quit-after', '7200',
    '--fast'
])

print("Running Destiny test...")
res1 = subprocess.run(args_destiny, cwd='native_port')
print("Destiny finished:", res1.returncode)

# ----------------- TEST 2: STAGE 9 (WARROAD) -----------------
args_warroad = [
    exe,
    '--click', '1050:110:490',  # PLAY
    '--click', '1450:480:160',  # Slot 1
    '--click', '1600:645:130',  # Start
    '--click', '1850:271:270',  # Normal diff if popup
    '--click', '1950:565:385',  # OK
    
    # Skip cutscenes if any
    '--click', '2500:670:42',
    '--click', '3000:670:42',
    '--click', '3500:670:42',
    '--click', '4000:670:42',
    
    # Click Stage 9 on Map at (326, 259)
    '--click', '5000:326:259',
    '--click', '5200:326:259',
    
    # Skip cutscene/tutorial
    '--click', '5300:70:535',
    '--click', '5400:70:535',
]

for f in range(5500, 6800, 50):
    args_warroad.extend(['--click', f'{f}:680:50'])

args_warroad.extend([
    '--pad', '6850:9:1',       # L1
    '--pad', '6855:9:0',
    # 1. Capture unit selector at y=470
    '--shot', f'6900:{shots_dir}/verify_warroad_unit_sel.png',
    # 2. Select unit 0 (Mouse) with button A
    '--pad', '6950:0:1',       # Button A (pick unit)
    '--pad', '6955:0:0',
    # Capture lane highlight on Lane 3 (default lane 2, index 2)
    '--shot', f'7050:{shots_dir}/verify_warroad_lane_default.png',
    # 3. Move lane UP with DPAD_UP (button 11)
    '--pad', '7100:11:1',      # DPAD_UP
    '--pad', '7105:11:0',
    # Capture lane highlight on Lane 2 (index 1)
    '--shot', f'7200:{shots_dir}/verify_warroad_lane_up.png',
    # 4. Confirm deploy with button A
    '--pad', '7250:0:1',       # Button A (deploy to lane)
    '--pad', '7255:0:0',
    '--shot', f'7350:{shots_dir}/verify_warroad_deployed.png',
    '--quit-after', '7450',
    '--fast'
])

print("Running WarRoad test...")
res2 = subprocess.run(args_warroad, cwd='native_port')
print("WarRoad finished:", res2.returncode)

if os.path.exists(bak_sol):
    shutil.copyfile(bak_sol, game_sol)
    os.remove(bak_sol)
print("Saved restored. Done.")
