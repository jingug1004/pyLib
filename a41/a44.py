import collections

d = collections.OrderedDict()
d['spam'] = 100
d['ham'] = 200

for key in d:
    print(key)

e = collections.OrderedDict([('spam', 100), ('ham', 200)])
print(e)
f = collections.OrderedDict({'spam': 100, 'ham': 200})
print(f)
g = collections.OrderedDict(spam=100, ham=200)
print(g)
