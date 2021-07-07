import time

local = time.localtime()
utc = time.gmtime()
print(local.tm_mday)
print(local.tm_hour)
print(utc.tm_mday)
print(utc.tm_hour)