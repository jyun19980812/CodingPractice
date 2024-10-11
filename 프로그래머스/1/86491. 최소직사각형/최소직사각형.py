def solution(sizes):
    answer = 0
    x = []
    y = []
    for size in sizes:
        x.append(max(size))
        y.append(min(size))
    answer = max(x) * max(y)    
    return answer