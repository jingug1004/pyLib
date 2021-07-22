import collections

d1 = {'spam': 1}
d2 = {'ham': 2}
c = collections.ChainMap(d1, d2)
c1 = collections.ChainMap(d1, d2)
print(c['spam'])
print(c['ham'])

print('----------------------------------------------------')
c1['bacon'] = 3
print(d1)
print(d2)
c1.clear()
print(d1)
