import re
regex = re.compile('[a-n]+')
print(type(regex))
a1203 = regex.search('python')
print(a1203)
a1203 = regex.match('python')
print(a1203)
a1203 = regex.fullmatch('eggs')
print(a1203)
a1203 = regex.fullmatch('egg')
print(a1203)

regex2 = re.compile('[-+()]')
print(type(regex2))
a1203 = regex2.split('080-1234-5678')
print(a1203)
a1203 = regex2.split('(080)1234-5678')
print(a1203)
a1203 = regex2.split('+81-80-1234-5678')
print(a1203)
a1203 = regex2.split('81-80-1234-5678')
print(a1203)
a1203 = regex2.sub('', '+81-80-1234-5678')
print(a1203)

regex3 = re.compile('\d+')
a1203 = regex3.findall('080-1234-5678')
print(a1203)
for m in regex3.finditer('+81-80-1234-5678'):
    print(m)









