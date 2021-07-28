import heapq

queue = [1, 2, 3, 4, 5]
heapq.heapify(queue)
print(queue, ' // ', heapq)
heapq.heappushpop(queue, 6)
print(queue, ' // ', heapq)
heapq.heappushpop(queue, 7)
print(queue, ' // ', heapq)

