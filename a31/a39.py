from dateutil.rrule import rrule
from dateutil.rrule import DAILY, WEEKLY, MONTHLY
from dateutil.rrule import MO, TU, WE, TH, FR, SA, SU
from datetime import datetime

import pprint
import sys

start = datetime(2015, 6, 28)

c04 = list(rrule(DAILY, count=5, dtstart=start))
print(c04)
c04 = list(rrule(DAILY, dtstart=start, until=datetime(2015, 7, 1)))
print(c04)
c04 = list(rrule(WEEKLY, count=8, wkst=SU, byweekday=(TU, TH), dtstart=start))
print(c04)
c04 = list(rrule(MONTHLY, count=3, byweekday=FR(-1), dtstart=start))
print(c04)
c04 = list(rrule(WEEKLY, interval=2, count=3, dtstart=start))
print(c04)
