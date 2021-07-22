import collections

c = collections.Counter()

c['spam'] += 1
c[100] += 1
c[200] += 1
c[300] += 1
print(c)
print('--------------------------------------------')

counter = collections.Counter(
    [1, 2, 3, 1, 2, 1, 2, 1]
)
print(counter)
print(counter['spam'])
counter['spam'] += 1
print(counter)
print('--------------------------------------------')

counter1 = collections.Counter(spam=1, ham=2)
counter2 = collections.Counter(ham=3, egg=4)
print(counter1 + counter2)
print(counter1 - counter2)
print(counter1 & counter2)
print(counter1 | counter2)
counter1 += counter2
print(counter1)

counter3 = collections.Counter(spam=-1, ham=2)
counter4 = collections.Counter(ham=2, egg=-3)
print(counter3 + counter4)
print(counter3 - counter4)

print(+counter3)
print(-counter3)
