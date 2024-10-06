def solution(clothes):
    answer = 1
    d = {}
    for cloth in clothes:
        d[cloth[1]] = d.get(cloth[1], 0) + 1
    print(d.values())
    for count in d.values():
        answer *= count + 1
    return answer - 1