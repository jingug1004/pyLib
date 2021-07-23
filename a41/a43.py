import collections

d = {'spam': 1}

def value():
    return 'default-value'

e = collections.defaultdict(value, spam = 100)
print(e)
print(e['ham'])

f = collections.defaultdict(int)
print(f['spam'])

g = collections.defaultdict(list)
print(g['spam'])
g['sapm2345'].append(100)
g['sapm1235'].append(200)
print(g['spam'])

g['spam'].append(100)
g['spam'].append(200)
print(g['spam'])
print(g)

h = collections.defaultdict(int)
h['spam'] += 100
print(h)

