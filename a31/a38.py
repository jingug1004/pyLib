from dateutil.relativedelta import relativedelta
from datetime import datetime, date

now = datetime.now()
print(now)

today = date.today()
print(today)

a01 = now + relativedelta(months=+1)
print(a01)
a01 = now + relativedelta(months=-1, weeks=+1)
print(a01)
a01 = now + relativedelta(months=+1, hour=10)
print(a01)

print('----------------------------------------------------------------------------------------------------')

from dateutil.relativedelta import MO, TU, WE, TH, FR, SA, SU
b01 = now + relativedelta(weekday=FR)
print(b01)
b01 = now + relativedelta(day=31, weekday=FR(-1))
print(b01)
b01 = now + relativedelta(day=31, weekday=TU(+1))
print(b01)
b01 = now + relativedelta(days=+1, weekday=TU(+1))
print(b01)
b01 = now + relativedelta(days=+3, weekday=TU(+1))
print(b01)

print('----------------------------------------------------------------------------------------------------')

c01 = date(2015, 1, 1) + relativedelta(yearday=100)
print(c01)
c01 = date(2015, 12, 31) + relativedelta(yearday=100)
print(c01)
c01 = date(2012, 1, 1) + relativedelta(yearday=100)
print(c01)
c01 = date(2012, 1, 1) + relativedelta(nlyearday=100)
print(c01)

print('----------------------------------------------------------------------------------------------------')

d01 = relativedelta(date(2021, 1, 1), today)
print(d01)
d01 = relativedelta(date(2020, 1, 1), today)
print(d01)
d01 = relativedelta(today, date(2020, 1, 1))
print(d01)
d01 = relativedelta(date(2022, 1, 1), today)
print(d01)
d01 = relativedelta(date(2023, 1, 1), today)
print(d01)

