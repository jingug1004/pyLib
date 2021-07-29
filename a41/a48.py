import bisect

seq = [0, 1, 2, 2, 3, 4, 5]
a01 = bisect.bisect_left(seq, 2)
print(a01)
a02 = bisect.bisect_right(seq, 2)
print(a02)
