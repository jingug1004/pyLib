from datetime import datetime, date, time, timedelta

today = date.today()
print(today)

newyearsday = date(2017, 1, 1)
print(newyearsday - today)

week = timedelta(days=7)
print(today + week)

print(today + week * 2)

print(today - week)
