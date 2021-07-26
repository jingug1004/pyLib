import collections

deq = collections.deque('spam')
print(deq)
print(deq[1])

deq[1] = 'P'
print(deq)

# deq[1:-1]

deq2 = collections.deque(maxlen=5)
for v in range(10):
    deq2.append(v)
    if len(deq2) >= 5:
        print(list(deq2), sum(deq2) / 5)

deq3 = collections.deque('12345')
print(deq3)
deq3.rotate(4)
print(deq3)
deq3.rotate(-4)
print(deq3)
print('--------------------------------------------------------------')

deq4 = collections.deque('12345')
first = deq4.popleft()
print(first)
deq4.rotate(-1)
print(deq4)
deq4.appendleft(first)
print(deq4)
deq4.rotate(1)
print(deq4)
