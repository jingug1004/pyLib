import random

l = [1, 2, 3, 4, 5]
b01 = random.choice(l)
print(b01)
b01 = random.choice(l)
print(b01)
b01 = random.sample(l, 2)
print(b01)
b01 = random.sample(l, len(l))
print(b01)
b01 = random.shuffle(l)
print(b01)
print(l)
