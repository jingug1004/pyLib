import random

normal_variate = []
gamma = []

a01 = []
a02 = []

for i in range(10):
    a01 = normal_variate.append(random.normalvariate(0, 1))
    a02 = gamma.append(random.gammavariate(3, 1))

print(a01)
print(a02)
