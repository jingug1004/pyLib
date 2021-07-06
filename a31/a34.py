import time

print(time.strftime('%Y-%m-%d', time.localtime()))
print(time.time())

print(time.struct_time(tm_year=2016, tm_mon=3, tm_mday=11, tm_hour=9, tm_min=0, tm_sec=56, tm_wday=4, tm_yday=72,
                       tm_isdst=0))

