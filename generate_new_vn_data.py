# -*- coding: utf-8 -*-
"""
generate_new_vn_data.py
Generates the revised build_vietnamese_data.py with natural, modern Vietnamese,
completely avoiding archaic wuxia/Sino-Vietnamese phrasing while maintaining
consistency across all elements.
"""

content = '''# -*- coding: utf-8 -*-
"""
Paladog Vietnamese Localization (Phong cách Tự Nhiên, Hiện Đại, Vui Nhộn)
Builds translated DB0, DB4, DB6 and patched Drawing.as and Library.as.
"""
import os
import zlib
import struct
import re

def serialize_db(table):
    """
    Serializes a 2D table of strings into zlib-compressed Paladog DB format.
    """
    rows = len(table)
    cols = len(table[0]) if rows > 0 else 0
    
    buf = bytearray()
    buf += struct.pack('<I', rows)
    buf += struct.pack('<I', cols)
    
    for r in table:
        for c in r:
            s_bytes = str(c).encode('utf-8')
            buf += struct.pack('<I', len(s_bytes))
            buf += s_bytes
            
    return zlib.compress(buf)

# ==========================================
# 1. DB0: Lời thoại Trùm (10 Boss Dialogues)
# ==========================================
DB0_VN = [
    [
        "1",
        "HÁ HÁ HÁ~ ",
        "Ta chính là Vua Zombie đây! ",
        "Ta sẽ biến ngươi thành zombie luôn, ",
        "để ngoan ngoãn phục tùng ta suốt đời!"
    ],
    [
        "2",
        "Hí hí, đến đây là để hỏi ",
        "bí quyết trẻ đẹp của ta sao? ",
        "Bí quyết là biến ngươi thành cóc ghẻ rồi",
        "nấu thành một nồi canh cóc bồi bổ!!"
    ],
    [
        "3",
        "Chuyền bóng mau! Chuyền đây cho ta!! ",
        "HÁ HÁ, bóng lửa tới rồi đây! ",
        "Ta sẽ sút bay tất cả các ngươi!!",
        "0"
    ],
    [
        "4",
        "Ngươi tưởng hạ được thằng em họ ",
        "Vua Zombie của ta là ngon à? Ta mạnh hơn nó nhiều! ",
        "Hãy chôn thân dưới tay đội quân xác ướp của ta đi!",
        "0"
    ],
    [
        "5",
        "Trước khi ngươi kịp thấy ta, ",
        "ta đã tiễn ngươi lên đường rồi! Lêu lêu! ",
        "0",
        "0"
    ],
    [
        "6",
        "Đói quá... đói bụng quá... ",
        "Ta đói quá... đói cồn cào... ",
        "DÂNG THỊT CHO TA MAU!!",
        "0"
    ],
    [
        "7",
        "Ta mới là Paladog xịn!! ",
        "Chết đi!!",
        "0",
        "0"
    ],
    [
        "8",
        "GÀO Ô Ô... GRRRR...",
        "0",
        "0",
        "0"
    ],
    [
        "9",
        "To gan thật! Dám mở mồm chê ",
        "bà đây không xinh đẹp sao? ",
        "Hãy nếm thử Nụ Hôn Thần Chết của ta đi!!!",
        "0"
    ],
    [
        "10",
        "Khá khen cho ngươi mò được ",
        "tới tận sào huyệt này, ",
        "nhưng cuộc chơi của ngươi kết thúc tại đây rồi!! ",
        "ĐẾN GIỜ ĐI TÔNG RỒI CON TRAI!!!"
    ]
]

# ========================================================
# 2. DB6: Binh Chủng Thú Tộc (9 Units Lore & Aura Skills)
# ========================================================
DB6_VN = [
    [
        "1",
        "Đừng nhìn vóc dáng nhỏ bé mà coi thường!",
        "Từng là tay anh chị khét tiếng đường phố,",
        "nay đã trở thành chiến sĩ quả cảm bảo vệ quê hương.",
        "0",
        "Trong hào quang, chuột có thể phi thân tấn công bất ngờ vào kẻ địch.",
        "0"
    ],
    [
        "2",
        "Cung thủ cừ khôi với khả năng bắn tầm xa.",
        "Từng là sinh vật hiền lành yêu hòa bình,",
        "nhưng đã đứng lên cứu cánh rừng rực lửa trước quân thù.",
        "0",
        "Trong hào quang, thỏ bắn ra mũi tên lửa xuyên qua nhiều kẻ địch.",
        "0"
    ],
    [
        "3",
        "Lính cầm thương có khả năng tấn công tầm trung.",
        "Được huấn luyện bài bản để bảo vệ hoàng cung,",
        "nhưng thời thế buộc chú phải chiến đấu không khoan nhượng.",
        "0",
        "Trong hào quang, thương phóng ra gây sát thương lên mọi kẻ địch trên đường bay.",
        "0"
    ],
    [
        "4",
        "Bậc thầy võ thuật với những cú đấm uy lực.",
        "Luôn khao khát tìm kiếm những đối thủ mạnh hơn,",
        "và chiến trường này chính là võ đài thử thách của chú.",
        "0",
        "Trong hào quang, tung ra nhiều cú đấm liên hoàn uy lực cùng lúc.",
        "0"
    ],
    [
        "5",
        "Lính bọc giáp kiên cố, sẵn sàng hứng chịu đòn đánh",
        "để bảo vệ đồng đội xung quanh.",
        "Đằng sau vẻ ngoài dữ dằn là một trái tim vô cùng ấm áp!",
        "Không bị đánh lui khi trúng đòn.",
        "Tăng gấp đôi phòng thủ khi đứng trong hào quang.",
        "0"
    ],
    [
        "6",
        "Bậc thầy chất nổ. Gây sát thương diện rộng",
        "lên nhiều kẻ địch bằng sức công phá của thuốc súng.",
        "Tuy là lính đánh thuê, chú là sự bổ sung tuyệt vời cho quân đội.",
        "0",
        "Ném ra những quả bom có sức công phá cực mạnh trong hào quang.",
        "0"
    ],
    [
        "7",
        "Chiến binh càn quét cực mạnh, đập tan quân địch",
        "bằng quả chùy gai hủy diệt.",
        "Sinh ra để chiến đấu, sẵn sàng ủi bay mọi thứ ngáng đường.",
        "0",
        "Trong hào quang, lao thẳng về phía trước và húc mạnh bằng chiếc sừng cứng.",
        "0"
    ],
    [
        "8",
        "Nhà thông thái uyên bác chuyên nghiên cứu ma thuật.",
        "Trong thời chiến, chú quyết định sử dụng ma pháp đóng băng.",
        "0",
        "0",
        "Trong hào quang, đòn tấn công bằng băng trở nên mạnh mẽ hơn.",
        "0"
    ],
    [
        "9",
        "Cỗ máy phun lửa sống động.",
        "Được cả loài rồng tôn kính nhờ lòng dũng cảm phi thường.",
        "0",
        "0",
        "Phun ra ngọn lửa dữ dội hơn khi đứng trong hào quang.",
        "0"
    ]
]

# ========================================================
# 3. DB4: Cửa Hàng, Gậy Phép, Nhẫn, Lời Thoại (83 rows)
# ========================================================
DB4_VN = [
    # 0: Fist of Fury Mace
    ["1", "Gậy Đấm Thần Lực", "Bắn ra cú đấm năng lượng xuyên qua 3 kẻ địch.", "Rất hữu ích khi kẻ địch còn ở", "khoảng cách xa."],
    # 1: Heal Mace
    ["2", "Gậy Hồi Máu", "Hồi phục máu cho Paladog và", "quân lính đứng gần. Muốn giữ mạng cho đồng đội,", "món này nhất định phải có!!"],
    # 2: Turn Undead Mace
    ["3", "Gậy Diệt Quái", "Có tỉ lệ tiêu diệt ngay lập tức kẻ địch bất tử.", "Nếu may mắn, bạn có thể quét sạch", "quái vật chỉ trong chớp mắt!!"],
    # 3: Ice Mace
    ["4", "Gậy Băng", "Đóng băng kẻ địch trong giây lát.", "Khiến chúng bất động hoàn toàn,", "rất hữu ích khi gặp kẻ địch mạnh."],
    # 4: Lightning Mace
    ["5", "Gậy Sấm Sét", "Giáng tia sét cực mạnh xuống", "một phạm vi nhỏ, nhưng khá khó", "đoán trước vị trí sét rơi."],
    # 5: Fire Mace
    ["6", "Gậy Lửa", "Phun ra luồng lửa thiêu đốt", "kẻ địch trong phạm vi ngắn. Cực kỳ hiệu quả", "khi đánh giáp lá cà."],
    # 6: Meteor Mace
    ["7", "Gậy Thiên Thạch", "Gọi thiên thạch khổng lồ từ trên trời rơi xuống.", "Sát thương cực lớn, rất thích hợp", "khi quân địch tràn ra quá đông."],
    # 7: Wind Mace
    ["8", "Gậy Gió Lốc", "Thổi bay kẻ địch bằng một cơn lốc xoáy.", "Quái bị thổi bay sẽ choáng một lúc,", "nhưng không nhận sát thương."],
    # 8: Food Mace
    ["9", "Gậy Lương Thực", "Chuyển hóa năng lượng thành lương thực.", "Để nhanh chóng gọi ra một đội quân lớn,", "hãy tận dụng cây gậy này."],
    # 9: Poison Mace
    ["10", "Gậy Độc", "Tạo ra làn khói độc rút máu kẻ địch từ từ.", "Dùng để đối phó với kẻ địch nhiều máu", "nhằm tiết kiệm năng lượng quý giá."],
    # 10: Money Mace
    ["11", "Gậy Ném Vàng", "Tấn công kẻ địch bằng tiền vàng.", "Có thể dùng thoải mái không tốn năng lượng,", "nhưng sẽ hao ví tiền của bạn đấy."],
    # 11: Ring of Experience
    ["12", "Nhẫn Kinh Nghiệm", "Tăng điểm kinh nghiệm nhận được từ kẻ địch.", "Món đồ tuyệt vời cho những ai muốn", "lên cấp thật nhanh."],
    # 12: Ring of Wealth
    ["13", "Nhẫn Phú Quý", "Tăng lượng tiền vàng nhặt được từ kẻ địch.", "Nếu tôi mà ra trận được,", "tôi nhất định đeo luôn 3 chiếc!"],
    # 13: Ring of Fortune
    ["14", "Nhẫn May Mắn", "Tăng tỉ lệ nhặt được trang bị từ quái.", "Nếu nhặt được món đồ nào tôi chưa bán,", "nhớ mang qua cho tôi xem nhé!"],
    # 14: Ring of Vitality
    ["15", "Nhẫn Sinh Lực", "Tăng lượng máu (HP) tối đa.", "Còn sống là còn chiến đấu,", "máu là quan trọng nhất trên đời!!"],
    # 15: Ring of Regeneration
    ["16", "Nhẫn Hồi Máu", "Tự động hồi máu từ từ theo thời gian.", "Máu sẽ tự hồi liên tục", "ngay cả khi không dùng Gậy Hồi Máu."],
    # 16: Ring of Agility
    ["17", "Nhẫn Tốc Độ", "Tăng tốc độ di chuyển nhanh nhẹn.", "Vật bất ly thân nếu bạn thích", "lối đánh cơ động, thoắt ẩn thoắt hiện."],
    # 17: Ring of Mana
    ["18", "Nhẫn Năng Lượng", "Tăng lượng năng lượng (MP) tối đa.", "Cần thiết để tích trữ năng lượng", "và xả chiêu liên tục khi vào trận."],
    # 18: Ring of Prayer
    ["19", "Nhẫn Cầu Nguyện", "Tăng tốc độ hồi phục năng lượng.", "Hồi năng lượng càng nhanh thì thắng", "càng dễ dàng, đúng không nào?"],
    # 19: Ring of Cultivation
    ["20", "Nhẫn Thu Hoạch", "Tăng tốc độ sản xuất lương thực.", "Lương thực dồi dào sẽ giúp bạn", "gọi thêm được nhiều quân lính."],
    # 20: Ring of Preservation
    ["21", "Nhẫn Kho Lương", "Tăng giới hạn dự trữ lương thực.", "Lương thực đầy mà chưa đủ gọi lính to?", "Chiếc nhẫn này chính là giải pháp."],

    # Pig Shopkeeper Chatter & Tips (Rows 21 to 38)
    # 21
    ["22", "Tôi thích tiền vàng~ Éc éc~ ♬", "Càng bán càng lời, tiền vào như nước~ ♪", "Trên đời chẳng gì sướng bằng có nhiều vàng~ ♬", "Éc éc éc~"],
    # 22
    ["23", "Mua rẻ bán đắt mới là làm giàu!", "Éc! Ối chà...", "Bạn vừa nghe thấy gì à?", "Quên đi giùm tôi nha~"],
    # 23
    ["24", "Bạn ơi, mua ủng hộ tôi món gì đi mà!", "Ở nhà còn đàn con nheo nhóc đang đói bụng~", "Tôi nghèo lắm, tin tôi đi...", "Mấy thứ lấp lánh này toàn đồ dỏm thôi à~"],
    # 24
    ["25", "Để tôi đoán thử xem nào...", "Có phải bạn đang tìm món này không?", "Mua ngay đi thôi nào!", "Tôi bớt giá hữu nghị cho~"],
    # 25
    ["26", "Đừng mất công chờ quái vật", "rớt ra món đồ bạn cần!", "Cứ mua luôn thứ bạn muốn,", "ngay tại đây, lúc này nè!"],
    # 26
    ["27", "Muốn sắp xếp lại túi đồ gọn gàng hả?", "Chỉ việc chạm vào biểu tượng chiếc nhẫn", "ở góc dưới bên trái kìa!", "Mọi thứ sẽ được xếp ngăn nắp ngay."],
    # 27
    ["28", "Quân địch sẽ tràn ra ồ ạt", "khi căn cứ của chúng mất một nửa máu.", "Bạn phải tích đủ năng lượng để chống đỡ.", "Hay là... mua thêm Nhẫn Năng Lượng đi?"],
    # 28
    ["29", "Nếu bạn đợi mãi mà không gọi được lính,", "dù thanh lương thực đã đầy,", "đó là vì bạn đã chạm trần dự trữ rồi.", "Hãy thử đeo Nhẫn Kho Lương xem sao."],
    # 29
    ["30", "Trang bị có các cấp sao khác nhau.", "Càng nhiều sao thì uy lực càng mạnh.", "Đừng buồn nếu đồ còn ít sao,", "bạn có thể dùng ngọc nâng cấp để tăng sao lên."],
    # 30
    ["31", "Đừng nản lòng khi chỉ qua màn", "với kết quả 1 sao.", "Bạn có thể chơi lại bất cứ lúc nào", "để cải thiện điểm số mà."],
    # 31
    ["32", "Khi bạn bán đồ cho tôi, tôi sẽ mua lại", "với giá thấp hơn giá bán một chút.", "Này, buôn bán thì cũng phải kiếm chút cháo chứ, éc!", "Lãi có chút xíu thôi, tin tôi đi!"],
    # 32
    ["33", "Cân nhắc cẩn thận trước khi bán đồ nhé.", "Hãy chắc chắn rằng món đồ đó không", "còn cần thiết nữa trước khi bán cho tôi.", "Tôi không cho chuộc lại đâu đấy."],
    # 33
    ["34", "Mở khóa lính mới cũng hay,", "nhưng nâng cấp lính hiện có cũng là", "cách tuyệt vời để gia tăng sức mạnh,", "bởi vì mở lính mới đắt đỏ lắm."],
    # 34
    ["35", "Giảm thương vong bằng cách tích lương thực", "rồi gọi cả một đàn lính ra cùng lúc.", "Nhẫn Kho Lương cực kỳ hợp với", "chiến thuật này đó.. Làm một chiếc chứ?"],
    # 35
    ["36", "Muốn nâng cấp lính hả?", "Thế thì nhầm chỗ rồi bạn ơi.", "Hãy nhìn sang bảng bên trái kìa,", "bên đó mới mở khóa và nâng cấp lính được."],
    # 36
    ["37", "Túi đồ của bạn đầy ắp rồi!", "Tôi không nhét thêm được món nào nữa đâu.", "Sao mang nhiều đồ lỉnh kỉnh thế? Bán bớt mấy thứ", "không dùng đi nha~"],
    # 37
    ["38", "Bạn có thật sự muốn bán món này không?", "Món này trông XỊN LẮM đấy.", "Bán rồi là không lấy lại được đâu nha.", "Vẫn quyết định bán chứ?"],
    # 38
    ["39", "Giá này là hữu nghị lắm rồi đó.", "Bạn còn cần món gì nữa không?", "0", "0"],
    # 39
    ["40", "Cảm ơn bạn rất nhiều!", "Lần sau lại ghé nữa nhé!", "0", "0"],
    # 40
    ["41", "Cảm ơn bạn! Món đồ này", "sinh ra đúng là để dành cho bạn rồi!", "0", "0"],
    # 41
    ["42", "Mua giá này là tôi chịu lỗ luôn đó.", "Còn muốn bán món nào nữa không?", "0", "0"],
    # 42
    ["43", "Quyết định sáng suốt! Giữ lại đống đồ", "không dùng tới làm gì cho chật túi.", "0", "0"],
    # 43
    ["44", "Cảm ơn bạn đã mua hàng!", "Còn món nào bạn muốn rinh về nữa không?", "0", "0"],

    # Equipment Inventory Descriptions (Rows 44 to 64)
    # 44: Fist of Fury
    ["45", "Gậy Đấm Thần Lực", "Bắn ra cú đấm năng lượng xuyên qua", "3 mục tiêu kẻ địch. Rất hữu ích khi", "kẻ địch còn ở khoảng cách xa."],
    # 45: Heal Mace
    ["46", "Gậy Hồi Máu", "Hồi phục máu cho Paladog", "và quân lính xung quanh.", "Còn máu là còn tất cả!"],
    # 46: Turn Undead Mace
    ["47", "Gậy Diệt Quái", "Gậy phép có tỉ lệ tiêu diệt ngay lập tức", "kẻ địch bất tử. Tiễn vong linh lang thang", "về nơi an nghỉ cuối cùng."],
    # 47: Ice Mace
    ["48", "Gậy Băng", "Gậy phép đóng băng đông cứng kẻ địch.", "Cực kỳ hữu hiệu khi đối đầu", "với những con quái to xác, nguy hiểm."],
    # 48: Lightning Mace
    ["49", "Gậy Sấm Sét", "Giáng tia sét kinh hoàng xuống", "một phạm vi nhỏ, rất thích hợp khi", "kẻ địch tụ tập thành cụm đông đảo."],
    # 49: Fire Mace
    ["50", "Gậy Lửa", "Phun ra ngọn lửa thiêu đốt", "kẻ thù. Phạm vi tấn công khá ngắn,", "nên cần giữ cự ly hợp lý."],
    # 50: Meteor Mace
    ["51", "Gậy Thiên Thạch", "Gậy phép gọi thiên thạch khổng lồ", "oanh tạc quân thù. Tốn nhiều", "năng lượng nhưng sức công phá cực đỉnh."],
    # 51: Wind Mace
    ["52", "Gậy Gió Lốc", "Thổi bay kẻ địch bằng một cơn lốc xoáy.", "Tuy không gây sát thương trực tiếp,", "nhưng đẩy lùi kẻ địch ra xa."],
    # 52: Food Mace
    ["53", "Gậy Lương Thực", "Gậy phép chuyển năng lượng thành lương thực.", "Muốn gọi nhanh nhiều quân lính,", "hãy tận dụng cây gậy này."],
    # 53: Poison Mace
    ["54", "Gậy Độc", "Phun ra làn khói độc khiến", "kẻ địch cạn máu từ từ,", "nhưng không trực tiếp kết liễu chúng."],
    # 54: Money Mace
    ["55", "Gậy Ném Vàng", "Tấn công kẻ thù bằng tiền vàng.", "Có thể dùng bất cứ lúc nào,", "ngay cả khi đã cạn kiệt năng lượng."],
    # 55: Ring of Experience
    ["56", "Nhẫn Kinh Nghiệm", "Giúp bạn lên cấp nhanh chóng.", "Muốn học thêm được nhiều kỹ năng hay,", "hãy đeo chiếc nhẫn này."],
    # 56: Ring of Wealth
    ["57", "Nhẫn Phú Quý", "Chiếc nhẫn giúp bạn trở nên giàu có.", "Bạn sẽ nhặt được nhiều tiền vàng hơn", "mỗi khi tiêu diệt kẻ địch."],
    # 57: Ring of Fortune
    ["58", "Nhẫn May Mắn", "Tăng tỉ lệ nhặt được trang bị từ quái.", "Nếu bạn muốn săn những món đồ độc lạ", "không có bán trong tiệm, đây là thứ bạn cần."],
    # 58: Ring of Vitality
    ["59", "Nhẫn Sinh Lực", "Chiếc nhẫn tăng lượng máu tối đa.", "Giữ cho lượng máu dồi dào là", "điều quan trọng nhất để sống sót!!"],
    # 59: Ring of Regeneration
    ["60", "Nhẫn Hồi Máu", "Chiếc nhẫn tự động hồi máu từ từ.", "Máu sẽ tự động hồi phục liên tục", "ngay cả khi không dùng Gậy Hồi Máu."],
    # 60: Ring of Agility
    ["61", "Nhẫn Tốc Độ", "Chiếc nhẫn giúp bạn di chuyển cực nhanh.", "Món đồ tuyệt vời nếu bạn", "yêu thích lối đánh cơ động linh hoạt."],
    # 61: Ring of Mana
    ["62", "Nhẫn Năng Lượng", "Chiếc nhẫn tăng lượng năng lượng tối đa.", "Bạn cần nó để tích trữ năng lượng", "và xả kỹ năng liên tục khi lâm trận."],
    # 62: Ring of Prayer
    ["63", "Nhẫn Cầu Nguyện", "Giúp hồi phục năng lượng nhanh chóng.", "Bạn rất cần năng lượng dồi dào để", "thi triển các loại gậy phép liên tục."],
    # 63: Ring of Cultivation
    ["64", "Nhẫn Thu Hoạch", "Chiếc nhẫn giúp tạo lương thực nhanh hơn.", "Bạn có thể gọi nhiều lính hơn", "khi nguồn lương thực dồi dào."],
    # 64: Ring of Preservation
    ["65", "Nhẫn Kho Lương", "Chiếc nhẫn tăng giới hạn chứa lương thực.", "Bạn có thể xoay chuyển thế trận", "bằng cách gọi một lượng lớn quân cùng lúc."],

    # Larva Tips & Advice (Rows 65 to 82)
    # 65
    ["66", "Lũ quái vật độc ác!!", "Chúng đã cướp mất", "ba mẹ yêu quý của tôi!", "Tôi sẽ không bao giờ tha thứ cho chúng!"],
    # 66
    ["67", "Tôi ước mau lớn thật nhanh", "để cùng mọi người kề vai sát cánh", "tiêu diệt lũ quái vật xấu xa!", "Tôi đang cố gắng rèn luyện mỗi ngày đây!"],
    # 67
    ["68", "Kiểm tra kỹ trang bị", "trước khi ra trận là cực kỳ quan trọng!", "Có điều gì chưa rõ cứ việc", "hỏi tôi nhé!"],
    # 68
    ["69", "Hồi xưa ở đây táo thơm ngọt", "nhiều vô kể,", "giờ loạn lạc tìm được một quả", "như thế này cũng khó khăn lắm."],
    # 69
    ["70", "Nếu qua màn quá khó khăn,", "hãy thử đổi sang trang bị khác", "thay vì chỉ chăm chăm", "nâng cấp quân lính."],
    # 70
    ["71", "Muốn sắp xếp lại túi đồ hả?", "Hãy chạm vào biểu tượng chiếc nhẫn", "ở góc dưới bên trái nhé!", "Mọi thứ sẽ ngăn nắp ngay."],
    # 71
    ["72", "Muốn mua bán trao đổi đồ,", "hãy ghé tiệm bác Heo ở bên phải.", "Trang bị xịn chính là", "con đường ngắn nhất tới chiến thắng!"],
    # 72
    ["73", "Nhớ chạm vào trang bị trước", "nếu bạn muốn đeo vào hoặc tháo ra", "một món đồ nào đó nhé.", "Quy tắc cơ bản mà, đúng không?"],
    # 73
    ["74", "Vũ khí thì tùy bạn chọn,", "nhưng phối hợp giữa lính đánh gần,", "đánh xa và hồi máu sẽ giúp", "đánh trận dễ dàng hơn nhiều."],
    # 74
    ["75", "Nếu màn này quá khó nhằn,", "cày cấp ở những màn chơi dễ hơn", "cũng là một mẹo", "vô cùng hiệu quả đấy."],
    # 75
    ["76", "Nếu túi đồ đã đầy ắp, quái vật", "sẽ không rớt thêm đồ nào nữa đâu.", "Thế nên hãy bán bớt đồ thừa", "cho tiệm của bác Heo nhé."],
    # 76
    ["77", "Vừa vào trận mà vội vã", "gọi lính ra ngay là không nên đâu.", "Đi lẻ một mình rất dễ bị tiêu diệt."],
    # 77
    ["78", "Quân địch sẽ tràn ra ồ ạt", "khi căn cứ của chúng mất", "một nửa lượng máu.", "Hãy chuẩn bị sẵn sàng nghênh chiến!"],
    # 78
    ["79", "Mỗi tên trùm đều có đặc điểm riêng.", "Chiến thuật ứng phó cũng phải", "thay đổi tùy theo từng tên!", "Hãy tính toán cẩn thận nhé!"],
    # 79
    ["80", "Lũ quái vật bắn xa", "sẽ cực kỳ nguy hiểm nếu tụ tập đông.", "Hãy ưu tiên tiêu diệt chúng từ sớm", "để tránh bị ép sân!"],
    # 80
    ["81", "Quân lính sẽ được tăng sức mạnh", "khi đứng trong vòng hào quang của bạn.", "Nhớ luôn giữ họ ở trong hào quang nhé.", "Mở rộng hào quang sẽ rất có ích đấy!"],
    # 81
    ["82", "Kỹ năng của quân ta cũng có thể", "đánh ngã kẻ địch.", "Đừng quên là kỹ năng chỉ kích hoạt", "khi lính đứng trong hào quang thôi!"],
    # 82
    ["83", "Paladog và các Tướng Quỷ", "miễn nhiễm với đòn đánh lui,", "đóng băng hoặc bị chết ngay lập tức.", "Nhớ kỹ điều này rất hữu ích đấy."]
]

# ========================================================
# 4. Drawing.as Text Replacements Mapping
# ========================================================
DRAWING_REPLACEMENTS = {
    # Password / Login / Menu prompts
    "패스워드를 입력하세요 !!  ": "XIN NHẬP MẬT MÃ !!  ",
    "Game Difficulty": "Độ Khó Trò Chơi",
    "All data at the selected slot will be deleted.": "Toàn bộ dữ liệu tại ô đã chọn sẽ bị xóa.",
    "Are you sure to continue?": "Bạn có chắc muốn tiếp tục không?",
    "랭킹 로그인": "BẢNG XẾP HẠNG",
    "오프라인게임": "CHƠI OFFLINE",
    "가입하기": "ĐĂNG KÝ",
    "시작하기": "BẮT ĐẦU",
    "Save Mode": "Chế Độ Lưu",
    "WAVE   ": "ĐỢT QUÁI   ",

    # Intro Cinematic
    "In a distant future": "Vào một tương lai xa xôi...",
    "As the greed and selfishness of human was killing": "Khi lòng tham và sự ích kỷ của loài người tàn phá",
    "the mother earth, gods had no choice but to annihilate": "Đất Mẹ, các vị thần đã quyết định xóa sổ",
    "the entire human race.": "toàn bộ loài người trên mặt đất.",
    "In place of Human, critters were given intelligence and": "Thay thế con người, muôn thú được ban cho trí tuệ và",
    "established their own civilization. They worshipped their": "tự tay xây dựng nền văn minh của riêng mình. Chúng tôn kính tạo hóa",
    "creators and spent a millennium in peace.": "và sống hòa bình suốt cả nghìn năm.",
    "Not like the human race, Critters were pure and peace": "Khác với loài người, muôn thú rất thuần khiết và yêu chuộng",
    "loving creatures. Meanwhile the devils were struggling": "hòa bình. Trong khi đó, lũ quỷ dữ đang chật vật tìm kiếm",
    "to find evil minds which once were full all around when": "những tâm địa độc ác từng tràn ngập khi loài người còn ngự trị.",
    "the earth was full of human. The devils, after all, decide": "Cuối cùng, bọn quỷ dữ quyết định xua quân khai chiến,",
    "to declare war on the Critterland.": "tấn công xâm lược Vùng Đất Muôn Thú Critterland.",
    "Knowing nothing but peace, Critters had not prepared": "Vốn chỉ quen với hòa bình, muôn thú hoàn toàn không có sự phòng bị",
    "any defenses and were mercilessly killed.": "và bị tàn sát không thương tiếc.",
    "The world became full with demons and the fate of": "Thế giới chìm trong quỷ dữ và số phận của muôn loài",
    "the nation seemed grim.": "trở nên vô cùng tăm tối.",
    "At the very moment everyone was about to give up hope,": "Đúng vào thời khắc mọi người sắp từ bỏ hy vọng,",
    "one paladin arose from the dark to fight back": "một hiệp sĩ chó đã bước ra từ bóng tối để chiến đấu",
    "for the peace of Critterland...": "bảo vệ nền hòa bình của Critterland...",
    "His name... was... Paladog.": "Tên của chàng... chính là... Paladog.",
    "The fate of Critterland is on your hands.": "Số phận của Critterland nằm trọn trong tay bạn.",
    "Good luck.": "Chúc bạn may mắn!",

    # Epilogues (Unit Endings)
    "Mouse the Street Fighter is no more a gangster.": "Chuột đấu sĩ không còn là một tay anh chị nữa.",
    "He built a cheese factory that manufactures": "Chú đã mở một nhà máy sản xuất phô mai",
    "the best cheese in Critterland.": "ngon nức tiếng khắp Critterland.",

    "Hood the Rabbit is enjoying his life planting trees": "Thỏ cung thủ tận hưởng cuộc sống bình yên, chăm chỉ trồng cây",
    "to make the forest green once again.": "để phủ xanh lại những cánh rừng năm xưa.",

    "Bear the Royal Guard is disciplined himself everyday": "Gấu hộ vệ hoàng gia tự rèn luyện bản thân mỗi ngày",
    "to prevent the war break out again.": "để ngăn chặn chiến tranh tái diễn.",

    "Rocky the Kangaroo once again went on a trip": "Chuột túi võ sĩ lại tiếp tục lên đường chu du,",
    "seeking for stronger enemies.": "tìm kiếm những đối thủ mạnh mẽ hơn.",

    "Defensive Tortoise went back to his homesea": "Rùa phòng thủ thong dong trở về với biển cả quê hương,",
    "and gave a talk about his adventure to his fellows.": "hào hứng kể lại chuyến phiêu lưu cho bạn bè cùng nghe.",

    "Monkey the Pirate is sailing the sea with the treasure map": "Khỉ cướp biển giương buồm ra khơi cùng tấm bản đồ kho báu",
    "that he received as the reward of contribution.": "mà chú được ban tặng làm phần thưởng chiến công.",

    "Elite Rhino is undergoing training to change": "Tê giác tinh nhuệ đang kiên trì rèn luyện",
    "his aggressive character.": "để kiềm chế tính khí nóng nảy của mình.",

    " Penguin the Wizard laid the Ice Wand down  ": "Chim cánh cụt pháp sư gác lại cây gậy băng",
    " and returned back to Academy.  ": "và trở về tiếp tục nghiên cứu tại học viện ma thuật.",

    "The Pink Dragon finished his journey in Critterland": "Rồng hồng hoàn tất chuyến phiêu lưu ở Critterland",
    "and went back to the land of dragons.": "và bay trở về vùng đất của loài rồng.",

    "And Paladog got married with the charming princess": "Còn Paladog đã kết hôn cùng nàng công chúa xinh đẹp,",
    "and lived happily ever after together with their": "sống hạnh phúc trọn đời bên nhau cùng",
    "six sons and six daughters.": "sáu cậu con trai và sáu cô con gái ngoan ngoãn.",

    # In-game Cutscenes & Dialogues
    "Thank you for saving me.": "Cảm ơn bạn đã cứu tôi!",
    "Green monsters suddenly attacked": "Lũ quái vật màu xanh đột nhiên tấn công",
    "our village and fallen us in danger.": "ngôi làng, khiến mọi người đều gặp nguy hiểm.",
    "There was a horrible bastard": "Đằng sau chúng có một tên đầu sỏ cực kỳ hung tợn,",
    "behind of them, who can make": "hắn chỉ cần vung tay là tạo ra",
    "green monsters by shaking his arms.": "cả đàn quái vật xanh lè gớm ghiếc.",
    "I think he is the boss.": "Tôi nghĩ hắn chính là tên trùm.",
    "Please defeat the monsters": "Xin hãy đánh bại lũ quái vật",
    "and save our village.": "và giải cứu ngôi làng của chúng tôi!",
    "Help! Help!": "Cứu với! Cứu tôi với!",

    "Ah! Here it is": "A! Nấm thuốc đây rồi!",
    "This mushroom will save my baby!!": "Cây nấm này sẽ cứu được con của tôi!!",
    "Oh-oh!": "Ối chà!",
    "I am itching to kick the ball!": "Ngứa chân muốn sút bóng quá rồi!",
    "HAHAHAHAHA!!": "HAHAHAHAHA!!",
    "My super strong ball coming!!": "Cú sút siêu mạnh của ta tới đây!!",
    "Tee-Hee!": "Hí hí!",
    "My kicks are the best!!": "Cú sút của ta là đỉnh nhất quả đất!!",
    "URGH": "HỰ!",
    "Thank you so much!!": "Cảm ơn bạn rất nhiều!!",
    "I went Dark Forest for hurbs and mushrooms": "Tôi vào Rừng Tối tìm thảo dược và nấm,",
    "and the kicking monster almost got me.": "suýt chút nữa là bị tên quái vật đá bóng tóm được.",
    "The plants of Dark Forest are used as": "Cây cỏ ở Rừng Tối vốn là thuốc chữa bệnh rất tốt,",
    "good medicine, but because of the monsters": "nhưng vì quái vật hoành hành khiến",
    "many sick people are in danger now.": "nhiều người ốm đang rơi vào tình cảnh nguy kịch.",
    "Please save the Dark Forest.": "Xin hãy giải cứu Rừng Tối với nhé.",
    "I have to go and take these mushrooms": "Giờ tôi phải mang nấm về thật nhanh",
    "quickly to my baby now.": "cho con của tôi đây.",
    "Please be careful.": "Bạn nhớ cẩn thận nhé!",

    "Oh! What\\'s that?": "Ô kìa! Cái gì thế kia?",
    "Then let\\'s go to the castle": "Cùng tiến vào lâu đài",
    "and get rid of the Dark Lord!": "và tiêu diệt Chúa Tể Hắc Ám nào!",
    "OK!!": "ĐƯỢC RỒI!!",
    "Let\\'s go and win the fight!": "Tiến lên và giành chiến thắng nào!",
    "I\\'m raring to go!": "Tôi đang nóng lòng xung trận lắm rồi!",
    "Where did he disappeared!": "Hắn biến đâu mất tiêu rồi?!",
    "Then what are we waiting for!": "Còn chần chừ gì nữa!",
    "Let\\'s go to get the key back!!": "Mau đuổi theo lấy lại chìa khóa thôi!!",

    "A Key!!": "Chìa khóa kìa!!",
    "The key seems to be the one": "Đây có vẻ là chiếc chìa khóa",
    "needed to enter the Dark Castle.": "cần thiết để mở cổng Lâu Đài Hắc Ám.",
    "HAHAHAHAHAHA!": "HAHAHAHAHAHA!",
    "Won\\'t let that happen!! The key is now mine!!": "Đừng hòng mơ tưởng!! Chiếc chìa khóa giờ là của ta!!",
    "Monster took the key!!": "Quái vật giật mất chìa khóa rồi!!",
    "I see him over there": "Tôi thấy hắn ở đằng kia,",
    "at the Ice Glen!!": "ngay tại Hẻm Núi Băng!!",
    "If you want to go to the castle of Dark Lord": "Muốn tới được lâu đài của Chúa Tể Hắc Ám,",
    "you will need to beat me first!!": "ngươi phải hạ được ta trước đã!!",
    "I\\'m Hungry! Hungry! Hungry!": "Đói quá! Đói quá! Đói cồn cào!",

    "Ok, We got the key!": "Tuyệt vời, ta đã lấy lại được chìa khóa!",
    "Let\\'s go to the castle now!!": "Tiến thẳng vào lâu đài ngay thôi!!",
    "HAHAHA Paladog!!": "HAHAHA Paladog!!",
    "You\\'ll have to fight against yourself!": "Ngươi sẽ phải chiến đấu với chính bản sao bóng tối của mình!",
    "Now let\\'s see if you can beat your ownself!": "Để xem ngươi có đánh bại được chính bản thân mình không!",

    "Passing the cave over there is the": "Băng qua hang động đằng kia chính là",
    "short cut to the castle of Dark Lord.": "đường tắt dẫn tới Lâu Đài Hắc Ám.",
    "But there were many monsters inside the": "Nhưng ngay từ trước khi chiến tranh nổ ra,",
    "cave even before the war have begun!!": "trong hang đã tràn ngập quái vật rồi!!",
    "Whatever comes out,": "Bất kể con quái nào xuất hiện,",
    "we will win! Let\\'s go!!": "chúng ta nhất định sẽ thắng! Xung phong!!",

    "Those monsters won\\'t": "Lũ quái vật kia",
    "survive my bombs!": "sao sống nổi trước bom của ta!",
    "Like POW! ee ee ee": "BÙM một phát! He he he!",

    "Impressive that you made this far!!": "Khá khen cho ngươi mò được tới tận đây!!",
    "But you can\\'t pass without the key!!": "Nhưng không có chìa khóa thì đừng hòng qua!!",
    "HAHAHAHA!!": "HAHAHAHA!!",
    "GRRR!! How did you got that key!!": "GÀO Ô Ô!! Sao ngươi lại có được chiếc chìa khóa đó?!",
    "Even though you got the key": "Dù ngươi có chìa khóa đi chăng nữa,",
    "Your adventure will end here, no matter what!!": "thì cuộc phiêu lưu của ngươi cũng kết thúc tại đây thôi!!",

    # Roars and sounds
    "HAHAHAHA": "HAHAHAHA",
    "HAHAHA": "HAHAHA",
    "GRRR": "GÀO Ô Ô",
    "GRRRR": "GÀO Ù Ù...",
    "GRRRRRRRRRR": "GÀO Ô Ô Ô Ô Ô...",
    "GRRRRRR": "GRRRRRR..."
}

def main():
    print("1. Serializing DB0 (Boss Dialogues)...")
    db0_bin = serialize_db(DB0_VN)
    with open('extracted/binaryData/408_com.fazecat.web.paladog.Library_DB0.bin', 'wb') as f:
        f.write(db0_bin)
    print("   -> Done DB0")

    print("2. Serializing DB4 (Store & Items Database)...")
    db4_bin = serialize_db(DB4_VN)
    with open('extracted/binaryData/416_com.fazecat.web.paladog.Library_DB4.bin', 'wb') as f:
        f.write(db4_bin)
    print("   -> Done DB4")

    print("3. Serializing DB6 (Unit Lore & Aura Skills)...")
    db6_bin = serialize_db(DB6_VN)
    with open('extracted/binaryData/420_com.fazecat.web.paladog.Library_DB6.bin', 'wb') as f:
        f.write(db6_bin)
    print("   -> Done DB6")

    print("4. Patching Drawing.as...")
    drawing_path = 'extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as'
    with open(drawing_path, 'r', encoding='utf-8') as f:
        drawing_code = f.read()

    replaced_count = 0
    for en_text in sorted(DRAWING_REPLACEMENTS.keys(), key=lambda x: len(x), reverse=True):
        vn_text = DRAWING_REPLACEMENTS[en_text]
        candidates = [
            f'"{en_text}"',
            f'"{en_text.replace("\'", "\\\'")}"'
        ]
        for target in candidates:
            if target in drawing_code:
                occurrences = drawing_code.count(target)
                drawing_code = drawing_code.replace(target, f'"{vn_text}"')
                replaced_count += occurrences

    with open(drawing_path, 'w', encoding='utf-8') as f:
        f.write(drawing_code)
    print(f"   -> Done Drawing.as ({replaced_count} replacements)")

    print("5. Patching Library.as (Font autoSize support)...")
    lib_path = 'extracted/scripts/scripts/com/fazecat/web/paladog/Library.as'
    with open(lib_path, 'r', encoding='utf-8') as f:
        lib_code = f.read()

    old_target = '_loc9_.antiAliasType = AntiAliasType.ADVANCED;'
    new_code = '_loc9_.antiAliasType = AntiAliasType.ADVANCED;\\n         _loc9_.autoSize = TextFieldAutoSize.LEFT;'
    if old_target in lib_code and 'autoSize = TextFieldAutoSize.LEFT' not in lib_code:
        lib_code = lib_code.replace(old_target, new_code)
        print("   -> Added autoSize to drawString")

    old_target24 = '_loc9_.text = param1;\\n         _loc9_.antiAliasType = AntiAliasType.NORMAL;\\n         _loc9_.background = false;'
    new_code24 = '_loc9_.text = param1;\\n         _loc9_.antiAliasType = AntiAliasType.NORMAL;\\n         _loc9_.autoSize = TextFieldAutoSize.LEFT;\\n         _loc9_.background = false;'
    if old_target24 in lib_code:
        lib_code = lib_code.replace(old_target24, new_code24)
        print("   -> Added autoSize to drawString24")

    if 'import flash.text.TextFieldAutoSize;' not in lib_code:
        lib_code = lib_code.replace('import flash.text.*;', 'import flash.text.*;\\n   import flash.text.TextFieldAutoSize;')

    with open(lib_path, 'w', encoding='utf-8') as f:
        f.write(lib_code)
    print("   -> Done Library.as")

    print("\\nAll translation files generated successfully!")

if __name__ == '__main__':
    main()
'''

with open('build_vietnamese_data.py', 'w', encoding='utf-8') as f:
    f.write(content)

print("build_vietnamese_data.py successfully rewritten!")
