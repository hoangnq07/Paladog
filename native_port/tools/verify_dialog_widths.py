import sys
from PIL import ImageFont

sys.stdout.reconfigure(encoding='utf-8')
font = ImageFont.truetype('native_port/assets/fonts/BeVietnamPro-Bold.ttf', 20)

items = [
    # Cutscene 1 (Pig) x=210, balloon width ~330 (max r ~ 540)
    (210, "Cảm ơn bạn đã cứu tôi!"),
    (210, "Lũ quái vật bất ngờ tấn công"),
    (210, "khiến cả làng gặp nguy hiểm!"),
    (210, "Đằng sau có một tên trùm,"),
    (210, "hắn chỉ cần vung tay"),
    (210, "là tạo ra cả bầy quái vật!"),
    (210, "Tôi nghĩ hắn là tên trùm."),
    (210, "Xin hãy đánh bại chúng"),
    (210, "để cứu ngôi làng của chúng tôi!"),

    # Cutscene 2 (Mushroom)
    (320, "Cây nấm này sẽ cứu con tôi!!"),
    (375, "Ngứa chân muốn sút bóng quá!"),
    (160, "Cú sút của ta là đỉnh nhất!!"),
    (365, "Cảm ơn bạn rất nhiều!!"),
    (365, "Tôi vào Rừng Tối tìm nấm,"),
    (365, "suýt bị tên quái đá bóng tóm được!"),
    (370, "Cây cỏ ở đây là thuốc quý,"),
    (370, "nhưng vì quái vật quậy phá"),
    (370, "khiến nhiều người bệnh gặp nạn."),
    (380, "Xin hãy cứu lấy Rừng Tối!"),
    (380, "Tôi phải mang nấm về nhanh"),
    (380, "cho con của tôi đây."),
    (380, "Bạn nhớ cẩn thận nhé!"),

    # Cutscene 3 (Key)
    (320, "ĐƯỢC RỒI!!"),
    (320, "Tiến lên giành chiến thắng nào!"),
    (320, "Tôi nóng lòng xung trận lắm rồi!"),
    (240, "Quái lạ, hắn biến đâu mất rồi?!"),
    (315, "Còn chờ gì nữa!"),
    (315, "Mau đuổi theo lấy lại chìa khóa!!"),
    (197, "Đừng hòng!! Chìa khóa giờ là của ta!!"),
    (120, "Quái vật cướp mất chìa khóa rồi!!"),
    (310, "Muốn tới lâu đài Chúa Tể Hắc Ám,"),
    (310, "ngươi phải hạ ta trước đã!!"),
    (485, "Đói quá! Đói quá đi thôi!"),

    # Cutscene 4
    (90, "Tuyệt vời, đã lấy lại chìa khóa!"),
    (90, "Tiến vào lâu đài ngay thôi!!"),
    (125, "Ngươi sẽ phải đấu với bản sao bóng tối!"),
    (125, "Xem ngươi có tự thắng nổi mình không!"),
    (150, "Băng qua hang động đằng kia là"),
    (150, "đường tắt tới Lâu Đài Hắc Ám."),
    (310, "Nhưng từ trước khi có chiến tranh,"),
    (310, "trong hang đã đầy quái vật rồi!!"),
    (290, "Bất kể con quái nào xuất hiện,"),
    (290, "ta nhất định sẽ thắng! Xông lên!!"),
    (50, "Lũ quái vật kia"),
    (50, "sao chịu nổi bom của ta!"),
    (50, "BÙM một phát! Khẹc khẹc khẹc!"),

    # Cutscene 5
    (220, "Khá đấy, tới được tận đây cơ à!"),
    (220, "Không có chìa khóa thì đừng hòng qua!!"),
    (215, "GÀO Ô Ô!! Sao ngươi có chìa khóa đó?!"),
    (250, "Dù ngươi có chìa khóa đi nữa,"),
    (180, "chuyến phiêu lưu của ngươi cũng dừng ở đây thôi!!"),
    (210, "Những quái vật đáng sợ nhất xưa nay"),
    (270, "đang chờ ngươi bên trong!"),
    (230, "Hãy hối hận vì mở cánh cổng này!"),
    (170, "Quét sạch quái vật, bảo vệ Vùng Đất Muôn Thú!!"),

    # Cutscene 6
    (320, "Cuối cùng chúng ta cũng tới đây!!"),
    (320, "Không có bạn, việc này khó thành."),
    (320, "Cùng kết thúc trận chiến cuối nào!"),
    (120, "Dù có dọn sạch lũ quái vật,"),
    (120, "khu rừng bị cháy cũng khó phục hồi ngay."),
    (120, "Nhưng tôi sẽ chiến đấu bảo vệ rừng!"),
    (120, "Tôi sẵn sàng hy sinh thân mình"),
    (120, "để đem lại hòa bình cho muôn thú!"),
    (120, "MUÔN THÚ VẠN TUẾ!!!"),
    (50, "Tôi từng đấu với rất nhiều kẻ mạnh,"),
    (50, "nhưng tôi vẫn muốn rèn luyện thêm."),
    (50, "Tôi muốn đấu với kẻ mạnh nhất!"),
    (80, "Cuối cùng đã tới sào huyệt trùm cuối!"),
    (80, "Trận này sẽ rất cam go, đừng lo,"),
    (80, "tôi nhất định sẽ bảo vệ cả đội!!"),
    (80, "Tôi chẳng mấy bận tâm thế sự đâu,"),
    (80, "nhưng đã nhận thù lao thì tôi sẽ hạ trùm!"),
    (80, "Nhanh xong trận để tôi đi tìm kho báu! He he!"),
    (30, "Vùng đất này quá ít trộm cướp,"),
    (30, "khiến tôi chưa trổ hết tài nghệ!!"),
    (30, "Đừng nói nhiều nữa, xông lên nào!!"),
    (100, "Tôi vốn chẳng thích đánh nhau chút nào,"),
    (100, "chỉ muốn mau mau kết thúc cuộc chiến,"),
    (100, "để về học viện nghiên cứu phép thuật thôi.")
]

for x, text in items:
    w = round(font.getlength(text))
    r = x + w
    flag = "OVERFLOW" if r > 700 else "OK"
    print(f"[{flag:8}] x={x:3d} w={w:3d} r={r:3d} | {text}")
