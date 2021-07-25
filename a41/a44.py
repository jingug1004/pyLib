import collections

Coordinate = collections.namedtuple('Coordinate1', 'X, Y, Z')
c1 = Coordinate(100, -50, 200)
print(c1)
print(c1.X)
