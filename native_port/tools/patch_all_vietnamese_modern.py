# -*- coding: utf-8 -*-
"""
patch_all_vietnamese_modern.py
Localizes Paladog with modern, concise, natural Vietnamese dialogue, story, and databases,
completely replacing archaic wuxia/kiếm hiệp phrasing while keeping text concise to fit UI.
"""
import os
import sys
import zlib
import struct
import shutil

sys.stdout.reconfigure(encoding='utf-8')

def serialize_db(table):
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
    return buf

# ==========================================
# 1. DB0: Lời thoại Trùm (10 Boss Dialogues)
# ==========================================
DB0_VN = [
    [
        "1",
        "HÁ HÁ HÁ~ ",
        "Ta là Vua Zombie đây! ",
        "Ta sẽ biến ngươi thành xác sống, ",
        "để ngoan ngoãn phục tùng ta suốt đời!"
    ],
    [
        "2",
        "Hí hí, đến hỏi ",
        "bí quyết trẻ đẹp của ta à? ",
        "Bí quyết là biến ngươi thành cóc rồi",
        "nấu thành một nồi canh bồi bổ!!"
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
        "Hạ được em họ Vua Zombie của ta ",
        "mà tưởng ngon à? Ta mạnh hơn nó nhiều! ",
        "Đội quân xác ướp của ta sẽ chôn sống ngươi!",
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
        "To gan! Dám mở mồm chê ",
        "ta không xinh đẹp à? ",
        "Nếm thử Nụ Hôn Thần Chết của ta đi!!!",
        "0"
    ],
    [
        "10",
        "Đến được tận đây cũng khá đấy! ",
        "Nhưng cuộc chơi kết thúc rồi!! ",
        "Đến giờ tàn đời rồi nhóc!!!",
        "0"
    ]
]

# ========================================================
# 2. DB6: Binh Chủng Thú Tộc (9 Units Lore & Aura Skills)
# ========================================================
DB6_VN = [
    [
        "1",
        "Nhỏ con nhưng chớ coi thường!",
        "Từng quậy phá khắp đầu đường xó chợ,",
        "nay dũng cảm đứng lên giữ quê hương.",
        "0",
        "Trong hào quang: Phi thân áp sát,",
        "tấn công bất ngờ vào kẻ địch."
    ],
    [
        "2",
        "Xạ thủ cừ khôi với tầm bắn cực xa.",
        "Từng hiền lành, yêu chuộng hòa bình,",
        "nay chiến đấu bảo vệ cánh rừng xanh.",
        "0",
        "Trong hào quang: Bắn tên lửa",
        "xuyên thấu qua nhiều kẻ địch."
    ],
    [
        "3",
        "Chiến binh cầm thương tầm trung.",
        "Huấn luyện bài bản giữ hoàng cung,",
        "nay xông pha giữ yên bờ cõi.",
        "0",
        "Trong hào quang: Phóng thương",
        "gây sát thương cả đường bay."
    ],
    [
        "4",
        "Võ sĩ quyền anh với cú đấm thép.",
        "Luôn tìm kiếm đối thủ mạnh hơn,",
        "biến chiến trường thành võ đài.",
        "0",
        "Trong hào quang: Tung liên hoàn",
        "nhiều cú đấm cực mạnh cùng lúc."
    ],
    [
        "5",
        "Chiến binh giáp sắt che chở đồng đội.",
        "Vẻ ngoài dữ dằn nhưng rất tốt bụng!",
        "Không bị đánh lui khi trúng đòn.",
        "0",
        "Trong hào quang: Tăng gấp đôi",
        "khả năng phòng thủ."
    ],
    [
        "6",
        "Chuyên gia chất nổ diện rộng.",
        "Sử dụng thuốc súng uy lực,",
        "là đồng minh đắc lực của toàn đội.",
        "0",
        "Trong hào quang: Ném những quả bom",
        "có sức công phá cực mạnh."
    ],
    [
        "7",
        "Chiến binh càn quét bằng chùy gai.",
        "Sinh ra để chiến đấu,",
        "sẵn sàng húc bay mọi vật cản.",
        "0",
        "Trong hào quang: Lao thẳng tới",
        "và húc cực mạnh bằng sừng."
    ],
    [
        "8",
        "Nhà thông thái uyên bác ma thuật.",
        "Dùng phép đóng băng cản bước kẻ thù.",
        "0",
        "0",
        "Trong hào quang: Phép đóng băng",
        "trở nên uy lực hơn nhiều."
    ],
    [
        "9",
        "Cỗ máy phun lửa sống động đầy uy lực.",
        "Được muôn loài kính trọng",
        "nhờ lòng dũng cảm phi thường.",
        "0",
        "Trong hào quang: Ngọn lửa phun ra",
        "dữ dội với sức nóng cực lớn."
    ]
]

# ========================================================
# 3. DB4: Cửa Hàng, Gậy Phép, Nhẫn, Lời Thoại (83 rows)
# ========================================================
DB4_VN = [
    # 0: Fist of Fury Mace
    ["1", "Gậy Đấm Thần Lực", "Cú đấm xuyên 3 kẻ địch.", "Rất hiệu quả khi đánh từ xa.", "0"],
    # 1: Heal Mace
    ["2", "Gậy Hồi Máu", "Hồi máu cho bạn và quân lính.", "Vật phẩm sinh tử cần có!", "0"],
    # 2: Turn Undead Mace
    ["3", "Gậy Diệt Quái", "Có tỉ lệ hạ ngay lính xác sống.", "Quét sạch quái vật cực nhanh!", "0"],
    # 3: Ice Mace
    ["4", "Gậy Băng", "Đóng băng kẻ địch tức thì.", "Vô hiệu hóa quái vật nguy hiểm.", "0"],
    # 4: Lightning Mace
    ["5", "Gậy Sấm Sét", "Giáng tia sét xuống một vùng.", "Cực mạnh khi địch tụ tập đông.", "0"],
    # 5: Fire Mace
    ["6", "Gậy Lửa", "Phun lửa thiêu đốt kẻ địch gần.", "Rất hữu hiệu khi đánh áp sát.", "0"],
    # 6: Meteor Mace
    ["7", "Gậy Thiên Thạch", "Gọi thiên thạch từ trên trời.", "Sát thương cực lớn diện rộng.", "0"],
    # 7: Wind Mace
    ["8", "Gậy Gió Lốc", "Thổi lốc xoáy đẩy lùi kẻ địch.", "Đẩy lùi quái ra xa để giải nguy.", "0"],
    # 8: Food Mace
    ["9", "Gậy Lương Thực", "Đổi năng lượng ra lương thực.", "Giúp gọi quân nhanh chóng.", "0"],
    # 9: Poison Mace
    ["10", "Gậy Độc", "Thả khói độc rút máu địch từ từ.", "Rất hợp khi đối phó quái trâu.", "0"],
    # 10: Money Mace
    ["11", "Gậy Ném Vàng", "Tấn công địch bằng tiền vàng.", "Dùng được khi hết năng lượng.", "0"],
    # 11: Ring of Experience
    ["12", "Nhẫn Kinh Nghiệm", "Tăng kinh nghiệm nhận được.", "Giúp bạn lên cấp thật nhanh.", "0"],
    # 12: Ring of Wealth
    ["13", "Nhẫn Tiền Vàng", "Tăng lượng tiền vàng nhặt được.", "Món đồ tuyệt vời để làm giàu.", "0"],
    # 13: Ring of Fortune
    ["14", "Nhẫn May Mắn", "Tăng tỉ lệ nhặt trang bị xịn.", "Cần thiết khi đi săn đồ quý.", "0"],
    # 14: Ring of Vitality
    ["15", "Nhẫn Máu", "Tăng lượng máu tối đa.", "Giúp bạn sống sót lâu hơn.", "0"],
    # 15: Ring of Regeneration
    ["16", "Nhẫn Hồi Máu", "Tự động hồi máu theo thời gian.", "Hồi máu không cần dùng gậy.", "0"],
    # 16: Ring of Agility
    ["17", "Nhẫn Tốc Độ", "Tăng tốc độ di chuyển.", "Giúp chạy nhanh, cơ động hơn.", "0"],
    # 17: Ring of Mana
    ["18", "Nhẫn Năng Lượng", "Tăng lượng năng lượng tối đa.", "Tích năng lượng để dùng phép.", "0"],
    # 18: Ring of Prayer
    ["19", "Nhẫn Cầu Nguyện", "Tăng tốc độ hồi năng lượng.", "Hồi năng lượng để ra chiêu mau.", "0"],
    # 19: Ring of Cultivation
    ["20", "Nhẫn Lương Thực", "Tăng tốc độ làm ra lương thực.", "Giúp bạn gọi quân nhanh hơn.", "0"],
    # 20: Ring of Preservation
    ["21", "Nhẫn Kho Lương", "Tăng giới hạn chứa lương thực.", "Tích lương thực để gọi bầy quân.", "0"],

    # Pig Shopkeeper Chatter & Tips (Rows 21 to 35)
    ["22", "Tôi thích tiền vàng~ Éc éc~ ♬", "Tiền vào như nước, bán là có lời~", "Nhiều vàng là sướng nhất đời~", "Éc éc éc~"],
    ["23", "Mua rẻ bán đắt mới là làm giàu!", "Éc! Ối chà...", "Bạn vừa nghe thấy gì à?", "Quên đi giùm tôi nha~"],
    ["24", "Mua ủng hộ tôi món gì đi bạn ơi!", "Ở nhà đàn con đang đói bụng~", "Tôi nghèo lắm, tin tôi đi...", "Mấy thứ này toàn đồ tốt thôi à~"],
    ["25", "Để tôi đoán thử xem nào...", "Bạn tìm món này phải không?", "Mua ngay đi thôi nào!", "Tôi bớt giá hữu nghị cho~"],
    ["26", "Đừng mất công chờ quái vật", "rớt ra món đồ bạn cần!", "Cứ mua luôn thứ bạn muốn,", "ngay tại đây, lúc này nè!"],
    ["27", "Muốn sắp túi đồ gọn gàng hả?", "Hãy bấm vào hình chiếc nhẫn", "ở góc dưới bên trái kìa!", "Mọi thứ sẽ ngăn nắp ngay."],
    ["28", "Quân địch sẽ tràn ra ồ ạt", "khi căn cứ mất một nửa máu.", "Tích năng lượng để phòng thủ.", "Mua thêm Nhẫn Năng Lượng đi?"],
    ["29", "Nếu không gọi thêm được lính", "dù thanh lương thực đã đầy,", "đó là vì chạm trần dự trữ rồi.", "Hãy đeo Nhẫn Kho Lương nhé."],
    ["30", "Trang bị có nhiều cấp sao.", "Càng nhiều sao càng mạnh mẽ.", "Nếu ít sao cũng đừng lo,", "hãy dùng ngọc nâng cấp sao."],
    ["31", "Đừng nản lòng khi chỉ qua màn", "với kết quả 1 sao.", "Bạn có thể chơi lại lúc nào", "để cải thiện điểm số mà."],
    ["32", "Bán đồ cho tôi sẽ lỗ một chút.", "Buôn bán phải có lời chứ, éc!", "Lãi có tí xíu thôi hà!", "Tin tôi đi mà~"],
    ["33", "Cân nhắc kỹ trước khi bán nhé.", "Hãy chắc là bạn không cần nữa", "trước khi bán cho tôi.", "Tôi không cho chuộc lại đâu."],
    ["34", "Mở khóa lính mới cũng hay,", "nhưng nâng cấp lính hiện có", "cũng tăng sức mạnh rất nhiều,", "lại tiết kiệm chi phí hơn."],
    ["35", "Tích lũy thật nhiều lương thực", "rồi gọi cả đàn lính ra cùng lúc.", "Nhẫn Kho Lương rất hợp mẹo đó.", "Làm một chiếc đeo thử chứ?"],
    ["36", "Muốn nâng cấp lính hả?", "Thế thì nhầm chỗ rồi bạn ơi.", "Hãy nhìn sang bảng bên trái kìa,", "bên đó mới nâng cấp lính được."],

    # Pig Selection Dialogues (Rows 36 to 37)
    ["37", "Túi đồ của bạn đầy ắp rồi!", "Không nhét thêm được nữa đâu.", "Bán bớt đồ không dùng đi nha~", "0"],
    ["38", "Bạn thật sự muốn bán món này?", "Món này trông XỊN LẮM đấy.", "Bán rồi không lấy lại được đâu.", "Vẫn quyết định bán chứ?"],

    # Pig Buy Dialogues (Rows 38 to 40)
    ["39", "Giá này là hữu nghị lắm rồi đó.", "Bạn còn cần món gì nữa không?", "0", "0"],
    ["40", "Cảm ơn bạn rất nhiều!", "Lần sau lại ghé nữa nhé!", "0", "0"],
    ["41", "Cảm ơn bạn! Món đồ này", "rất hợp với bạn đấy!", "0", "0"],

    # Pig Sell Dialogues (Rows 41 to 43)
    ["42", "Giá này là tôi chịu lỗ luôn đó.", "Còn muốn bán món nào nữa?", "0", "0"],
    ["43", "Sáng suốt lắm! Giữ đống đồ", "không dùng chỉ chật túi thôi.", "0", "0"],
    ["44", "Cảm ơn bạn đã mua hàng!", "Còn muốn mua thêm món nào?", "0", "0"],

    # Equipment Inventory Descriptions in Hero Equip screen (Rows 44 to 64 - Max 260px)
    ["45", "Gậy Đấm Thần Lực", "Bắn cú đấm năng lượng", "xuyên qua 3 kẻ địch.", "Hiệu quả khi đánh từ xa."],
    ["46", "Gậy Hồi Máu", "Hồi máu cho Paladog", "và quân lính xung quanh.", "Còn máu là còn tất cả!"],
    ["47", "Gậy Diệt Quái", "Có tỉ lệ hạ gục tức thì", "kẻ địch xác sống.", "Quét sạch quái cực lẹ!"],
    ["48", "Gậy Băng", "Đóng băng địch tức thì.", "Rất hữu hiệu khống chế", "quái to xác và nguy hiểm."],
    ["49", "Gậy Sấm Sét", "Giáng sét cực mạnh", "xuống một vùng nhỏ, hợp", "khi quái tụ tập đông đảo."],
    ["50", "Gậy Lửa", "Phun lửa thiêu đốt kẻ thù.", "Tầm đánh khá ngắn nên", "cần giữ cự ly hợp lý."],
    ["51", "Gậy Thiên Thạch", "Gọi thiên thạch oanh tạc.", "Tốn nhiều năng lượng", "nhưng uy lực cực khủng!"],
    ["52", "Gậy Gió Lốc", "Thổi lốc xoáy cực mạnh.", "Không gây sát thương", "nhưng đẩy lùi địch ra xa."],
    ["53", "Gậy Lương Thực", "Chuyển hóa năng lượng", "ra lương thực gọi quân.", "Rất hữu ích khi cần gấp!"],
    ["54", "Gậy Độc", "Phun làn khói độc khiến", "kẻ địch rút máu từ từ.", "Rất hợp đánh quái trâu."],
    ["55", "Gậy Ném Vàng", "Dùng tiền vàng tấn công.", "Có thể xài bất cứ lúc nào,", "kể cả khi cạn năng lượng."],
    ["56", "Nhẫn Kinh Nghiệm", "Giúp bạn lên cấp nhanh.", "Muốn học nhiều kỹ năng,", "hãy đeo chiếc nhẫn này."],
    ["57", "Nhẫn Phú Quý", "Giúp bạn làm giàu nhanh.", "Nhặt được nhiều tiền hơn", "mỗi khi hạ gục kẻ địch."],
    ["58", "Nhẫn May Mắn", "Tăng tỉ lệ nhặt đồ xịn.", "Dùng để săn trang bị quý", "không bán trong tiệm."],
    ["59", "Nhẫn Sinh Lực", "Tăng lượng máu tối đa.", "Máu dồi dào là chìa khóa", "để sống sót trên trận địa!"],
    ["60", "Nhẫn Hồi Máu", "Tự động hồi máu từ từ.", "Máu hồi phục liên tục", "không cần dùng tới gậy."],
    ["61", "Nhẫn Tốc Độ", "Chạy cực nhanh nhẹn.", "Món đồ tuyệt vời nếu", "thích lối đánh cơ động."],
    ["62", "Nhẫn Năng Lượng", "Tăng năng lượng tối đa.", "Giúp tích trữ năng lượng", "để xả phép khi lâm trận."],
    ["63", "Nhẫn Cầu Nguyện", "Hồi năng lượng nhanh.", "Cần thiết để thi triển", "phép thuật liên tục."],
    ["64", "Nhẫn Thu Hoạch", "Làm lương thực nhanh.", "Giúp bạn gọi nhiều lính", "trong thời gian ngắn."],
    ["65", "Nhẫn Kho Lương", "Chứa nhiều lương thực.", "Xoay chuyển thế trận", "để gọi cả bầy quân ra!"],

    # Larva Tips & Advice (Rows 65 to 82 - Max 260px)
    ["66", "Lũ quái vật độc ác!!", "Chúng đã cướp mất", "ba mẹ của tôi!", "Tôi sẽ không tha thứ đâu!"],
    ["67", "Tôi ước mau lớn nhanh", "để sát cánh cùng bạn", "tiêu diệt lũ quái xấu xa!", "Tôi đang rèn luyện đây!"],
    ["68", "Kiểm tra kỹ trang bị", "trước khi ra trận nhé!", "Có gì chưa rõ cứ việc", "hỏi tôi bất cứ lúc nào!"],
    ["69", "Hồi xưa táo thơm ngọt", "nhiều vô kể luôn,", "giờ loạn lạc tìm một quả", "cũng khó khăn lắm."],
    ["70", "Nếu qua màn quá khó,", "hãy thử đổi trang bị khác", "thay vì chỉ chăm chăm", "nâng cấp quân lính."],
    ["71", "Muốn sắp xếp túi đồ hả?", "Bấm vào hình chiếc nhẫn", "ở góc dưới bên trái nhé!", "Mọi thứ sẽ gọn gàng."],
    ["72", "Muốn mua bán đổi đồ,", "hãy ghé tiệm bác Heo.", "Đồ xịn là con đường ngắn", "nhất tới chiến thắng!"],
    ["73", "Nhớ chạm vào đồ trước", "nếu muốn trang bị", "hoặc tháo ra nhé.", "Quy tắc cơ bản mà!"],
    ["74", "Vũ khí tùy bạn chọn,", "phối hợp cận chiến,", "tầm xa và hồi máu", "trận đánh dễ hơn nhiều."],
    ["75", "Nếu màn chơi quá khó,", "cày cấp ở màn dễ hơn", "cũng là một mẹo", "vô cùng hiệu quả đấy."],
    ["76", "Nếu túi đồ đã đầy,", "quái sẽ không rớt đồ nữa.", "Hãy bán bớt đồ thừa", "cho tiệm bác Heo nhé."],
    ["77", "Vừa vào trận chớ vội", "gọi lính ra ngay nhé.", "Đi lẻ một mình sẽ", "rất dễ bị tiêu diệt."],
    ["78", "Quân địch sẽ tràn ra", "khi căn cứ mất nửa máu.", "Hãy chuẩn bị sẵn sàng", "nghênh chiến nhé!"],
    ["79", "Mỗi tên trùm đều có", "chiến thuật riêng.", "Đừng dùng mãi một cách,", "hãy tính toán cẩn thận!"],
    ["80", "Lũ quái vật bắn xa", "rất nguy hiểm khi đông.", "Hãy diệt chúng từ sớm", "để tránh bị ép sân!"],
    ["81", "Quân lính mạnh hơn nhiều", "trong hào quang của bạn.", "Giữ họ trong vòng nhé.", "Mở rộng vòng rất tốt!"],
    ["82", "Kỹ năng của quân ta", "có thể đánh ngã địch.", "Nhớ là lính phải đứng", "khi đứng trong vòng thôi!"],
    ["83", "Paladog và Tướng Quỷ", "miễn nhiễm đánh lui,", "đóng băng hay chết liền.", "Nhớ kỹ điều này nhé!"]
]

# ========================================================
# 4. Patch Drawing.as strings
# ========================================================
DRAWING_REPLACEMENTS = {
    # Intro
    'Vào một tương lai xa xăm...': 'Vào một tương lai xa xôi...',
    'Lòng tham và sự ích kỷ tột cùng của nhân loại đã tàn phá': 'Loài người tham lam đã tàn phá thiên nhiên,',
    'Đất Mẹ, khiến chư thần không còn lựa chọn nào khác ngoài việc': 'khiến các vị thần trừng phạt',
    'tận diệt toàn bộ loài người trên mặt đất.': 'và xóa sổ loài người.',
    'Thay thế nhân loại, muôn loài được ban phát linh trí và': 'Thay thế con người, muôn thú được ban trí tuệ',
    'tự tay kiến tạo nền văn minh riêng. Chúng tôn kính tạo hóa': 'và cùng nhau xây dựng thế giới mới,',
    'và trải qua cả thiên niên kỷ trong thái bình thịnh trị.': 'sống yên bình suốt cả ngàn năm.',
    'Khác với nhân loại, muôn thú thuần khiết và hiếu hòa.': 'Muôn thú rất hiền lành và yêu hòa bình.',
    'Trong khi đó, ác ma chốn thâm uyên đang vùng vẫy tìm kiếm': 'Trong khi đó, lũ quỷ dữ đang chật vật',
    'tà niệm - thứ từng tràn ngập khắp nơi thuở loài người còn ngự trị.': 'tìm kiếm năng lượng xấu xa của con người.',
    'Cuối cùng, ma giới quyết định xua quân khai chiến,': 'Cuối cùng, lũ quỷ quyết định gây chiến,',
    'quyết thôn tính Thánh Địa Muôn Thú Critterland.': 'tấn công Vùng Đất Muôn Thú Critterland.',
    'Vốn chỉ quen với thái bình, muôn thú hoàn toàn không có phòng bị': 'Chưa từng biết chiến tranh, muôn thú không kịp phòng bị',
    'trước đao binh và bị tàn sát không chút xót thương.': 'và bị lũ quỷ dồn vào bước đường cùng.',
    'Thế giới chìm trong ma ảnh, vận mệnh giang sơn': 'Thế giới tràn ngập quái vật, số phận muôn loài',
    'ngàn cân treo sợi tóc.': 'trở nên vô cùng nguy ngập.',
    'Chính vào thời khắc tuyệt vọng nhất khi vạn vật sắp buông xuôi,': 'Ngay lúc tuyệt vọng nhất,',
    'một kỵ sĩ thánh điện xuất chúng đã từ trong bóng tối quật khởi': 'một hiệp sĩ đã đứng lên chiến đấu',
    'nghênh chiến vì nền hòa bình của Thú Giới...': 'bảo vệ vùng đất muôn thú...',
    'Danh xưng của ngài... chính là... Thánh Khuyển Paladog.': 'Đó chính là... Hiệp sĩ Paladog.',
    'Vận mệnh Thú Giới nay đặt trọn vào tay ngài.': 'Vùng đất muôn thú trông cậy vào bạn.',
    'Chúc ngài vạn sự hanh thông!': 'Chúc bạn may mắn!',

    # Epilogues
    'Thị Cương Thử Võ Sĩ đã rũ bỏ hoàn toàn quá khứ giang hồ.': 'Chuột đấu sĩ đã bỏ thói quậy phá,',
    'Chàng xây dựng một đại xưởng sản xuất phô mai thượng hạng': 'mở một xưởng làm phô mai thơm ngon',
    'nức tiếng thơm ngon bậc nhất Thú Giới.': 'nổi tiếng khắp Critterland.',
    'Thần Tiễn Thỏ Tộc an yên với cuộc sống thanh bình, cần mẫn gieo hạt': 'Thỏ cung thủ sống an bình, chăm chỉ trồng cây',
    'trồng cây để phục hồi sắc xanh cho đại ngàn năm xưa.': 'để phủ xanh lại những cánh rừng.',
    'Cấm Vệ Hùng Tướng ngày ngày nghiêm cẩn khổ luyện võ nghệ,': 'Gấu cận vệ tự rèn luyện bản thân mỗi ngày',
    'thề quyết bảo vệ giang sơn, ngăn chặn hiểm họa đao binh tái diễn.': 'để bảo vệ hòa bình cho muôn loài.',
    'Quyền Tông Chuột Túi một lần nữa cất bước đăng trình,': 'Chuột túi quyền anh lại tiếp tục lên đường,',
    'bôn ba khắp thiên hạ để truy cầu những đối thủ xứng tầm đỉnh cao.': 'tìm kiếm những đối thủ mạnh mẽ hơn.',
    'Huyền Vũ Thiết Quy thong dong trở về với đại dương bao la,': 'Rùa phòng thủ trở về với biển cả quê hương,',
    'kể lại thiên hùng ca viễn chinh cho đồng tộc cùng lắng nghe.': 'vui vẻ kể lại chuyến phiêu lưu cho bạn bè nghe.',
    'Hải Tặc Hầu Vương giong buồm ra khơi cùng tấm hải đồ kho báu': 'Khỉ hải tặc giương buồm ra khơi tìm kho báu',
    'mà chàng được triều đình ban thưởng sau đại chiến thắng lợi.': 'theo tấm bản đồ được tặng thưởng.',
    'Thiết Kỵ Tê Giác ngày đêm tu tâm dưỡng tính,': 'Tê giác sắt kiên trì rèn luyện',
    'rèn luyện để kiềm chế bản tính hiếu chiến hung hăng của mình.': 'để kiềm chế tính nóng nảy của mình.',
    'Hàn Băng Pháp Xí chính thức phong ấn Hàn Băng Trượng': 'Cánh cụt pháp sư cất gậy phép,',
    'trở về Thần Bí Ma Pháp Học Viện tiếp tục nghiên cứu đạo thuật.': 'trở về học viện tiếp tục nghiên cứu ma thuật.',
    'Hồng Long Thần Thú hoàn tất sứ mệnh viễn chinh tại Thú Giới,': 'Rồng hồng kết thúc chuyến phiêu lưu',
    'đắc thắng vỗ cánh phi thăng trở về Thánh Địa Long Tộc.': 'và bay trở về vùng đất của loài rồng.',
    'Và Thánh Khuyển Paladog đã kết duyên cùng công chúa kiều diễm,': 'Và Paladog đã cưới nàng công chúa xinh đẹp,',
    'sống hạnh phúc viên mãn trọn đời bên nhau cùng': 'sống hạnh phúc trọn đời bên nhau cùng',
    'sáu trang nam tử và sáu đấng kiều nữ tài hoa.': 'sáu người con trai và sáu người con gái.',

    # Dialogues & UI Prompts
    'Toàn bộ dữ liệu tại ô đã chọn sẽ bị xóa sạch.': 'Dữ liệu ở ô đã chọn sẽ bị xóa.',
    'Đại hiệp có chắc chắn muốn tiếp tục?': 'Bạn có chắc muốn tiếp tục không?',
    'Đón lấy Tuyệt Kỹ Thần Cầu của ta đây!!': 'Đỡ cú sút siêu mạnh của ta đây!!',
    'Hãy tiến thẳng tới ma thành': 'Cùng tiến vào lâu đài',
    'tru diệt Hắc Ám Ma Vương!': 'đánh bại Chúa Tể Hắc Ám nào!',
    'Chìa Khóa Ma Thành!!': 'Chìa Khóa Lâu Đài!!',
    'Đây chính là chiếc chìa khóa thần bí': 'Đây là chiếc chìa khóa',
    'dùng để khai mở cổng Hắc Ám Ma Thành!': 'để mở cổng Lâu Đài Hắc Ám!',
    'Ta thấy bóng dáng hắn đằng kia,': 'Hắn kìa, ở đằng kia,',
    'ngay tại Băng Phong Hẻm!!': 'ngay tại Hẻm Núi Băng!!',
    'Quét sạch quái vật, bảo vệ Vùng Đất Muôn Thú!!': 'Đánh bại quái vật, bảo vệ muôn loài!!',
    'Tôi sẵn sàng hy sinh thân mình': 'Tôi sẵn sàng chiến đấu',
    'để đem lại hòa bình cho muôn thú!': 'để bảo vệ hòa bình cho muôn thú!',
    'MUÔN THÚ VẠN TUẾ!!!': 'TIẾN LÊN NÀO!!!',
    'Tôi chẳng mấy bận tâm thế sự đâu,': 'Tôi chẳng quan tâm nhiều đâu,',
    'nhưng đã nhận thù lao thì tôi sẽ hạ trùm!': 'nhưng đã nhận tiền thì tôi sẽ hạ trùm!',
    'Nhanh xong trận để tôi đi tìm kho báu! He he!': 'Xong sớm để tôi đi tìm kho báu! He he!',
    'Vùng đất này quá ít trộm cướp,': 'Vùng đất này quá ít cướp bóc,',
    'khiến tôi chưa trổ hết tài nghệ!!': 'khiến tôi chưa trổ hết tài năng!!'
}

def main():
    print("=== 1. Updating Drawing.as ===")
    drawing_path = 'extracted/scripts/scripts/com/fazecat/web/paladog/Drawing.as'
    with open(drawing_path, 'r', encoding='utf-8', errors='ignore') as f:
        code = f.read()

    cnt = 0
    for src, dst in DRAWING_REPLACEMENTS.items():
        if src in code:
            code = code.replace(src, dst)
            cnt += 1
        else:
            print(f"Notice: '{src}' not found (might already be replaced)")

    with open(drawing_path, 'w', encoding='utf-8') as f:
        f.write(code)
    print(f"Patched {cnt} phrases in Drawing.as")

    print("\n=== 2. Serializing Databases ===")
    dbs = [
        (0, DB0_VN, '408_com.fazecat.web.paladog.Library_DB0.bin'),
        (4, DB4_VN, '416_com.fazecat.web.paladog.Library_DB4.bin'),
        (6, DB6_VN, '420_com.fazecat.web.paladog.Library_DB6.bin')
    ]

    for num, table, bin_name in dbs:
        raw_buf = serialize_db(table)
        zlib_buf = zlib.compress(raw_buf)

        # 1. extracted/binaryData/ (compressed)
        comp_path = f'extracted/binaryData/{bin_name}'
        with open(comp_path, 'wb') as f:
            f.write(zlib_buf)
        print(f"Saved {comp_path} (compressed {len(zlib_buf)} bytes)")

        # 2. native_port/assets/data/ (decompressed raw)
        nat_data_path = f'native_port/assets/data/db_{num}.bin'
        with open(nat_data_path, 'wb') as f:
            f.write(raw_buf)
        print(f"Saved {nat_data_path} (raw {len(raw_buf)} bytes)")

        # 3. native_port/dist/r36s/paladog/assets/data/ (decompressed raw)
        r36s_data_path = f'native_port/dist/r36s/paladog/assets/data/db_{num}.bin'
        if os.path.exists(os.path.dirname(r36s_data_path)):
            with open(r36s_data_path, 'wb') as f:
                f.write(raw_buf)
            print(f"Saved {r36s_data_path}")

    print("\nAll modern Vietnamese localizations updated successfully!")

if __name__ == '__main__':
    main()
