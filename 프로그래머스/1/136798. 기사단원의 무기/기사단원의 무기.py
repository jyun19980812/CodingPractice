# 자신의 기사 번호 약수 개수의 해당하는 공격력을 가진 무기의 철의 무게 출력
# 리스트를 하나 만들어서
# for loop 2개를 써서 각 숫자마다 약수 개수 카운트, 이후 리스트 저장
# 이후 리스트를 루프로 돌며 제한 수치를 넘지 않는지 확인, 넘으면 파워로 저장해서 더하기
def solution(number, limit, power):
    answer = 0
    for i in range(1, number + 1):
        cnt = 0
        interval = int((i)**0.5)
        for j in range(1, interval+1):
            if i % j == 0:
                if i == j**2:
                    cnt += 1
                else:
                    cnt += 2
        if cnt <= limit:
            answer += cnt
        else:
            answer += power
    return answer