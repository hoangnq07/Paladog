import struct
import os

appdata = os.environ.get('APPDATA', '')
for name in ['paladog_game0.sol', 'paladog_slot0.sol', 'paladog_option.sol']:
    path = os.path.join(appdata, 'paladog', 'paladog-vn', name)
    if os.path.exists(path):
        with open(path, "rb") as f:
            data = f.read()
        ints = [struct.unpack("<i", data[i:i+4])[0] for i in range(0, len(data), 4)]
        print(f"{name} ({len(ints)} ints):", ints[:12])
    else:
        print(f"{name}: not found")
