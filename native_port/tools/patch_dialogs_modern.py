import sys

sys.stdout.reconfigure(encoding='utf-8')

path = 'extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as'
with open(path, 'r', encoding='utf-8', errors='ignore') as f:
    code = f.read()

REPLACEMENTS = {
    # 1. Cutscene 1 (Pig)
    'Đa tạ đại hiệp đã cứu mạng!': 'Cảm ơn bạn đã cứu tôi!',
    'Lũ yêu ma đột ngột tấn công': 'Lũ quái vật bất ngờ tấn công',
    'khiến thôn làng gặp nguy nan!': 'khiến cả làng gặp nguy hiểm!',
    'Đằng sau có một đại ma đầu,': 'Đằng sau có một tên trùm,',
    'hắn chỉ cần vung trượng phép': 'hắn chỉ cần vung tay',
    'là triệu gọi vô số yêu ma!': 'là tạo ra cả bầy quái vật!',
    'Tôi đoán hắn chính là Ma Vương.': 'Tôi nghĩ hắn là tên trùm.',
    'Xin đại hiệp hãy tru diệt yêu ma': 'Xin hãy đánh bại chúng',
    'để cứu lấy thôn làng chúng tôi!': 'để cứu ngôi làng của chúng tôi!',

    # 2. Cutscene 2 (Mushroom)
    'Nấm này sẽ cứu sống con tôi!!': 'Cây nấm này sẽ cứu con tôi!!',
    'Ngứa chân muốn sút bóng rồi!': 'Ngứa chân muốn sút bóng quá!',
    'Cước pháp của ta là đệ nhất thiên hạ!!': 'Cú sút của ta là đỉnh nhất!!',
    'Đa tạ đại hiệp vô cùng!!': 'Cảm ơn bạn rất nhiều!!',
    'Tôi vào rừng tìm nấm thuốc,': 'Tôi vào Rừng Tối tìm nấm,',
    'suýt bị quái đá bóng hại chết!': 'suýt bị quái đá bóng tóm!',
    'Cây cỏ nơi đây là linh dược,': 'Cây cỏ ở đây là thuốc quý,',
    'nhưng lũ ma quái hoành hành': 'nhưng vì quái vật quậy phá',
    'khiến bao người lâm nguy nan.': 'khiến nhiều người bệnh gặp nạn.',
    'Xin cứu lấy U Ám Sâm Lâm!': 'Xin hãy cứu lấy Rừng Tối!',
    'Tôi phải mang nấm về ngay': 'Tôi phải mang nấm về nhanh',
    'để cứu lấy con của tôi.': 'cho con của tôi đây.',
    'Đại hiệp hãy bảo trọng!': 'Bạn nhớ cẩn thận nhé!',

    # 3. Cutscene 3 (Key)
    'TUÂN MỆNH!!': 'ĐƯỢC RỒI!!',
    'Tiến lên đoạt lấy thắng lợi!': 'Tiến lên giành chiến thắng nào!',
    'Ta nóng lòng xung trận lắm rồi!': 'Tôi nóng lòng xung trận lắm rồi!',
    'Quái quỷ, hắn biến đâu mất rồi?!': 'Quái lạ, hắn biến đâu mất rồi?!',
    'Còn chần chừ gì nữa!': 'Còn chờ gì nữa!',
    'Mau đuổi theo đoạt lại chìa khóa!!': 'Mau đuổi theo lấy lại chìa khóa!!',
    'Đừng mơ tưởng!! Chìa khóa là của ta!!': 'Đừng hòng!! Chìa khóa giờ là của ta!!',
    'Quái vật đã cướp mất chìa khóa!!': 'Quái vật cướp mất chìa khóa rồi!!',
    'Muốn tới ma thành của Ma Vương,': 'Muốn tới lâu đài Chúa Tể Hắc Ám,',
    'hãy bước qua xác ta trước đã!!': 'ngươi phải hạ ta trước đã!!',
    'Đói quá! Đói quá!!': 'Đói quá! Đói quá đi!',

    # 4. Cutscene 4 (Shortcut & Shadow)
    'Tuyệt hảo, chúng ta đã đoạt lại chìa khóa!': 'Tuyệt vời, đã lấy lại chìa khóa!',
    'Tổng tấn công vào ma thành ngay!!': 'Tiến vào lâu đài ngay thôi!!',
    'Ngươi sẽ phải chiến đấu với ảo ảnh tà ác!': 'Ngươi sẽ phải đấu với bản sao bóng tối!',
    'Xem ngươi đả bại được chính mình không!': 'Xem ngươi có tự thắng nổi mình không!',
    'Băng qua hang động phía trước chính là': 'Băng qua hang động đằng kia là',
    'mật đạo dẫn thẳng tới Hắc Ám Ma Thành.': 'đường tắt tới Lâu Đài Hắc Ám.',
    'Nhưng từ trước khi đại chiến bùng nổ,': 'Nhưng từ trước khi có chiến tranh,',
    'trong hang đã đầy rẫy yêu ma!!': 'trong hang đã đầy quái vật rồi!!',
    'Bất luận là ma đầu nào xuất hiện,': 'Bất kể con quái nào xuất hiện,',
    'liên quân ta sẽ toàn thắng! Xung phong!!': 'ta nhất định sẽ thắng! Xông lên!!',
    'Lũ nghiệt súc kia': 'Lũ quái vật kia',
    'sao sống nổi trước hỏa pháo của ta!': 'sao chịu nổi bom của ta!',
    'BÙM CHIẾU! Khẹc khẹc khẹc!': 'BÙM một phát! Khẹc khẹc khẹc!',

    # 5. Cutscene 5 (Castle Gates)
    'Khá khen cho bản lĩnh tới tận đây!': 'Khá đấy, tới được tận đây cơ à!',
    'Không có chìa khóa, đừng hòng qua!!': 'Không có chìa khóa thì đừng hòng qua!!',
    'GÀO Ô Ô!! Sao có được chìa khóa?!': 'GÀO Ô Ô!! Sao ngươi có chìa khóa đó?!',
    'Dù có đoạt được chìa khóa ma môn,': 'Dù ngươi có chìa khóa đi nữa,',
    'hành trình của ngươi phải chấm dứt tại đây!!': 'chuyến phiêu lưu của ngươi cũng dừng ở đây thôi!!',
    'Những hung thú khủng khiếp nhất xưa nay': 'Những quái vật đáng sợ nhất xưa nay',
    'đang ngự trị bên trong ma vực!!': 'đang chờ ngươi bên trong!',
    'Hãy hối hận vì mở cánh cổng này!': 'Hãy hối hận vì mở cánh cổng này đi!',
    'Hãy quét sạch lũ xâm lăng, bảo vệ Thú Giới!!!': 'Quét sạch quái vật, bảo vệ Vùng Đất Muôn Thú!!',

    # 6. Animal Speeches
    'Cuối cùng ta cũng đã tới đây!!': 'Cuối cùng chúng ta cũng tới đây!!',
    'Không có ngài, việc khó thành.': 'Không có bạn, việc này khó thành.',
    'Hãy kết thúc cuộc viễn chinh này!': 'Cùng kết thúc trận chiến cuối nào!',
    'Dù có quét sạch lũ ma vật,': 'Dù có dọn sạch lũ quái vật,',
    'rừng lửa cũng khó phục hồi nguyên trạng.': 'khu rừng bị cháy cũng khó phục hồi ngay.',
    'Nhưng ta sẽ vung kiếm bảo vệ cánh rừng còn lại!': 'Nhưng tôi sẽ chiến đấu bảo vệ rừng!',
    'Ta sẵn sàng xả thân dâng sinh mạng': 'Tôi sẵn sàng hy sinh thân mình',
    'để vãn hồi nền thái bình cho Thú Giới!': 'để đem lại hòa bình cho muôn thú!',
    'THÚ GIỚI VẠN TUẾ!!!': 'MUÔN THÚ VẠN TUẾ!!!',
    'Ta từng giao đấu với vô số cường giả,': 'Tôi từng đấu với rất nhiều kẻ mạnh,',
    'nhưng ta vẫn cần phải tôi luyện thêm.': 'nhưng tôi vẫn muốn rèn luyện thêm.',
    'Ta muốn quyết chiến với kẻ mạnh nhất!': 'Tôi muốn đấu với kẻ mạnh nhất!',
    'Cuối cùng đã tới sào huyệt Ma Vương!': 'Cuối cùng đã tới sào huyệt trùm cuối!',
    'Huyết chiến phen này sẽ khốc liệt, chớ lo!': 'Trận này sẽ rất cam go, đừng lo,',
    'ta nhất định sẽ bảo vệ các huynh đệ!!': 'tôi nhất định sẽ bảo vệ cả đội!!',
    'Ta chẳng màng tới thế sự Thú Giới,': 'Tôi chẳng mấy bận tâm thế sự đâu,',
    'đã nhận thù lao, ta sẽ trảm Ma Vương!': 'nhưng đã nhận thù lao thì tôi sẽ hạ trùm!',
    'Mau kết thúc trận này để đi tìm kho báu! Khẹc!': 'Nhanh xong trận để tôi đi tìm kho báu! He he!',
    'Thú Giới bình yên quá ít đạo tặc,': 'Vùng đất này quá ít trộm cướp,',
    'khiến ta chưa có dịp phô diễn hết thần thông!!': 'khiến tôi chưa trổ hết tài nghệ!!',
    'Đừng dài dòng nữa, mau xung phong!!': 'Đừng nói nhiều nữa, xông lên nào!!',
    'Ta không thích đao binh, nhưng khó thoái thác.': 'Tôi vốn chẳng thích đánh nhau chút nào,',
    'Nay chỉ muốn mau kết thúc chiến trận,': 'chỉ muốn mau mau kết thúc cuộc chiến,',
    'để trở về nghiên cứu ma pháp diệu kỳ.': 'để về học viện nghiên cứu phép thuật thôi.'
}

count = 0
for src, dst in REPLACEMENTS.items():
    if src in code:
        code = code.replace(src, dst)
        count += 1
    else:
        print(f"NOT FOUND: {src}")

print(f"Replaced {count}/{len(REPLACEMENTS)} natural lines in Drawing.as")

with open(path, 'w', encoding='utf-8') as f:
    f.write(code)
print("Saved Drawing.as successfully!")
