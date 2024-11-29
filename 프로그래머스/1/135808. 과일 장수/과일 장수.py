# score에서 1상자마다 각 사과의 최댓값으로 담아서 최대 이익을 내기
# score 먼저 sort하고 그동안 m만큼 for loop으로 도는데, 이때 스코어의 길이를 m으로 나눠주기
# 그 이후 박스에 사과를 개수에 맞춰 담고, 이미 정렬이 되있을것이기 때문에 박스에서 가장 마지막 숫자가 최솟값
# 즉, 이걸 식에 맞춰 계산해 answer에 더해주기

def solution(k, m, score):
    answer = 0
    score = sorted(score, reverse=True)
    for i in range(len(score)//m):
        box = score[m * i : m * (i + 1)]
        answer += box[-1] * m
    return answer