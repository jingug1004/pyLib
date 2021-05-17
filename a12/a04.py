import re

regex = re.compile('(\d+)-(\d+)-(\d+)')
print(type(regex))
print(regex.match('080-1234-5678'))
m = regex.match('080-1234-5678')
print(m)
print(m.group())

print('------------------------------------------------------------------------')

m.group(1), m.group(2), m.group(3)
print(m)
print(m.group())
print(m.group(1))
print(m.group(2))
print(m.group(3))

print('------------------------------------------------------------------------')

regex2 = re.compile(r'(?P<first>\w+) (?P<last>\w+)')
m2 = regex2.match('Takanori Suzuki: PyCon JP Chair')
print(m2)
m2.group(0)
print(m2.group(0))
m2.group('first'), m2.group('last')
print(m2.group('first'))
print(m2.group('last'))

print('------------------------------------------------------------------------')

m3 = regex2.match('Takanori Suzuki: #kabepy Founder')
print(m3)
print(m3.groups())
print(m3.groupdict())
print(m3.expand(r'last: \2, first: \1'))
print(m3.expand(r'last: \g<last>, first: \g<first>'))

