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
    ints[30] = 0   # nChapter = 0
    ints[31] = 0   # nStage = 0
    ints[32] = 0   # nClearChapter = 0
    ints[33] = 12  # nClearStage = 12
    ints[34] = 12  # nRealClearStage = 12
    new_data = bytearray()
    for val in ints:
        new_data.extend(struct.pack('<i', val))
    with open(game_sol, 'wb') as f:
        f.write(new_data)
    print("Updated paladog_game0.sol with nClearStage=12")

exe = os.path.abspath('native_port/build/paladog.exe')

args = [
    exe,
    '--click', '1050:110:490',  # PLAY
    '--click', '1450:480:160',  # Slot 1
    '--click', '1600:645:130',  # Start
    '--shot', f'1750:{shots_dir}/debug_map_stage3.png',
    
    # Click Stage 3 at (326, 175)
    '--click', '1850:326:175',
    '--click', '1900:326:175',
    '--click', '1950:326:175',
    
    # In case of difficulty dialog or cutscenes:
    '--click', '2000:271:270',  # Normal
    '--click', '2050:565:385',  # OK
    
    # Dismiss tutorial / cutscene
    '--click', '2150:680:50',
    '--click', '2200:680:50',
    '--click', '2250:680:50',
    '--click', '2300:680:50',
    '--click', '2350:680:50',
    '--click', '2400:680:50',
    '--click', '2450:680:50',
    '--click', '2500:680:50',
    
    # Also press pad A or Start to skip dialog
    '--pad', '2300:0:1',
    '--pad', '2305:0:0',
    '--pad', '2400:6:1',
    '--pad', '2405:6:0',
    
    # Frame 2600+: Gameplay in Stage 3
    # Activate pad overlay with L1
    '--pad', '2600:9:1',        # L1
    '--pad', '2605:9:0',
    '--shot', f'2700:{shots_dir}/stage3_destiny_slot0.png',
    
    # Move selection to slot 1 with R1
    '--pad', '2750:10:1',       # R1
    '--pad', '2755:10:0',
    '--shot', f'2850:{shots_dir}/stage3_destiny_slot1.png',
    
    # Move selection to slot 2 with R1
    '--pad', '2900:10:1',       # R1
    '--pad', '2905:10:0',
    '--shot', f'3000:{shots_dir}/stage3_destiny_slot2.png',
    
    '--quit-after', '3100',
    '--fast'
]

print("Running test...")
res = subprocess.run(args, cwd='native_port')
print("Finished with exit code:", res.returncode)

if os.path.exists(bak_sol):
    shutil.copyfile(bak_sol, game_sol)
    os.remove(bak_sol)
print("Save restored.")
