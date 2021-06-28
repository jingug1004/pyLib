from datetime import time

print(time())
c03 = time(16, 12, 25)
print(c03)
c03 = time(minute=10)
print(c03)
c03 = time(second=10)
print(c03)
c03 = time(microsecond=10)
print(c03)

now = time(16, 12, 15)
print(now.hour, now.minute, now.second, now.microsecond)
print(now.isoformat())
print(now.strftime('%H:%M'))
print(str(now))
