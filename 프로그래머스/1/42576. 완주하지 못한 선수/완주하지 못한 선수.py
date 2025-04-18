def solution(participant, completion):
    answer = ''
    d = {}
    for i in participant:
        d[i] = d.get(i, 0) + 1
    for c in completion:
        d[c] -= 1
    for k, v in d.items():
        if v > 0:
            answer = k
    return answer