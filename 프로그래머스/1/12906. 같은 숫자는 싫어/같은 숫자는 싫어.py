# for loop으로 arr를 돌면서 answer에 숫자 집어 넣기
# 만약, 숫자가 마지막 숫자와 같을 경우, ignore
def solution(arr):
    answer = [arr[0]]
    for i in range(1, len(arr)):
        if answer[-1] == arr[i]:
            continue;
        else:
            answer.append(arr[i])
    return answer