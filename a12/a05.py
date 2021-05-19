import unicodedata
a05 = unicodedata.lookup('LATIN SMALL LETTER B')
print(a05)

for chr in ('A', 'A', '1', '1', 'ㄱ', '가'):
    print(unicodedata.name(chr))

a05 = unicodedata.lookup('UNKNOWN CHARACTER')
print(a05)