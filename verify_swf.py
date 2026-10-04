import zlib

with open('Paladog_VN.swf', 'rb') as f:
    f.seek(8)
    data = zlib.decompress(f.read())

samples = [
    'Thánh Khuyển Paladog',
    'Tang Thi Ma Vương',
    'Cuồng Nộ Quyền Trượng',
    'Thị Cương Thử Võ Sĩ',
    'Độ Khó Trò Chơi',
    'Chìa Khóa Ma Thành!!'
]

for s in samples:
    b = s.encode('utf-8')
    found = b in data
    status = 'FOUND!' if found else 'NOT FOUND!'
    print(f"Check sample {samples.index(s)+1}: {status}")
