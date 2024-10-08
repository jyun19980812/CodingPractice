def solution(participant, completion):
    answer = ''
    d = {}
    for name in participant:
        d[name] = d.get(name, 0) + 1
    for n in completion:
        d[n] -= 1
    for k, v in d.items():
        if v > 0:
            answer = k
    return answer