# -*- coding: utf-8 -*-
"""
tune_db4_vietnamese.py
Crafts and validates all 83 rows of DB4_VN with exact width measurements.
"""
import sys
from PIL import ImageFont

sys.stdout.reconfigure(encoding='utf-8')

font_path = 'native_port/assets/fonts/BeVietnamPro-Bold.ttf'
font = ImageFont.truetype(font_path, 20)

def get_w(s):
    bbox = font.getbbox(s)
    return bbox[2] - bbox[0]

NEW_DB4_VN = [
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

print(f"Total rows: {len(NEW_DB4_VN)} (expected 83)")
assert len(NEW_DB4_VN) == 83, f"Expected 83 rows, got {len(NEW_DB4_VN)}"

pig_over = []
larva_over = []

for idx, r in enumerate(NEW_DB4_VN):
    assert len(r) == 5, f"Row {idx} has {len(r)} elements instead of 5: {r}"
    is_larva = (idx >= 44)
    limit = 260 if is_larva else 330
    
    for c_idx, line in enumerate(r[1:]):
        if line == '0':
            continue
        width = get_w(line)
        if width > limit:
            if is_larva:
                larva_over.append((idx, c_idx + 1, width, limit, line))
            else:
                pig_over.append((idx, c_idx + 1, width, limit, line))

print(f"Pig Store overflows (> 330px): {len(pig_over)}")
for o in pig_over:
    print(f"  Row {o[0]:02d} col {o[1]} ({o[2]}px > {o[3]}px): '{o[4]}'")

print(f"Larva Store overflows (> 260px): {len(larva_over)}")
for o in larva_over:
    print(f"  Row {o[0]:02d} col {o[1]} ({o[2]}px > {o[3]}px): '{o[4]}'")

if not pig_over and not larva_over:
    print("\nPERFECT! ALL 83 ROWS FIT 100% WITHIN DESIGN BOUNDARIES WITH 0 OVERFLOW!")
