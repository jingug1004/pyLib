import random

a01 = random.random()
print(a01)
a01 = random.randint(1, 5)
print(a01)
a01 = random.uniform(1, 5)
print(a01)

random.seed(10)
a01 = random.random()
print(a01)
random.seed(10)
a01 = random.random()
print(a01)
a01 = random.random()
print(a01)
