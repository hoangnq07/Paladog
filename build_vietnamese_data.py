# -*- coding: utf-8 -*-
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
    # Unit 0: Chuột Đấu Sĩ
    [
        "1",
        "Đừng coi thường vóc dáng nhỏ bé!",
        "Từng là tay anh chị khét tiếng,",
        "nay là chiến sĩ quả cảm giữ quê hương.",
        "0",
        "Trong hào quang, chuột có thể phi thân",
        "tấn công bất ngờ vào kẻ địch."
    ],
    # Unit 1: Thỏ Cung Thủ
    [
        "2",
        "Cung thủ cừ khôi với tầm bắn xa.",
        "Từng hiền lành yêu chuộng hòa bình,",
        "nay dũng cảm đứng lên cứu cánh rừng.",
        "0",
        "Trong hào quang, thỏ bắn tên lửa",
        "xuyên thấu qua nhiều kẻ địch."
    ],
    # Unit 2: Gấu Hộ Vệ
    [
        "3",
        "Cầm trường thương tấn công tầm trung.",
        "Được rèn luyện kỹ để giữ hoàng cung,",
        "nay xông pha diệt thù không lùi bước.",
        "0",
        "Trong hào quang, thương phóng ra gây",
        "sát thương mọi địch trên đường bay."
    ],
    # Unit 3: Chuột Túi Võ Sĩ
    [
        "4",
        "Bậc thầy võ thuật với cú đấm thép.",
        "Luôn khao khát tìm đối thủ mạnh hơn,",
        "biến chiến trường thành võ đài của mình.",
        "0",
        "Trong hào quang, tung ra liên hoàn",
        "nhiều cú đấm cực mạnh cùng lúc."
    ],
    # Unit 4: Rùa Phòng Thủ
    [
        "5",
        "Bọc giáp kiên cố, che chắn đồng đội.",
        "Dù vẻ ngoài dữ dằn nhưng rất ấm áp!",
        "Không bị đánh lui khi trúng đòn.",
        "0",
        "Tăng gấp đôi khả năng phòng thủ",
        "khi đứng trong hào quang."
    ],
    # Unit 5: Khỉ Cướp Biển
    [
        "6",
        "Bậc thầy chất nổ gây sát thương rộng",
        "bằng sức công phá của thuốc súng.",
        "Là cánh tay đắc lực của đồng minh.",
        "0",
        "Trong hào quang, ném ra những quả bom",
        "có sức công phá cực mạnh."
    ],
    # Unit 6: Tê Giác Tinh Nhuệ
    [
        "7",
        "Chiến binh càn quét cực mạnh bằng chùy.",
        "Sinh ra để chiến đấu, sẵn sàng",
        "ủi bay mọi vật cản ngáng đường.",
        "0",
        "Trong hào quang, lao thẳng tới trước",
        "và húc mạnh bằng chiếc sừng cứng."
    ],
    # Unit 7: Cánh Cụt Pháp Sư
    [
        "8",
        "Nhà thông thái uyên bác về ma thuật.",
        "Sử dụng ma pháp băng giá cấm kỵ",
        "để tiêu diệt kẻ thù xâm lăng.",
        "0",
        "Trong hào quang, ma pháp băng giá",
        "trở nên uy lực và mạnh mẽ hơn."
    ],
    # Unit 8: Rồng Hồng
    [
        "9",
        "Cỗ máy phun lửa sống động đầy uy lực.",
        "Được cả tộc rồng kính trọng",
        "nhờ lòng dũng cảm phi thường.",
        "0",
        "Trong hào quang, phun ra ngọn lửa",
        "dữ dội với sức nóng thiêu đốt."
    ]
]

# ========================================================
# 3. DB4: Cửa Hàng, Gậy Phép, Nhẫn, Lời Thoại (83 rows)
# ========================================================
DB4_VN = [
    # 0: Fist of Fury Mace
    ["1", "Gậy Đấm Thần Lực", "Bắn cú đấm năng lượng", "xuyên qua 3 kẻ địch.", "Rất hữu ích khi đánh xa."],
    # 1: Heal Mace
    ["2", "Gậy Hồi Máu", "Hồi phục máu cho Paladog", "và quân lính đứng gần.", "Vật phẩm sinh tử cần có!"],
    # 2: Turn Undead Mace
    ["3", "Gậy Diệt Quái", "Có tỉ lệ tiêu diệt ngay", "kẻ địch dạng bất tử.", "Quét sạch quái chớp mắt!"],
    # 3: Ice Mace
    ["4", "Gậy Băng", "Đóng băng địch tức thì,", "khiến chúng bất động.", "Rất hữu ích trước quái mạnh."],
    # 4: Lightning Mace
    ["5", "Gậy Sấm Sét", "Giáng tia sét cực mạnh", "xuống một phạm vi nhỏ.", "Vị trí sét rơi ngẫu nhiên."],
    # 5: Fire Mace
    ["6", "Gậy Lửa", "Phun luồng lửa thiêu đốt", "kẻ địch ở cự ly gần.", "Cực mạnh khi cận chiến!"],
    # 6: Meteor Mace
    ["7", "Gậy Thiên Thạch", "Gọi thiên thạch rơi xuống", "gây sát thương cực lớn.", "Rất hợp khi quái đông!"],
    # 7: Wind Mace
    ["8", "Gậy Gió Lốc", "Tạo lốc xoáy hất tung địch.", "Quái bị choáng tạm thời", "nhưng không mất máu."],
    # 8: Food Mace
    ["9", "Gậy Lương Thực", "Chuyển MP thành lương thực.", "Giúp bạn nhanh chóng", "gọi ra đội quân hùng hậu."],
    # 9: Poison Mace
    ["10", "Gậy Độc", "Tạo khói độc rút máu địch.", "Rất tốt để diệt quái trâu", "và tiết kiệm năng lượng."],
    # 10: Money Mace
    ["11", "Gậy Ném Vàng", "Ném tiền vàng tấn công địch.", "Không tốn năng lượng,", "nhưng sẽ hao ví tiền đấy!"],
    # 11: Ring of Experience
    ["12", "Nhẫn Kinh Nghiệm", "Tăng điểm kinh nghiệm", "nhận được từ kẻ địch.", "Giúp lên cấp cực nhanh!"],
    # 12: Ring of Wealth
    ["13", "Nhẫn Phú Quý", "Tăng lượng tiền vàng nhặt", "được khi diệt kẻ địch.", "Đeo vào là tiền đầy túi!"],
    # 13: Ring of Fortune
    ["14", "Nhẫn May Mắn", "Tăng tỉ lệ nhặt trang bị", "từ quái vật khi đánh rơi.", "Dễ săn được đồ quý hiếm!"],
    # 14: Ring of Vitality
    ["15", "Nhẫn Sinh Lực", "Tăng lượng máu tối đa.", "Còn sống là còn chiến đấu,", "máu là quan trọng nhất!"],
    # 15: Ring of Regeneration
    ["16", "Nhẫn Hồi Máu", "Tự hồi máu theo thời gian.", "Máu sẽ liên tục hồi phục", "mà không cần gậy hồi máu."],
    # 16: Ring of Agility
    ["17", "Nhẫn Tốc Độ", "Tăng tốc độ di chuyển.", "Cực kỳ thích hợp cho", "lối đánh cơ động linh hoạt."],
    # 17: Ring of Mana
    ["18", "Nhẫn Năng Lượng", "Tăng năng lượng tối đa (MP).", "Giúp tích trữ nhiều MP hơn", "để dùng kỹ năng liên tục."],
    # 18: Ring of Prayer
    ["19", "Nhẫn Cầu Nguyện", "Tăng tốc độ hồi năng lượng.", "Hồi MP càng nhanh thì", "chiến thắng càng dễ dàng!"],
    # 19: Ring of Cultivation
    ["20", "Nhẫn Thu Hoạch", "Tăng tốc tạo lương thực.", "Lương thực dồi dào", "giúp gọi thêm nhiều lính!"],
    # 20: Ring of Preservation
    ["21", "Nhẫn Kho Lương", "Tăng giới hạn lương thực.", "Thích hợp khi cần tích trữ", "để gọi ra binh lính cấp cao."],

    # Pig Shopkeeper Chatter & Tips (Rows 21 to 43)
    # 21
    ["22", "Tôi thích tiền vàng~ Éc~ ♬", "Tiền vào như nước~ ♪", "Chẳng gì sướng bằng có vàng~", "Éc éc éc~"],
    # 22
    ["23", "Mua rẻ bán đắt mới giàu!", "Éc! Ối chà...", "Bạn vừa nghe thấy gì à?", "Quên đi giùm tôi nha~"],
    # 23
    ["24", "Mua ủng hộ tôi món đi mà!", "Ở nhà đàn con đang đói~", "Tôi nghèo lắm, tin tôi đi...", "Mấy thứ này đồ xịn cả đấy~"],
    # 24
    ["25", "Để tôi đoán thử xem nào...", "Bạn đang tìm món này hả?", "Mua ngay đi thôi nào!", "Tôi bớt giá hữu nghị cho~"],
    # 25
    ["26", "Đừng mất công chờ đợi quái", "rớt ra món đồ bạn cần!", "Cứ mua luôn thứ bạn muốn,", "ngay tại đây, lúc này nè!"],
    # 26
    ["27", "Muốn sắp xếp lại túi đồ hả?", "Chạm vào biểu tượng nhẫn", "ở góc dưới bên trái kìa!", "Mọi thứ sẽ ngăn nắp ngay."],
    # 27
    ["28", "Quân địch sẽ tràn ra ồ ạt", "khi căn cứ mất nửa máu.", "Phải tích đủ MP để chống đỡ.", "Mua thêm Nhẫn Năng Lượng đi?"],
    # 28
    ["29", "Nếu đợi mãi không gọi lính,", "dù lương thực đã đầy,", "đó là vì chạm trần rồi.", "Hãy đeo Nhẫn Kho Lương nhé."],
    # 29
    ["30", "Trang bị có các cấp sao.", "Càng nhiều sao càng mạnh.", "Đừng buồn nếu ít sao,", "dùng ngọc nâng sao lên được."],
    # 30
    ["31", "Đừng nản lòng khi chỉ", "qua màn với 1 sao.", "Bạn có thể chơi lại", "để cải thiện điểm số mà."],
    # 31
    ["32", "Bán đồ thì tôi mua lại", "giá thấp hơn một chút.", "Buôn bán phải kiếm cháo chứ!", "Lãi có tí tẹo, tin tôi đi!"],
    # 32
    ["33", "Cân nhắc kỹ trước khi bán!", "Hãy chắc rằng món đồ đó", "không còn cần thiết nữa nha.", "Tôi không cho chuộc lại đâu."],
    # 33
    ["34", "Mở lính mới cũng hay,", "nhưng nâng cấp lính hiện có", "cũng tăng sức mạnh rất tốt,", "lại đỡ tốn kém hơn nhiều."],
    # 34
    ["35", "Giảm thiệt hại bằng cách", "tích lương thực gọi lính.", "Nhẫn Kho Lương cực kỳ hợp", "cho chiến thuật này đó!"],
    # 35
    ["36", "Muốn nâng cấp lính hả?", "Thế thì nhầm chỗ rồi bạn ơi.", "Hãy nhìn sang bảng bên trái,", "bên đó mới nâng lính được."],
    # 36
    ["37", "Túi đồ của bạn đầy rồi!", "Tôi không nhét thêm được!", "Mang nhiều đồ lỉnh kỉnh thế?", "Bán bớt mấy thứ đi nha~"],
    # 37
    ["38", "Bạn thật sự muốn bán hả?", "Món này trông XỊN LẮM đấy.", "Bán rồi không lấy lại đâu.", "Vẫn quyết định bán chứ?"],
    # 38
    ["39", "Giá này hữu nghị lắm rồi.", "Bạn cần thêm món gì nữa?", "0", "0"],
    # 39
    ["40", "Cảm ơn bạn rất nhiều!", "Lần sau lại ghé nữa nhé!", "0", "0"],
    # 40
    ["41", "Cảm ơn bạn! Món đồ này", "sinh ra là để dành cho bạn!", "0", "0"],
    # 41
    ["42", "Mua giá này là tôi chịu lỗ!", "Muốn bán thêm món nào nữa?", "0", "0"],
    # 42
    ["43", "Quyết định rất sáng suốt!", "Giữ đồ thừa chỉ chật túi!", "0", "0"],
    # 43
    ["44", "Cảm ơn bạn đã mua hàng!", "Còn món nào muốn mua nữa?", "0", "0"],

    # Equipment Inventory Descriptions (Rows 44 to 64)
    # 44: Fist of Fury
    ["45", "Gậy Đấm Thần Lực", "Bắn cú đấm năng lượng", "xuyên qua 3 kẻ địch.", "Rất hữu ích khi đánh xa."],
    # 45: Heal Mace
    ["46", "Gậy Hồi Máu", "Hồi phục máu cho Paladog", "và quân lính xung quanh.", "Còn máu là còn tất cả!"],
    # 46: Turn Undead Mace
    ["47", "Gậy Diệt Quái", "Có tỉ lệ tiêu diệt tức thì", "kẻ địch dạng bất tử.", "Tiễn vong linh an nghỉ."],
    # 47: Ice Mace
    ["48", "Gậy Băng", "Gậy phép đóng băng kẻ địch.", "Cực kỳ hiệu quả khi đối đầu", "với quái to xác nguy hiểm."],
    # 48: Lightning Mace
    ["49", "Gậy Sấm Sét", "Giáng tia sét kinh hoàng", "xuống một phạm vi nhỏ.", "Hợp khi địch tụ thành cụm."],
    # 49: Fire Mace
    ["50", "Gậy Lửa", "Phun lửa thiêu đốt kẻ địch.", "Phạm vi tấn công ngắn,", "cần giữ cự ly hợp lý."],
    # 50: Meteor Mace
    ["51", "Gậy Thiên Thạch", "Gọi thiên thạch oanh tạc.", "Tốn nhiều năng lượng", "nhưng uy lực cực lớn."],
    # 51: Wind Mace
    ["52", "Gậy Gió Lốc", "Tạo lốc xoáy hất tung địch.", "Tuy không gây sát thương,", "nhưng đẩy lùi địch ra xa."],
    # 52: Food Mace
    ["53", "Gậy Lương Thực", "Chuyển MP thành lương thực.", "Muốn gọi nhanh nhiều lính,", "hãy tận dụng cây gậy này."],
    # 53: Poison Mace
    ["54", "Gậy Độc", "Phun làn khói độc khiến", "kẻ địch cạn máu từ từ,", "rất tốt để bào máu quái."],
    # 54: Money Mace
    ["55", "Gậy Ném Vàng", "Tấn công kẻ thù bằng vàng.", "Có thể dùng bất cứ lúc nào,", "ngay cả khi cạn năng lượng."],
    # 55: Ring of Experience
    ["56", "Nhẫn Kinh Nghiệm", "Giúp lên cấp nhanh chóng.", "Muốn học thêm kỹ năng mới,", "hãy đeo chiếc nhẫn này."],
    # 56: Ring of Wealth
    ["57", "Nhẫn Phú Quý", "Tăng lượng vàng nhặt được", "khi tiêu diệt kẻ địch.", "Giúp mau chóng làm giàu!"],
    # 57: Ring of Fortune
    ["58", "Nhẫn May Mắn", "Tăng tỉ lệ nhặt trang bị.", "Muốn săn đồ độc lạ hiếm gặp,", "đây chính là thứ bạn cần."],
    # 58: Ring of Vitality
    ["59", "Nhẫn Sinh Lực", "Tăng lượng máu tối đa (HP).", "Giữ lượng máu dồi dào là", "chìa khóa để sống sót!"],
    # 59: Ring of Regeneration
    ["60", "Nhẫn Hồi Máu", "Tự động hồi máu từ từ.", "Máu sẽ liên tục hồi phục", "mà không cần gậy hồi máu."],
    # 60: Ring of Agility
    ["61", "Nhẫn Tốc Độ", "Tăng tốc độ di chuyển nhanh.", "Thích hợp cho lối đánh", "cơ động linh hoạt."],
    # 61: Ring of Mana
    ["62", "Nhẫn Năng Lượng", "Tăng năng lượng tối đa (MP).", "Tích trữ nhiều năng lượng", "để dùng kỹ năng liên tục."],
    # 62: Ring of Prayer
    ["63", "Nhẫn Cầu Nguyện", "Tăng tốc hồi năng lượng.", "Rất cần năng lượng dồi dào", "để xả phép thuật liên hồi."],
    # 63: Ring of Cultivation
    ["64", "Nhẫn Thu Hoạch", "Tăng tốc tạo lương thực.", "Lương thực dồi dào sẽ", "giúp gọi nhiều lính hơn."],
    # 64: Ring of Preservation
    ["65", "Nhẫn Kho Lương", "Tăng giới hạn lương thực.", "Xoay chuyển thế trận bằng", "gọi cả đàn lính cùng lúc."],

    # Larva Tips & Advice (Rows 65 to 82)
    # 65
    ["66", "Lũ quái vật độc ác!!", "Chúng cướp mất ba mẹ tôi!", "Tôi sẽ không bao giờ", "tha thứ cho chúng đâu!"],
    # 66
    ["67", "Ước gì tôi mau lớn", "để sát cánh cùng mọi người", "tiêu diệt lũ quái vật!", "Tôi đang chăm chỉ rèn luyện!"],
    # 67
    ["68", "Kiểm tra kỹ trang bị", "trước khi ra trận nhé!", "Có điều gì chưa rõ", "cứ việc hỏi tôi nha!"],
    # 68
    ["69", "Hồi xưa ở đây táo thơm", "ngọt nhiều vô kể,", "giờ tìm được một quả", "như này cũng khó lắm."],
    # 69
    ["70", "Nếu qua màn quá khó,", "hãy đổi sang trang bị khác", "thay vì chỉ chăm chăm", "nâng cấp quân lính."],
    # 70
    ["71", "Muốn xếp lại túi đồ hả?", "Hãy chạm biểu tượng nhẫn", "ở góc dưới bên trái nhé!", "Mọi thứ sẽ ngăn nắp ngay."],
    # 71
    ["72", "Muốn mua bán đồ,", "ghé tiệm bác Heo bên phải.", "Trang bị xịn là con đường", "ngắn nhất tới chiến thắng!"],
    # 72
    ["73", "Chạm vào trang bị trước", "nếu muốn đeo hoặc tháo", "món đồ nào đó nhé.", "Quy tắc cơ bản mà!"],
    # 73
    ["74", "Vũ khí tùy bạn chọn,", "phối hợp lính cận chiến,", "đánh xa và hồi máu sẽ giúp", "đánh trận dễ dàng hơn."],
    # 74
    ["75", "Nếu màn này quá khó nhằn,", "cày cấp ở màn chơi dễ", "cũng là một mẹo", "vô cùng hiệu quả đấy."],
    # 75
    ["76", "Nếu túi đồ đầy ắp,", "quái sẽ không rớt thêm đồ.", "Hãy bán bớt đồ thừa", "cho bác Heo nhé."],
    # 76
    ["77", "Vừa vào trận mà vội vã", "gọi lính ra ngay là dở rồi.", "Đi lẻ dễ bị tiêu diệt.", "0"],
    # 77
    ["78", "Quân địch sẽ tràn ra ồ ạt", "khi căn cứ mất nửa máu.", "Hãy chuẩn bị sẵn sàng", "nghênh chiến nhé!"],
    # 78
    ["79", "Mỗi trùm đều có điểm riêng.", "Chiến thuật ứng phó", "phải đổi theo từng tên!", "Hãy tính toán cẩn thận!"],
    # 79
    ["80", "Lũ quái vật bắn xa", "rất nguy hiểm khi tụ đông.", "Hãy ưu tiên diệt sớm", "ngay khi có thể!"],
    # 80
    ["81", "Quân lính sẽ mạnh hơn", "khi đứng trong hào quang.", "Luôn giữ họ trong hào quang!", "Mở rộng hào quang rất tốt."],
    # 81
    ["82", "Kỹ năng đặc biệt của lính", "chỉ kích hoạt khi họ ở", "trong vòng hào quang thôi!", "Đừng quên điều này nhé."],
    # 82
    ["83", "Paladog và các Tướng Quỷ", "không bị đóng băng hay", "chết ngay lập tức đâu.", "Nhớ kỹ điều này nha!"]
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

    "Oh! What\'s that?": "Ô kìa! Cái gì thế kia?",
    "Then let\'s go to the castle": "Cùng tiến vào lâu đài",
    "and get rid of the Dark Lord!": "và tiêu diệt Chúa Tể Hắc Ám nào!",
    "OK!!": "ĐƯỢC RỒI!!",
    "Let\'s go and win the fight!": "Tiến lên và giành chiến thắng nào!",
    "I\'m raring to go!": "Tôi đang nóng lòng xung trận lắm rồi!",
    "Where did he disappeared!": "Hắn biến đâu mất tiêu rồi?!",
    "Then what are we waiting for!": "Còn chần chừ gì nữa!",
    "Let\'s go to get the key back!!": "Mau đuổi theo lấy lại chìa khóa thôi!!",

    "A Key!!": "Chìa khóa kìa!!",
    "The key seems to be the one": "Đây có vẻ là chiếc chìa khóa",
    "needed to enter the Dark Castle.": "cần thiết để mở cổng Lâu Đài Hắc Ám.",
    "HAHAHAHAHAHA!": "HAHAHAHAHAHA!",
    "Won\'t let that happen!! The key is now mine!!": "Đừng hòng mơ tưởng!! Chiếc chìa khóa giờ là của ta!!",
    "Monster took the key!!": "Quái vật giật mất chìa khóa rồi!!",
    "I see him over there": "Tôi thấy hắn ở đằng kia,",
    "at the Ice Glen!!": "ngay tại Hẻm Núi Băng!!",
    "If you want to go to the castle of Dark Lord": "Muốn tới được lâu đài của Chúa Tể Hắc Ám,",
    "you will need to beat me first!!": "ngươi phải hạ được ta trước đã!!",
    "I\'m Hungry! Hungry! Hungry!": "Đói quá! Đói quá! Đói cồn cào!",

    "Ok, We got the key!": "Tuyệt vời, ta đã lấy lại được chìa khóa!",
    "Let\'s go to the castle now!!": "Tiến thẳng vào lâu đài ngay thôi!!",
    "HAHAHA Paladog!!": "HAHAHA Paladog!!",
    "You\'ll have to fight against yourself!": "Ngươi sẽ phải chiến đấu với chính bản sao bóng tối của mình!",
    "Now let\'s see if you can beat your ownself!": "Để xem ngươi có đánh bại được chính bản thân mình không!",

    "Passing the cave over there is the": "Băng qua hang động đằng kia chính là",
    "short cut to the castle of Dark Lord.": "đường tắt dẫn tới Lâu Đài Hắc Ám.",
    "But there were many monsters inside the": "Nhưng ngay từ trước khi chiến tranh nổ ra,",
    "cave even before the war have begun!!": "trong hang đã tràn ngập quái vật rồi!!",
    "Whatever comes out,": "Bất kể con quái nào xuất hiện,",
    "we will win! Let\'s go!!": "chúng ta nhất định sẽ thắng! Xung phong!!",

    "Those monsters won\'t": "Lũ quái vật kia",
    "survive my bombs!": "sao sống nổi trước bom của ta!",
    "Like POW! ee ee ee": "BÙM một phát! He he he!",

    "Impressive that you made this far!!": "Khá khen cho ngươi mò được tới tận đây!!",
    "But you can\'t pass without the key!!": "Nhưng không có chìa khóa thì đừng hòng qua!!",
    "HAHAHAHA!!": "HAHAHAHA!!",
    "GRRR!! How did you got that key!!": "GÀO Ô Ô!! Sao ngươi lại có được chiếc chìa khóa đó?!",
    "Even though you got the key": "Dù ngươi có chìa khóa đi chăng nữa,",
    "Your adventure will end here, no matter what!!": "thì cuộc phiêu lưu của ngươi cũng kết thúc tại đây thôi!!",

    # Pre-stage 9 Unit Dialogues & Dark Castle
    " Gold": " Vàng",
    "Dreadful creatures you have never seen": "Những quái vật đáng sợ chưa từng thấy",
    "are living inside there!!": "đang ẩn nấp ở bên trong!!",
    "Regret that you opened the door!": "Hối hận vì đã mở cánh cửa này đi!",
    "Let's defeat the raider and save the Critterland!!!": "Hãy đánh bại kẻ xâm lược và giải cứu Critterland!!!",
    "Finally I made here!!": "Cuối cùng tôi cũng tới được đây!!",
    "This wasn't possible without your help.": "Nếu không có bạn giúp sức thì tôi không làm nổi đâu.",
    "Let's get through this long battle!": "Cùng nhau vượt qua trận chiến dài này nào!",
    "The burned forest will not revive back": "Khu rừng bị cháy rụi sẽ không thể phục hồi lại ngay,",
    "even I get rid of those monsters.": "ngay cả khi quét sạch lũ quái vật.",
    "But still I will fight to protect the remaining forest!!": "Nhưng tôi vẫn sẽ chiến đấu bảo vệ cánh rừng còn lại!!",
    "I am ready to sacrifice my life if": "Tôi sẵn sàng hy sinh tính mạng của mình",
    "it is needed to save the Critterland.": "nếu điều đó có thể cứu được Critterland.",
    "Hail to Critterland!!!": "Critterland muôn năm!!!",
    "I've fought with and won those who call": "Tôi từng đọ sức và thắng nhiều kẻ tự nhận là",
    "themselves strong, but I need to train more.": "mạnh mẽ, nhưng tôi vẫn cần rèn luyện thêm.",
    "I want to fight with the one who is called the strongest.": "Tôi muốn so tài cùng kẻ mạnh nhất!",
    "At last, at the Dark lord's castle.": "Cuối cùng cũng tới lâu đài của Chúa Tể Hắc Ám.",
    "The battle won't be easy, but don't worry!": "Trận chiến sẽ không hề dễ dàng, nhưng đừng lo!",
    "I will protect you guys!!": "Tôi sẽ bảo vệ mọi người!!",
    "I don't really care about what happens to": "Tôi chẳng bận tâm chuyện gì xảy ra với",
    "Critterland, but since I'm paid, I'll beat the Dark Lord!": "Critterland, nhưng đã nhận thù lao thì tôi sẽ hạ Chúa Tể Hắc Ám!",
    "I want to end this war fast, and delve for treasures. ee ee ee": "Mau kết thúc trận này để tôi còn đi tìm kho báu! He he he",
    "There's not much criminals in Critterland": "Ở Critterland ít kẻ xấu quá,",
    "and I haven't had chances to show my power!!": "khiến tôi chưa có cơ hội trổ tài!!",
    "Now let's stop talking and move!!": "Bớt nói lại và xung trận thôi!!",
    "I don't like battles but I have no choice.": "Tôi không thích đánh nhau nhưng chẳng có lựa chọn nào khác.",
    "Now I just want to finish this battle fast,": "Giờ tôi chỉ muốn kết thúc trận đấu thật nhanh,",
    "and study magic more.": "để tiếp tục nghiên cứu ma thuật.",

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
            f'"{en_text.replace("'", "\'")}"'
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
    new_code = '_loc9_.antiAliasType = AntiAliasType.ADVANCED;\n         _loc9_.autoSize = TextFieldAutoSize.LEFT;'
    if old_target in lib_code and 'autoSize = TextFieldAutoSize.LEFT' not in lib_code:
        lib_code = lib_code.replace(old_target, new_code)
        print("   -> Added autoSize to drawString")

    old_target24 = '_loc9_.text = param1;\n         _loc9_.antiAliasType = AntiAliasType.NORMAL;\n         _loc9_.background = false;'
    new_code24 = '_loc9_.text = param1;\n         _loc9_.antiAliasType = AntiAliasType.NORMAL;\n         _loc9_.autoSize = TextFieldAutoSize.LEFT;\n         _loc9_.background = false;'
    if old_target24 in lib_code:
        lib_code = lib_code.replace(old_target24, new_code24)
        print("   -> Added autoSize to drawString24")

    if 'import flash.text.TextFieldAutoSize;' not in lib_code:
        lib_code = lib_code.replace('import flash.text.*;', 'import flash.text.*;\n   import flash.text.TextFieldAutoSize;')

    with open(lib_path, 'w', encoding='utf-8') as f:
        f.write(lib_code)
    print("   -> Done Library.as")

    print("\nAll translation files generated successfully!")

if __name__ == '__main__':
    main()
