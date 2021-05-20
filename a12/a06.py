import unicodedata
a06 = unicodedata.normalize('NFC', '한글Aㅁ11@')
print(a06)
a06 = unicodedata.normalize('NFKC', '한글Aㅁ11@')
print(a06)

