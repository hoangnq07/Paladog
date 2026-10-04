import os
import subprocess

exe = os.path.abspath('native_port/build/paladog.exe')
shots_dir = os.path.abspath('native_port/shots')
os.makedirs(shots_dir, exist_ok=True)

args = [
    exe,
    # 1. Title Screen (around frame 950)
    '--shot', f'950:{shots_dir}/ui_01_title_play.png',
    
    # Click PLAY button
    '--click', '1050:110:490',
    
    # 2. Slot Menu (around frame 1350)
    '--shot', f'1350:{shots_dir}/ui_02_slot_menu.png',
    
    # Click Slot 1
    '--click', '1450:480:160',
    
    # Click START / NEW GAME
    '--click', '1600:645:130',
    
    # 3. Difficulty selection or Delete Confirm popup
    '--shot', f'1750:{shots_dir}/ui_03_diff_select.png',
    
    # Choose Normal difficulty and click OK
    '--click', '1850:271:270', # Normal diff
    '--click', '1950:565:385', # OK button (BẮT ĐẦU / ĐỒNG Ý)
    
    # Skip cutscene
    '--click', '2500:670:42',
    '--click', '3000:670:42',
    '--click', '3500:670:42',
    '--click', '4000:670:42',
    
    # 4. Stage Select Map
    '--shot', f'4800:{shots_dir}/ui_04_stageselect_map.png',
    
    # Click Upgrade button at (85, 520)
    '--click', '5000:85:520',
    
    # 5. Store / Upgrade Book
    '--shot', f'5400:{shots_dir}/ui_05_upgrade_book.png',
    
    # Click STORE tab at (180, 520)
    '--click', '5600:260:520',
    '--shot', f'5800:{shots_dir}/ui_06_store_tab.png',
    
    '--quit-after', '6000',
    '--fast'
]

print("Running test_ui_render.py with updated timings...")
res = subprocess.run(args, cwd='native_port')
print("Completed with exit code:", res.returncode)
