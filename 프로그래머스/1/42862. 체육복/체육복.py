def solution(n, lost, reserve):
    answer = 0
    l = [1] * (n + 2)
    for x in lost:
        l[x] -= 1
    for j in reserve:
        l[j] += 1
    for i in range(1, n + 2):
        if l[i] == 2 and l[i - 1] == 0:
            l[i - 1:i + 1] = [1, 1]
        elif l[i] == 2 and l[i + 1] == 0:
            l[i:i + 2] = [1, 1]
        else:
            continue;
    for i in l:
        if i > 0:
            answer += 1
    return answer - 2