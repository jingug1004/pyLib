from dateutil.parser import parse
from datetime import datetime

parse('2015/06/23 12:34:56')
print(parse('2015/06/23 12:34:56'))
print(parse('20150623'))
print(parse('20150623123456'))
print(parse('Tue, 23 Jun 2015 12:34:56 KST'))
print(parse('Tue, 23 Jun 2015 12:34:56 GMT'))

print('---------------------------------------------------')
default = datetime(2015, 7, 5)
print(parse('Tue, 23 Jun 2015 12:34:56', default=default))
print(parse('Tue 12:34:56', default=default))
print(parse('12:34:56', default=default))
print(parse('12:34', default=default))

print('---------------------------------------------------')
print(parse('1/2/3'))
print(parse('1/2/3', dayfirst=True))
print(parse('1/2/3', yearfirst=True))
print(parse('15/2/3'))
print(parse('15/2/3', yearfirst=True))
