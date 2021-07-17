import pytz
from datetime import datetime

a01 = pytz.country_timezones['nz']
print(a01)
a01 = len(pytz.all_timezones)
print(a01)
a01 = len(pytz.common_timezones)
print(a01)
a01 = 'Singapore' in pytz.all_timezones_set
print(a01)
a01 = 'Singapore' in pytz.common_timezones_set
print(a01)
a01 = 'Asia/Singapore' in pytz.common_timezones_set
print(a01)

