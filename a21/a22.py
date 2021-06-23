import statistics

data = [1, 2, 3, 4, 5, 6]
b01 = statistics.pstdev(data)
print(b01)
b01 = statistics.stdev(data)
print(b01)
b01 = statistics.pvariance(data)
print(b01)
b01 = statistics.variance(data)
print(b01)
