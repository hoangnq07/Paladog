import sys

sys.stdout.reconfigure(encoding='utf-8')

path = 'extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as'
with open(path, 'r', encoding='utf-8', errors='ignore') as f:
    code = f.read()

REPLACEMENTS = {
    # Cutscene 1 (Pig)
    'this.lib.drawString("Đa tạ đại hiệp đã ra tay cứu mạng!",210,135,0,100,TOP | LEFT);':
        'this.lib.drawString("Đa tạ đại hiệp đã cứu mạng!",210,135,0,100,TOP | LEFT);',
    'this.lib.drawString("Lũ quái vật lục sắc đột ngột tấn công",210,155,0,100,TOP | LEFT);':
        'this.lib.drawString("Lũ yêu ma đột ngột tấn công",210,155,0,100,TOP | LEFT);',
    'this.lib.drawString("sơn thôn chúng tôi, đẩy muôn dân vào cảnh nguy nan.",210,175,0,100,TOP | LEFT);':
        'this.lib.drawString("khiến thôn làng gặp nguy nan!",210,175,0,100,TOP | LEFT);',
    'this.lib.drawString("Đằng sau chúng có một đại ma đầu cực kỳ hung tợn,",210,135,0,100,TOP | LEFT);':
        'this.lib.drawString("Đằng sau có một đại ma đầu,",210,135,0,100,TOP | LEFT);',
    'this.lib.drawString("hắn chỉ cần vung trượng là triệu hoán",210,155,0,100,TOP | LEFT);':
        'this.lib.drawString("hắn chỉ cần vung trượng phép",210,155,0,100,TOP | LEFT);',
    'this.lib.drawString("vô số ma binh lục sắc gớm ghiếc.",210,175,0,100,TOP | LEFT);':
        'this.lib.drawString("là triệu gọi vô số yêu ma!",210,175,0,100,TOP | LEFT);',
    'this.lib.drawString("Tôi đồ rằng hắn chính là Ma Vương thống lĩnh.",210,135,0,100,TOP | LEFT);':
        'this.lib.drawString("Tôi đoán hắn chính là Ma Vương.",210,135,0,100,TOP | LEFT);',
    'this.lib.drawString("Kính xin đại hiệp hãy tru diệt lũ yêu ma",210,155,0,100,TOP | LEFT);':
        'this.lib.drawString("Xin đại hiệp hãy tru diệt yêu ma",210,155,0,100,TOP | LEFT);',
    'this.lib.drawString("và cứu vớt thôn trang của chúng tôi!",210,175,0,100,TOP | LEFT);':
        'this.lib.drawString("để cứu lấy thôn làng chúng tôi!",210,175,0,100,TOP | LEFT);',

    # Cutscene 2 (Mushroom / Forest)
    'this.lib.drawString("Cây nấm này sẽ cứu sống cốt nhục của tôi!!",320,155,0,100,TOP | LEFT);':
        'this.lib.drawString("Nấm này sẽ cứu sống con tôi!!",320,155,0,100,TOP | LEFT);',
    'this.lib.drawString("Ngứa ngáy chân tay muốn sút bóng quá rồi!",375,150,0,100,TOP | LEFT);':
        'this.lib.drawString("Ngứa chân muốn sút bóng rồi!",375,150,0,100,TOP | LEFT);',
    'this.lib.drawString("Tôi mạo hiểm vào U Ám Sâm Lâm tìm thảo dược và nấm quý,",365,155,0,100,TOP | LEFT);':
        'this.lib.drawString("Tôi vào rừng tìm nấm thuốc,",365,155,0,100,TOP | LEFT);',
    'this.lib.drawString("nào ngờ suýt nữa đã táng mạng dưới chân quái vật đá bóng.",365,175,0,100,TOP | LEFT);':
        'this.lib.drawString("suýt bị quái đá bóng hại chết!",365,175,0,100,TOP | LEFT);',
    'this.lib.drawString("Thảo dược nơi rừng thẳm vốn là linh dược cứu người,",370,135,0,100,TOP | LEFT);':
        'this.lib.drawString("Cây cỏ nơi đây là linh dược,",370,135,0,100,TOP | LEFT);',
    'this.lib.drawString("nhưng lũ ma quái hoành hành khiến dân chúng khốn đốn nguy nan.",370,155,0,100,TOP | LEFT);':
        'this.lib.drawString("nhưng lũ ma quái hoành hành",370,155,0,100,TOP | LEFT);',
    'this.lib.drawString("hiện tại có biết bao con bệnh đang lâm vào cảnh hiểm nghèo.",370,175,0,100,TOP | LEFT);':
        'this.lib.drawString("khiến bao người lâm nguy nan.",370,175,0,100,TOP | LEFT);',
    'this.lib.drawString("Kính xin đại hiệp hãy giải cứu U Ám Sâm Lâm!",380,155,0,100,TOP | LEFT);':
        'this.lib.drawString("Xin cứu lấy U Ám Sâm Lâm!",380,155,0,100,TOP | LEFT);',
    'this.lib.drawString("Tôi phải tức tốc mang nấm thần về",380,135,0,100,TOP | LEFT);':
        'this.lib.drawString("Tôi phải mang nấm về ngay",380,135,0,100,TOP | LEFT);',
    'this.lib.drawString("cứu mạng cốt nhục của tôi ngay đây.",380,155,0,100,TOP | LEFT);':
        'this.lib.drawString("để cứu lấy con của tôi.",380,155,0,100,TOP | LEFT);',
    'this.lib.drawString("Đại hiệp xin hãy vạn phần bảo trọng!",380,175,0,100,TOP | LEFT);':
        'this.lib.drawString("Đại hiệp hãy bảo trọng!",380,175,0,100,TOP | LEFT);',

    # Cutscene 3 (Key)
    'this.lib.drawString("Ta đã nóng lòng xung trận lắm rồi!",320,175,0,100,TOP | LEFT);':
        'this.lib.drawString("Ta nóng lòng xung trận lắm rồi!",320,175,0,100,TOP | LEFT);',
    'this.lib.drawString("Đừng hòng mơ tưởng!! Chìa khóa nay đã thuộc về tay bản tọa!!",197,155,0,100,TOP | LEFT);':
        'this.lib.drawString("Đừng mơ tưởng!! Chìa khóa là của ta!!",197,155,0,100,TOP | LEFT);',
    'this.lib.drawString("Muốn đặt chân tới ma thành của Hắc Ám Ma Vương,",310,138,0,100,TOP | LEFT);':
        'this.lib.drawString("Muốn tới ma thành của Ma Vương,",310,138,0,100,TOP | LEFT);',
    'this.lib.drawString("ngươi phải bước qua xác của ta trước đã!!",310,158,0,100,TOP | LEFT);':
        'this.lib.drawString("hãy bước qua xác ta trước đã!!",310,158,0,100,TOP | LEFT);',
    'this.lib.drawString("Đói quá! Đói quá! Đói cồn cào!",485,233,0,100,TOP | LEFT);':
        'this.lib.drawString("Đói quá! Đói quá!!",485,233,0,100,TOP | LEFT);',

    # Cutscene 4 (Shadow clone & shortcut)
    'this.lib.drawString("Ngươi sẽ phải huyết chiến với chính ảo ảnh tà ác của bản thân!",125,152,0,100,TOP | LEFT);':
        'this.lib.drawString("Ngươi sẽ phải chiến đấu với ảo ảnh tà ác!",125,152,0,100,TOP | LEFT);',
    'this.lib.drawString("Để xem ngươi có thể đả bại được bản ngã của chính mình không!",125,172,0,100,TOP | LEFT);':
        'this.lib.drawString("Xem ngươi đả bại được chính mình không!",125,172,0,100,TOP | LEFT);',
    'this.lib.drawString("Nhưng ngay từ trước khi đại chiến bùng nổ,",310,165,0,100,TOP | LEFT);':
        'this.lib.drawString("Nhưng từ trước khi đại chiến bùng nổ,",310,165,0,100,TOP | LEFT);',
    'this.lib.drawString("trong hang đã tràn ngập yêu ma dị thú!!",310,185,0,100,TOP | LEFT);':
        'this.lib.drawString("trong hang đã đầy rẫy yêu ma!!",310,185,0,100,TOP | LEFT);',
    'this.lib.drawString("liên quân ta nhất định sẽ đại thắng! Xung phong!!",290,239,0,100,TOP | LEFT);':
        'this.lib.drawString("liên quân ta sẽ toàn thắng! Xung phong!!",290,239,0,100,TOP | LEFT);',

    # Cutscene 5 (Castle Gates)
    'this.lib.drawString("Khá khen cho bản lĩnh tiến tới tận nơi này!",220,138,0,100,TOP | LEFT);':
        'this.lib.drawString("Khá khen cho bản lĩnh tới tận đây!",220,138,0,100,TOP | LEFT);',
    'this.lib.drawString("Nhưng không có chìa khóa, đừng hòng bước qua!!",220,138,0,100,TOP | LEFT);':
        'this.lib.drawString("Không có chìa khóa, đừng hòng qua!!",220,138,0,100,TOP | LEFT);',
    'this.lib.drawString("GÀO Ô Ô!! Sao ngươi lại có được chìa khóa này!!",215,138,0,100,TOP | LEFT);':
        'this.lib.drawString("GÀO Ô Ô!! Sao có được chìa khóa?!",215,138,0,100,TOP | LEFT);',
    'this.lib.drawString("thì hành trình của ngươi cũng phải chấm dứt tại đây!!",180,138,0,100,TOP | LEFT);':
        'this.lib.drawString("hành trình của ngươi phải chấm dứt tại đây!!",180,138,0,100,TOP | LEFT);',
    'this.lib.drawString("Những hung thú khủng khiếp nhất xưa nay chưa từng thấy",210,138,0,100,TOP | LEFT);':
        'this.lib.drawString("Những hung thú khủng khiếp nhất xưa nay",210,138,0,100,TOP | LEFT);',
    'this.lib.drawString("Hãy hối hận vì đã mở cánh cổng này đi!",230,138,0,100,TOP | LEFT);':
        'this.lib.drawString("Hãy hối hận vì mở cánh cổng này!",230,138,0,100,TOP | LEFT);',

    # Cutscene 6 (Pre-boss speeches)
    'this.lib.drawString("Cuối cùng ta cũng đã đặt chân tới đây!!",320,185,0,100,TOP | LEFT);':
        'this.lib.drawString("Cuối cùng ta cũng đã tới đây!!",320,185,0,100,TOP | LEFT);',
    'this.lib.drawString("Nếu không có ngài tương trợ, việc này khó lòng thành tựu.",320,205,0,100,TOP | LEFT);':
        'this.lib.drawString("Không có ngài, việc khó thành.",320,205,0,100,TOP | LEFT);',
    'this.lib.drawString("Hãy kết thúc cuộc trường chinh vĩ đại này!",320,225,0,100,TOP | LEFT);':
        'this.lib.drawString("Hãy kết thúc cuộc viễn chinh này!",320,225,0,100,TOP | LEFT);',
    'this.lib.drawString("cánh rừng rực lửa cũng khó lòng phục hồi nguyên trạng.",120,225,0,100,TOP | LEFT);':
        'this.lib.drawString("rừng lửa cũng khó phục hồi nguyên trạng.",120,225,0,100,TOP | LEFT);',
    'this.lib.drawString("Nhưng ta vẫn sẽ vung kiếm huyết chiến để bảo vệ mảnh rừng còn lại!!",120,245,0,100,TOP | LEFT);':
        'this.lib.drawString("Nhưng ta sẽ vung kiếm bảo vệ cánh rừng còn lại!",120,245,0,100,TOP | LEFT);',
    'this.lib.drawString("Ta sẵn sàng xả thân hiến dâng sinh mạng",120,135,0,100,TOP | LEFT);':
        'this.lib.drawString("Ta sẵn sàng xả thân dâng sinh mạng",120,135,0,100,TOP | LEFT);',
    'this.lib.drawString("nếu điều đó có thể vãn hồi nền thái bình cho Thú Giới!",120,155,0,100,TOP | LEFT);':
        'this.lib.drawString("để vãn hồi nền thái bình cho Thú Giới!",120,155,0,100,TOP | LEFT);',
    'this.lib.drawString("Ta đã từng giao đấu và đả bại vô số kẻ tự xưng là cường giả,",50,193,0,100,TOP | LEFT);':
        'this.lib.drawString("Ta từng giao đấu với vô số cường giả,",50,193,0,100,TOP | LEFT);',
    'this.lib.drawString("Ta khao khát được quyết chiến với kẻ mạnh nhất thiên hạ!",50,233,0,100,TOP | LEFT);':
        'this.lib.drawString("Ta muốn quyết chiến với kẻ mạnh nhất!",50,233,0,100,TOP | LEFT);',
    'this.lib.drawString("Cuối cùng cũng đã tới sào huyệt của Hắc Ám Ma Vương!",80,135,0,100,TOP | LEFT);':
        'this.lib.drawString("Cuối cùng đã tới sào huyệt Ma Vương!",80,135,0,100,TOP | LEFT);',
    'this.lib.drawString("Huyết chiến phen này ắt vô cùng khốc liệt, nhưng chớ lo,",80,155,0,100,TOP | LEFT);':
        'this.lib.drawString("Huyết chiến phen này sẽ khốc liệt, chớ lo!",80,155,0,100,TOP | LEFT);',
    'this.lib.drawString("ta nhất định sẽ bảo bọc an nguy cho các huynh đệ!!",80,175,0,100,TOP | LEFT);':
        'this.lib.drawString("ta nhất định sẽ bảo vệ các huynh đệ!!",80,175,0,100,TOP | LEFT);',
    'this.lib.drawString("Ta vốn chẳng bận tâm tới thế sự của Thú Giới,",80,215,0,100,TOP | LEFT);':
        'this.lib.drawString("Ta chẳng màng tới thế sự Thú Giới,",80,215,0,100,TOP | LEFT);',
    'this.lib.drawString("nhưng một khi đã nhận thù lao, ta sẽ trảm thủ Hắc Ám Ma Vương!",80,235,0,100,TOP | LEFT);':
        'this.lib.drawString("đã nhận thù lao, ta sẽ trảm Ma Vương!",80,235,0,100,TOP | LEFT);',
    'this.lib.drawString("Mau chóng kết thúc trận chiến này để ta còn đi săn tìm kho báu! Khẹc khẹc!",80,255,0,100,TOP | LEFT);':
        'this.lib.drawString("Mau kết thúc trận này để đi tìm kho báu! Khẹc!",80,255,0,100,TOP | LEFT);',
    'this.lib.drawString("Ta vốn không thích đao binh, nhưng thế sự khó lòng thoái thác.",100,230,0,100,TOP | LEFT);':
        'this.lib.drawString("Ta không thích đao binh, nhưng khó thoái thác.",100,230,0,100,TOP | LEFT);',
    'this.lib.drawString("Nay chỉ muốn mau chóng kết thúc chiến trận,",100,250,0,100,TOP | LEFT);':
        'this.lib.drawString("Nay chỉ muốn mau kết thúc chiến trận,",100,250,0,100,TOP | LEFT);',
    'this.lib.drawString("để sớm ngày trở về tĩnh tâm nghiên cứu ma pháp diệu kỳ.",100,270,0,100,TOP | LEFT);':
        'this.lib.drawString("để trở về nghiên cứu ma pháp diệu kỳ.",100,270,0,100,TOP | LEFT);'
}

count = 0
for src, dst in REPLACEMENTS.items():
    if src in code:
        code = code.replace(src, dst)
        count += 1
    else:
        print(f"NOT FOUND: {src[:50]}...")

print(f"Replaced {count}/{len(REPLACEMENTS)} dialog lines in Drawing.as")

with open(path, 'w', encoding='utf-8') as f:
    f.write(code)
print("Saved Drawing.as successfully!")
