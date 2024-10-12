from itertools import permutations
import math

def solution(numbers):
    s = set()
    all_numbers = []
    number_list = []
    cnt = 0
    for n in numbers:
        number_list.append(n)
    for i in range(1, len(number_list)+1):
        numbers_len_i = list(permutations(number_list, i))
        for j in numbers_len_i:
            s.add(int(''.join(j)))
    l = list(s)
    for i in l:
        flag = True
        for j in range(2, int(math.sqrt(i)) + 1):
            if i % j == 0 or i == 1:
                flag = False
                break;
        if flag == True and (i != 1 and i != 0):
            cnt += 1
    return cnt