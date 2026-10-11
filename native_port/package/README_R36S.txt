PALADOG (Việt Hóa) - Bản Native C++ cho R36S / ArkOS (AArch64)

CÀI ĐẶT
  1. Chép file Paladog.sh và thư mục "paladog" vào thư mục /roms/ports (hoặc /roms2/ports) trên thẻ nhớ.
  2. Khởi động lại EmulationStation, vào mục Ports -> Paladog để chơi.
  Yêu cầu: ArkOS / PortMaster (đã có sẵn SDL2, SDL2_image, SDL2_mixer, SDL2_ttf).

ĐIỀU KHIỂN TRÊN R36S
  1. Trong trận đánh:
     - D-Pad ◄ ► / Cần Analog: Di chuyển hiệp sĩ Paladog
     - L1 / R1: Chọn ô lính (khung vàng đánh dấu ô lính)
     - [A]: Triệu hồi lính đang chọn
     - [X] / [Y] / [B]: Dùng phép thuật gậy phép 1, 2, 3
     - L2 / R2: Cuộn góc nhìn camera (Trái / Phải)
     - [START]: Tạm dừng trận đấu
     - SELECT + START: Thoát game (chuẩn PortMaster)

  2. Khi lên cấp trong trận (Màn hình chọn nâng cấp thẻ):
     - Thẻ đang chọn có VIỀN VÀNG PHÁT SÁNG cực kỳ rõ ràng
     - D-Pad ◄ ►: Chuyển chọn thẻ nâng cấp (Thẻ 1, 2, 3)
     - [A]: Xác nhận chọn thẻ đang có viền sáng
     - Phím tắt trực tiếp: [X] = Thẻ 1, [Y] = Thẻ 2, [B] = Thẻ 3
     - Cần Analog: Di chuyển chuột ảo (nếu muốn click chuột)

  3. Màn hình Nâng Cấp Lính (Sách Nâng Cấp):
     - Ô lính đang chọn có VIỀN XANH NGỌC PHÁT SÁNG trong lưới 3x3
     - D-Pad ◄ ► ▲ ▼: Di chuyển chọn giữa 9 ô lính
     - [X] hoặc [A]: Bấm NÂNG CẤP lính đang chọn (viền vàng ở nút nâng cấp)
     - [B] hoặc [L1]: Quay lại Bản Đồ (Map)
     - [R1]: Chuyển sang Cửa Hàng

  4. Màn hình Cửa Hàng (Store) - Bán / Mua không cần chuột:
     - Ô đồ đang chọn có khung xanh nổi bật mặc định của game
     - D-Pad ◄ ►: Duyệt chọn từng món đồ (tự động cuộn trang túi đồ mượt mà)
     - D-Pad ▲: Chuyển chọn lên kệ hàng Cửa Hàng
     - D-Pad ▼: Chuyển chọn xuống Túi đồ của bạn
     - [A]: BÁN (khi ở túi đồ) hoặc MUA (khi ở kệ shop) món đồ đang chọn (bấm [A] liên tục để dọn sạch túi cực nhanh)
     - [Y]: Tự động gom & Sắp xếp túi đồ (Sort)
     - L2 / R2: Lật trang trước / sau trong túi đồ
     - [L1] / [R1]: Chuyển sang Nâng Cấp Lính / Trang Bị Anh Hùng
     - [B]: Quay lại Bản Đồ (Map)

  5. Bản đồ & Menu & Cốt truyện & Qua Màn Boss (Chapter Clear):
     - D-Pad / Cần Analog: Di chuyển con trỏ chuột ảo (L1: chậm, R1: nhanh)
     - [A]: Chuột trái (chọn màn chơi, bấm nút)
     - [A] / [START] / [X]: Tiếp tục qua màn hình Chapter Clear & Cutscene truyện tranh & Ảnh kết thúc chương
     - [B]: Bỏ qua (Skip) truyện tranh / Quay lại
     - [X]: Mở nhanh Nâng Cấp Lính (tại màn hình Bản Đồ)

LƯU GAME
  Dữ liệu lưu tự động trong thư mục paladog/conf.
