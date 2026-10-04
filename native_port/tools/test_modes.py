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

# 1. Backup save
if os.path.exists(game_sol):
    shutil.copyfile(game_sol, bak_sol)

# 2. Modify save to unlock all stages (nClearStage=12, nRealClearStage=12)
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

# ----------------- STAGE 3 (DESTINY) -----------------
args_destiny = [
    exe,
    '--click', '200:110:490',   # PLAY
    '--click', '400:480:160',   # Slot 1
    '--click', '550:645:130',   # START
    # On map: click Stage 3 at (326, 176)
    '--click', '800:326:176',
]
# Dismiss dialogs/tutorial
for f in range(900, 1400, 40):
    args_destiny.extend(['--click', f'{f}:680:50', '--click', f'{f+10}:70:535'])

# Simulate pad input so showPad=true
args_destiny.extend([
    '--pad', '1500:9:1',       # L1
    '--pad', '1505:9:0',
    '--shot', f'1600:{shots_dir}/test_stage3_destiny.png',
    '--pad', '1610:10:1',      # R1 to move selection to slot 1
    '--pad', '1615:10:0',
    '--shot', f'1650:{shots_dir}/test_stage3_destiny_r1.png',
    '--quit-after', '1700',
    '--fast'
])

print("Running Stage 3 Destiny test...")
res1 = subprocess.run(args_destiny, cwd='native_port')
print("Stage 3 completed with returncode:", res1.returncode)

# ----------------- STAGE 9 (WARROAD) -----------------
args_warroad = [
    exe,
    '--click', '200:110:490',   # PLAY
    '--click', '400:480:160',   # Slot 1
    '--click', '550:645:130',   # START
    # On map: click Stage 9 at (326, 259)
    '--click', '800:326:259',
]
# Dismiss dialogs/tutorial
for f in range(900, 1400, 40):
    args_warroad.extend(['--click', f'{f}:680:50', '--click', f'{f+10}:70:535'])

args_warroad.extend([
    '--pad', '1500:9:1',       # L1
    '--pad', '1505:9:0',
    # 1. Capture unit selection at bottom y=470
    '--shot', f'1600:{shots_dir}/test_warroad_unit_sel.png',
    # 2. Pick unit with button A
    '--pad', '1620:0:1',       # A
    '--pad', '1625:0:0',
    # Capture lane highlight on default lane (Lane 3 / index 2)
    '--shot', f'1650:{shots_dir}/test_warroad_lane_default.png',
    # 3. Move lane UP with D-pad UP
    '--pad', '1670:11:1',      # DPAD_UP
    '--pad', '1675:11:0',
    '--shot', f'1700:{shots_dir}/test_warroad_lane_up.png',
    # 4. Deploy with button A
    '--pad', '1720:0:1',       # A
    '--pad', '1725:0:0',
    '--shot', f'1760:{shots_dir}/test_warroad_deployed.png',
    '--quit-after', '1800',
    '--fast'
])

print("Running Stage 9 WarRoad test...")
res2 = subprocess.run(args_warroad, cwd='native_port')
print("Stage 9 completed with returncode:", res2.returncode)

# Restore backup
if os.path.exists(bak_sol):
    shutil.copyfile(bak_sol, game_sol)
    os.remove(bak_sol)
print("Save file restored.")
