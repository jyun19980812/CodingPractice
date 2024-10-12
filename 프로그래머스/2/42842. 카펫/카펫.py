import math
def solution(brown, yellow):    
    area = brown + yellow
    l = []
    answer = []
    for h in range(2, area + 1):
        if area % h == 0:
            l.append(h)
    for h in l:
        w = area // h
        if (h - 2) * (w - 2) == yellow:
            answer = [h, w]
    return answer