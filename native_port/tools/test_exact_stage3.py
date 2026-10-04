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
# Frame 1050: Click CHƠI
# Frame 1450: Click Slot 1
# Frame 1600: Click START
# Frame 1800+: On Map! Click Stage 3 at (326, 175)
args_destiny = [
    exe,
    '--click', '1050:110:490',  # CHƠI
    '--click', '1450:480:160',  # Slot 1
    '--click', '1600:645:130',  # START
    '--shot', f'1750:{shots_dir}/debug_map.png',
    # Click Stage 3
    '--click', '1850:326:175',
    '--click', '1900:326:175',
    # Skip cutscene if any
    '--click', '2000:70:535',
    '--click', '2050:70:535',
    '--click', '2100:680:50',
    '--click', '2150:680:50',
    # Gameplay in Stage 3:
    '--pad', '2300:9:1',       # L1 (ensures showPad=true)
    '--pad', '2305:9:0',
    '--shot', f'2400:{shots_dir}/verify_stage3_slot0.png',
    '--pad', '2450:10:1',      # R1 (moves to next slot)
    '--pad', '2455:10:0',
    '--shot', f'2550:{shots_dir}/verify_stage3_slot1.png',
    '--shot', f'2700:{shots_dir}/verify_stage3_conveyor.png',
    '--quit-after', '2800',
    '--fast'
]

print("Running Stage 3 Destiny test...")
res1 = subprocess.run(args_destiny, cwd='native_port')
print("Destiny exit code:", res1.returncode)

if os.path.exists(bak_sol):
    shutil.copyfile(bak_sol, game_sol)
    os.remove(bak_sol)
