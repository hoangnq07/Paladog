import os
import subprocess

exe = os.path.abspath('native_port/build/paladog.exe')
args = [
    exe,
    '--click', '1000:110:490',  # PLAY
    '--click', '1200:645:130',  # Slot 1 BẮT ĐẦU
    '--click', '1350:410:385',  # Click "CÓ" on confirmation popup
    '--click', '1500:271:270',  # Normal difficulty
    '--click', '1650:565:385',  # OK
    
    # Intro Scenes
    '--shot', '1800:shots/intro_fresh_s15.png',
    '--shot', '2100:shots/intro_fresh_s17.png',
    '--shot', '2500:shots/intro_fresh_s19.png',
    '--shot', '2900:shots/intro_fresh_s21.png',
    '--shot', '3300:shots/intro_fresh_s23.png',
    '--shot', '3800:shots/intro_fresh_s24.png',
    '--shot', '4400:shots/intro_fresh_s26.png',
    
    # Dismiss / Skip Intro
    '--click', '4700:670:42',
    
    # Stage 1
    '--click', '5300:108:175',
    '--shot', '5450:shots/cutscene1_pig_fresh.png',
    
    '--quit-after', '5600',
    '--fast'
]

print("Running test_fresh_game.py...")
res = subprocess.run(args, cwd='native_port')
print("Completed with exit code:", res.returncode)
