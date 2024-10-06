def solution(phone_book):
    answer = True
    d = {}
    for p in phone_book:
        d[p] = 1
    for phone in phone_book:
        repeat = ''
        for i in phone:
            repeat += i;
            if repeat in d and repeat != phone:
                answer = False;
    return answer