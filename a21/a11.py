from decimal import Decimal

a01 = Decimal('1')
print(a01)
a01 = Decimal(3.14)
print(a01)
a01 = Decimal((0, (3, 1, 4), -2))
print(a01)
a01 = Decimal((1, (1, 4, 1, 4), -3))
print(a01)

a01 = Decimal('1.1') - Decimal('0.1')
print(a01)
x = Decimal('1.2')
y = Decimal('0.25')
print(x + y)

from decimal import getcontext
xx = Decimal('10')
yy = Decimal('3')
print(xx / yy)
getcontext().prec = 8
print(xx / yy)

print(x + 1.0)
