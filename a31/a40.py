import pytz
from datetime import datetime
fmt = '%Y-%m-%d %H:%M:%S %Z%z'
seoul = pytz.timezone('Asia/Seoul')
eastern = pytz.timezone('US/Eastern')

seoul_dt = seoul.localize(datetime(2015, 3, 1, 17, 22))
print(seoul_dt)

jan = datetime(2015, 1, 1)
jun = datetime(2015, 6, 1)
a01 = eastern.utcoffset(jan)
print(a01)
a01 = eastern.utcoffset(jun)
print(a01)
a01 = eastern.dst(jan)
print(a01)
a01 = eastern.dst(jun)
print(a01)
a01 = eastern.tzname(jun)
print(a01)
a01 = eastern.tzname(jan)
print(a01)
