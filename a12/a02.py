import re
a12 = re.search('\w', '가나다라마ABC')
print(a12)
a12 = re.search('\w', 'ABC가나다라마')
print(a12)

a12 = re.search('\w', '가나다라마ABC', flags=re.A)
print(a12)
a12 = re.search('\w', 'ABC가나다라마', flags=re.A)
print(a12)

a12 = re.search('[abc]+', 'ABC')
print(a12)
a12 = re.search('[abc]+', 'ABC', re.I)
print(a12)

a12 = re.match('a.c', 'A\nC', re.I)
print(a12)
a12 = re.match('a.c', 'A\nC', re.I | re.S)
print(a12)

