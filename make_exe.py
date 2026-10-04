# -*- coding: utf-8 -*-
"""
Convert Paladog_VN.swf to a standalone Windows executable (Paladog_VN.exe)
using Adobe Flash Player Standalone Projector (clean 32.0.0.363 build, no timebomb).
"""
import os
import struct
import sys

def build_exe(player_path='tools/flashplayer_sa.exe', swf_path='Paladog_VN.swf', exe_path='Paladog_VN.exe'):
    if not os.path.exists(player_path):
        print(f"ERROR: {player_path} not found!")
        sys.exit(1)
        
    if not os.path.exists(swf_path):
        print(f"ERROR: {swf_path} not found!")
        sys.exit(1)
        
    print(f"Reading Projector base: {player_path}...")
    with open(player_path, 'rb') as f:
        player_data = f.read()
        
    print(f"Reading SWF: {swf_path}...")
    with open(swf_path, 'rb') as f:
        swf_data = f.read()
        
    # Adobe Flash Projector footer format:
    # 4 bytes magic (0xFA123456 little-endian: 56 34 12 FA)
    # 4 bytes SWF length (uint32 little-endian)
    magic = 0xFA123456
    swf_len = len(swf_data)
    footer = struct.pack('<II', magic, swf_len)
    
    total_data = player_data + swf_data + footer
    
    print(f"Writing {exe_path}...")
    with open(exe_path, 'wb') as f:
        f.write(total_data)
        
    exe_size = len(total_data)
    print(f"\n[OK] Successfully created {exe_path} ({exe_size:,} bytes)!")
    print(f"     - Flash Player Engine: {len(player_data):,} bytes")
    print(f"     - Game Data (SWF):     {swf_len:,} bytes")
    print(f"     - Projector Footer:    {len(footer)} bytes")

if __name__ == '__main__':
    build_exe()
