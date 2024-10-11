def solution(answers):
    answer = []
    a = [1, 2, 3, 4, 5]
    b = [2, 1, 2, 3, 2, 4, 2, 5]
    c = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    hash = {}
    for i in range(len(answers)):
        if answers[i] == a[i % 5]:
            hash[1] = hash.get(1, 0) + 1
        if answers[i] == b[i % 8]:
            hash[2] = hash.get(2, 0) + 1
        if answers[i] == c[i % 10]:
            hash[3] = hash.get(3, 0) + 1
    maximum = max(hash.values())
    for k,v in hash.items():
        if v == maximum:
            answer.append(k)
    return sorted(answer)