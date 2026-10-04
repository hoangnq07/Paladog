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
    ints[30] = 0; ints[31] = 0; ints[32] = 0; ints[33] = 12; ints[34] = 12
    new_data = bytearray()
    for val in ints:
        new_data.extend(struct.pack('<i', val))
    with open(game_sol, 'wb') as f:
        f.write(new_data)

exe = os.path.abspath('native_port/build/paladog.exe')

args = [
    exe,
    '--click', '1050:110:490',  # PLAY
    '--click', '1450:480:160',  # Slot 1
    '--click', '1600:645:130',  # Start
    
    # Click Stage 9 at (326, 259)
    '--click', '1850:326:259',
    '--click', '1900:326:259',
    '--click', '2000:271:270',  # Normal
    '--click', '2050:565:385',  # OK
]

# Dismiss popups and tutorial slides reliably between frame 2200 and 3900
for f in range(2200, 4000, 80):
    args.extend(['--click', f'{f}:680:50'])
    args.extend(['--pad', f'{f+20}:0:1', '--pad', f'{f+25}:0:0']) # A

# Gameplay starts around frame 4100
args.extend([
    # Enable pad mode with R1 then L1 so pd.sel stays 0
    '--pad', '4100:10:1',       # R1 -> sel = 1
    '--pad', '4105:10:0',
    '--pad', '4120:9:1',        # L1 -> sel = 0 (Mouse unit!)
    '--pad', '4125:9:0',
    
    # 1. Capture unit selector on Mouse (slot 0) at y=470
    '--shot', f'4200:{shots_dir}/verify_warroad_mouse_selected.png',
    
    # 2. Pick Mouse unit with button A
    '--pad', '4250:0:1',        # A
    '--pad', '4255:0:0',
    # Capture default Lane 3 (middle road)
    '--shot', f'4350:{shots_dir}/verify_warroad_lane3.png',
    
    # 3. Move lane UP with DPAD_UP (button 11)
    '--pad', '4400:11:1',       # DPAD_UP
    '--pad', '4405:11:0',
    # Capture Lane 2
    '--shot', f'4500:{shots_dir}/verify_warroad_lane2.png',
    
    # 4. Move lane UP again to Lane 1
    '--pad', '4550:11:1',       # DPAD_UP
    '--pad', '4555:11:0',
    # Capture Lane 1
    '--shot', f'4650:{shots_dir}/verify_warroad_lane1.png',
    
    # 5. Confirm deploy to Lane 1 with button A
    '--pad', '4700:0:1',        # A (deploy to lane)
    '--pad', '4705:0:0',
    # Capture after deploy
    '--shot', f'4850:{shots_dir}/verify_warroad_deployed_lane1.png',
    
    '--quit-after', '4950',
    '--fast'
])

print("Running WarRoad verification...")
res = subprocess.run(args, cwd='native_port')
print("Finished with returncode:", res.returncode)

if os.path.exists(bak_sol):
    shutil.copyfile(bak_sol, game_sol)
    os.remove(bak_sol)
