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

with open(game_sol, 'rb') as f:
    data = bytearray(f.read())

ints = [struct.unpack('<i', data[i:i+4])[0] for i in range(0, len(data), 4)]
ints[17] = 0
ints[19] = 1
ints[20] = 12
ints[21] = 12
new_data = bytearray()
for val in ints:
    new_data.extend(struct.pack('<i', val))
with open(game_sol, 'wb') as f:
    f.write(new_data)

exe = os.path.abspath('native_port/build/paladog.exe')

args = [
    exe,
    '--click', '300:110:490',   # PLAY
]

# Click Slot 1 repeatedly from 500 to 700
for f in range(500, 750, 40):
    args.extend(['--click', f'{f}:480:160'])

# Click START repeatedly from 750 to 1100
for f in range(750, 1100, 40):
    args.extend(['--click', f'{f}:645:130'])

# Click Stage 3 on Map repeatedly from 1150 to 1500
for f in range(1150, 1500, 40):
    args.extend(['--click', f'{f}:326:176'])

# Dismiss cutscenes / tutorials from 1500 to 2200
for f in range(1500, 2200, 30):
    args.extend(['--click', f'{f}:680:50', '--click', f'{f+10}:70:535'])

# In gameplay around frame 2400:
# Press L1/R1 to ensure showPad=true
args.extend([
    '--pad', '2300:9:1',
    '--pad', '2305:9:0',
    '--shot', f'2400:{shots_dir}/stage3_gameplay_sel0.png',
    '--pad', '2450:10:1',      # R1 to move selection to slot 1
    '--pad', '2455:10:0',
    '--shot', f'2550:{shots_dir}/stage3_gameplay_sel1.png',
    '--shot', f'2700:{shots_dir}/stage3_gameplay_cards.png',
    '--quit-after', '2800',
    '--fast'
])

print("Running test_stage3_simple.py...")
res = subprocess.run(args, cwd='native_port')
print("Finished with returncode:", res.returncode)

if os.path.exists(bak_sol):
    shutil.copyfile(bak_sol, game_sol)
    os.remove(bak_sol)
