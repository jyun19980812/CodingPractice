from collections import deque

def solution(priorities, location):
    loc_q = deque()
    answer = 0
    for i, element in enumerate(priorities):
        loc_q.append([element, i])
    sorted_q = deque(sorted(priorities, reverse=True))
    while loc_q:
        x = loc_q.popleft()
        if x[0] == sorted_q[0]:
            sorted_q.popleft()
            answer += 1
            if x[1] == location:
                return answer
        else:
            loc_q.append(x)     
    return ""
    