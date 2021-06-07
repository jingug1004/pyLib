from decimal import *

exp = Decimal((0, (1, 0), -1))

a01 = Decimal('1.04').quantize(exp, rounding=ROUND_UP)
print(a01)
a01 = Decimal('1.06').quantize(exp, rounding=ROUND_HALF_DOWN)
print(a01)
a01 = Decimal('1.15').quantize(exp, rounding=ROUND_HALF_EVEN)
print(a01)
a01 = Decimal('1.25').quantize(exp, rounding=ROUND_HALF_EVEN)
print(a01)
a01 = Decimal('1.26').quantize(exp, rounding=ROUND_HALF_EVEN)
print(a01)
a01 = Decimal('1.55').quantize(exp, rounding=ROUND_05UP)
print(a01)
a01 = Decimal('1.75').quantize(exp, rounding=ROUND_05UP)
print(a01)
