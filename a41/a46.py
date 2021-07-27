import heapq

queue = []

heapq.heappush(queue, 2)
print(queue)
heapq.heappush(queue, 1)
print(queue)
heapq.heappush(queue, 0)
print(queue)
heapq.heappop(queue)
print(queue)
print('-----------------------------------------------------------')

heapq.heappop(queue)
print(queue)
a01 = heapq.heappop(queue)
print(a01)
print(queue)
# heapq.heappop(queue)
# print(queue)

