# Paladog Native Port (C++17 / SDL2)

Bản port C++ gốc (native port) chất lượng cao cho tựa game chiến thuật kinh điển **Paladog** (phát triển bởi FazeCat), chạy mượt mà 60 FPS trên cả **Máy tính PC (Windows)** và các dòng máy chơi game cầm tay **Linux ARM64 / Handheld (R36S, ArkOS, PortMaster, Anbernic RG351/RG353, Powkiddy)**.

Bản dựng hỗ trợ đầy đủ **Tiếng Việt** (Việt hóa trau chuốt, font vector sắc nét) và **Tiếng Anh** (bản PortMaster chuẩn quốc tế).

---

## 🌟 Điểm nổi bật (Features)

1. **Hiệu năng Native 60 FPS mượt mà:**
   - Biên dịch trực tiếp sang C++17 bằng SDL2, SDL2_image, SDL2_mixer, SDL2_ttf.
   - Hoàn toàn loại bỏ Flash Player / Ruffle, tiêu thụ rất ít RAM (~150MB), khởi động tức thì.
2. **Hỗ trợ đầy đủ thiết bị cầm tay (Handheld / PortMaster):**
   - Điều khiển mượt mà bằng D-Pad, các phím A/B/X/Y, L1/R1.
   - Hỗ trợ đổi làn lính ở chế độ Thủ thành (Defense / War Road) bằng D-Pad Lên / Xuống.
   - Hệ thống chọn thẻ nâng cấp kĩ năng bằng D-Pad Trái / Phải không cần chạm chuột.
   - Giao diện HUD và màn hình hướng dẫn tùy biến riêng cho layout tay cầm cầm tay.
3. **Bản PC độc lập (Vanilla PC):**
   - Giữ nguyên trải nghiệm kinh điển: Di chuyển bằng phím [A]/[D], tung phép bằng [J]/[K]/[L], triệu hồi lính [1]-[9], thao tác menu bằng Chuột.
   - Không chứa các nhãn nút bấm của tay cầm R36S.
4. **Hỗ trợ song ngữ (Vietnamese & English):**
   - **Bản Tiếng Việt:** Toàn bộ cốt truyện, hội thoại, tên và mô tả trang bị, kĩ năng, nhiệm vụ được dịch hoàn chỉnh, font chữ rõ ràng không bị răng cưa.
   - **Bản Tiếng Anh:** Đồ họa và văn bản tiếng Anh gốc của FazeCat, đóng gói theo chuẩn PortMaster.

---

## 🎮 Hướng dẫn điều khiển (Controls)

### 1. Máy cầm tay Handheld (R36S / ArkOS / PortMaster)

| Nút bấm | Chức năng trong trận đấu | Chức năng trong Menu / Cửa hàng |
| :--- | :--- | :--- |
| **D-Pad Trái / Phải** | Di chuyển Paladog qua lại | Chọn nâng cấp, đổi thẻ kỹ năng khi lên cấp |
| **D-Pad Lên / Xuống** | Đổi làn xuất quân (màn War Road / Thủ thành) | Di chuyển chọn lựa |
| **Nút [A]** | Xuất quân lính đang chọn | Xác nhận / Mua / Chọn màn / Tiếp tục |
| **Nút [B]** | Phép thuật 3 (Gậy 3) | Quay lại (Back) / Hủy bỏ |
| **Nút [X]** | Phép thuật 1 (Gậy 1) | Bấm để Nâng cấp trong Sách |
| **Nút [Y]** | Phép thuật 2 (Gậy 2) | — |
| **Phím [L1] / [R1]** | Chuyển đổi chọn giữa các loại quân lính | Chuyển tab giữa Cửa hàng và Trang bị tướng |
| **Nút [START]** | Tạm dừng trận đấu (Pause Menu) | — |

### 2. Máy tính PC (Keyboard & Mouse)

| Phím bấm | Chức năng |
| :--- | :--- |
| **[A] / [D]** | Di chuyển Paladog sang Trái / Phải |
| **[J], [K], [L]** | Sử dụng Phép thuật tương ứng với Gậy 1, 2, 3 |
| **[1] đến [9]** | Triệu hồi trực tiếp các đơn vị quân lính từ 1 đến 9 |
| **[ESC]** | Tạm dừng (Pause game) |
| **Chuột trái** | Click chọn menu, chọn màn, mua bán trong cửa hàng |

---

## 📦 Cấu trúc các bản dựng (Releases)

Dự án cung cấp sẵn 3 gói phát hành độc lập:

1. **`Paladog_PortMaster_EN.zip`** *(hoặc `paladog.zip`)*:
   - Dành cho hệ máy cầm tay cài đặt PortMaster.
   - Gồm script khởi chạy `Paladog.sh`, file metadata `port.json`, ảnh đại diện `cover.png`, `screenshot.png` và thư mục game `paladog/` tiếng Anh.
2. **`Paladog_VN_R36S.zip`**:
   - Dành cho máy R36S / ArkOS tiếng Việt.
   - Chép file `Paladog.sh` và thư mục `paladog/` vào `/roms/ports/` (hoặc `/roms2/ports/`) là chơi ngay.
3. **`Paladog_PC_VN.zip`**:
   - Dành cho máy tính Windows tiếng Việt.
   - Thư mục giải nén `Paladog_PC/` có sẵn file `Paladog.exe` cùng toàn bộ 49 file DLL SDL2 phụ thuộc, chạy ngay không cần cài đặt thêm phần mềm nào.

---

## 🛠 Hướng dẫn biên dịch từ mã nguồn (Build from Source)

### 1. Chuẩn bị môi trường (Prerequisites)

- **Hệ điều hành:** Windows (với MSYS2 MinGW-w64) hoặc Linux x86_64 / aarch64.
- **Thư viện:** `SDL2`, `SDL2_image`, `SDL2_mixer`, `SDL2_ttf`.
- **Python:** Python 3.8+ (kèm thư viện `Pillow` để xử lý atlas đồ họa).
- **Trình biên dịch chéo ARM64 (cho máy cầm tay):** Zig 0.13.0 (được cấu hình sẵn trong `native_port/tools/fetch_arm64_sdl.py`).

### 2. Các lệnh biên dịch

Mở terminal trong thư mục `native_port/`:

* **Biên dịch bản Windows (Handheld/PC chung):**
  ```bash
  mingw32-make -j8
  ```
  File thực thi tạo tại `native_port/build/paladog.exe`.

* **Đóng gói bản PC Vanilla độc lập (Full DLLs):**
  ```bash
  python native_port/tools/build_pc_vanilla.py
  ```
  Tạo bản hoàn chỉnh tại `native_port/dist/Paladog_PC/` và nén thành `Paladog_PC_VN.zip`.

* **Đóng gói bản R36S / ArkOS Tiếng Việt:**
  ```powershell
  powershell -ExecutionPolicy Bypass -File native_port/tools/package_r36s.ps1
  ```
  Tạo gói nén `Paladog_VN_R36S.zip`.

* **Đóng gói bản PortMaster Tiếng Anh:**
  ```bash
  python native_port/tools/package_portmaster_en.py
  ```
  Tạo gói nén `Paladog_PortMaster_EN.zip` và `paladog.zip`.

---

## 📁 Cấu trúc thư mục dự án

```text
Paladog/
├── assets/                  # Tài nguyên game gốc
├── extracted/               # Dữ liệu trích xuất từ Flash SWF gốc
├── native_port/             # Mã nguồn C++ Native Port
│   ├── assets/              # Tài nguyên atlases, âm thanh, data nhị phân
│   ├── package/             # Script launcher PortMaster (Paladog.sh, README)
│   ├── src/                 # Mã nguồn C++
│   │   ├── engine/          # Audio, đồ họa Gfx, văn bản Text
│   │   ├── game/            # Game logic, Library wrapper, UI Overlay
│   │   ├── gen/             # Lớp AS3 chuyển tự động sang C++
│   │   ├── runtime/         # Mô phỏng kiểu dữ liệu AS3 (Array, Object)
│   │   ├── main.cpp         # Vòng lặp chính & xử lý input tay cầm
│   │   └── main_pc.cpp      # Vòng lặp chính cho bản bàn phím & chuột
│   ├── tools/               # Bộ công cụ build & đóng gói tự động
│   └── Makefile             # Makefile đa nền tảng (Windows & aarch64)
├── .gitignore               # Cấu hình bỏ qua file rác / build
└── README.md                # Tài liệu hướng dẫn dự án
```

---

## 📜 Bản quyền & Lời cảm ơn (Credits & Disclaimer)

- Trò chơi gốc **Paladog** thuộc bản quyền của **FazeCat Co., Ltd.**
- Dự án này là một bản port mã nguồn mở nhằm mục đích bảo tồn và phục vụ cộng đồng đam mê trò chơi trên các hệ máy cổ điển/cầm tay.
- Bản dịch Tiếng Việt và tối ưu hóa hệ thống tay cầm thực hiện bởi **hoangnq07**.
