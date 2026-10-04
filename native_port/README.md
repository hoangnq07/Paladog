# Paladog native (C++ / SDL2)

Bản port native của Paladog (bản Flash Việt hoá) cho PC và máy cầm tay R36S (ArkOS).
Không dùng Flash Player/Ruffle: đồ hoạ, âm thanh, animation được dựng lại bằng SDL2,
logic game được dịch từ ActionScript đã decompile (`extracted/scripts`).

## Trạng thái

| Phần | Tình trạng |
|---|---|
| Engine (Gfx: Matrix/alpha/ADD/tint/clip, back buffer 760x570 4:3) | ✅ |
| Âm thanh (SDL_mixer, 6 nhạc + 123 hiệu ứng, 26 kênh xoay vòng) | ✅ |
| Library.as (drawImg*, drawASEAni*, drawNumImg, drawString*, sound, loader) | ✅ port 1:1 |
| Luồng khởi động: logo → loading → title animation → màn hình tiêu đề | ✅ |
| DB loaders (stage/unit/enemy/destiny/…) | ⏳ |
| Drawing.as (menu, stage select, gameplay, store…), Operation.as, Player.as | ⏳ dịch bằng transpiler AS3→C++ |
| TouchAction.as / KeyAction.as + con trỏ ảo cho gamepad | ⏳ |
| Lưu game (option/slot/game) | ⏳ |
| Đóng gói PortMaster cho R36S | ⏳ |

## Build trên Windows (MSYS2 mingw64)

```powershell
$env:PATH = "C:\msys64\mingw64\bin;C:\msys64\usr\bin;" + $env:PATH
mingw32-make -j8            # -> build/paladog.exe  (RELEASE=1 để ẩn console)
.\build\paladog.exe          # F11 / Alt+Enter: toàn màn hình, F12: chụp màn hình
```

Gói cần: `mingw-w64-x86_64-{gcc,SDL2,SDL2_image,SDL2_mixer,SDL2_ttf,pkgconf,make}`.

## Build cho R36S / Linux aarch64

```sh
sudo apt install g++ make pkg-config libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev
make -j4 HANDHELD=1          # mặc định toàn màn hình
```

## Tuỳ chọn dòng lệnh (kiểm thử tự động)

- `--shot FRAME:file.png` chụp back buffer ở frame chỉ định (lặp được nhiều lần)
- `--key FRAME:KEYCODE` giả lập phím (mã phím Flash, vd 13 = Enter)
- `--quit-after N`, `--fullscreen`, `--windowed`
- Log ghi ra `paladog.log`

## Điều khiển gamepad (dự kiến)

| Nút | Phím Flash |
|---|---|
| D-pad / cần trái | ← → (di chuyển) |
| A / Start | Enter |
| B / Select | Esc |
| X / Y / R1 | J / K / L (chiêu chuỳ) |
| L1 | 1 (lính) — sẽ đổi thành chọn vòng lính 1–9 |
| Select + Start | Thoát |

## Cấu trúc

- `src/engine/` – Flash runtime tối giản (Matrix, ColorTransform presets), SDL renderer, audio, text
- `src/game/lib.*` – port Library.as
- `src/game/game.*` – port Drawing.as (đang làm)
- `src/generated/constants.h` – hằng số/bảng sinh tự động bởi `tools/gen_constants.py`
- `assets/` – sinh bởi `../export_native_assets.py`
