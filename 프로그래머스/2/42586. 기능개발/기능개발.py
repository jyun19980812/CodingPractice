import math

def solution(progresses, speeds):
    p = progresses[0]
    s = speeds[0]
    publish = math.ceil((100-p) / s)
    count = 1
    answer = []
    for i in range(1, len(progresses)):
        p = progresses[i]
        s = speeds[i]
        next_p = math.ceil((100-p) / s)
        if publish >= next_p:
            count += 1;
        else:
            publish = next_p
            answer.append(count)
            count = 1
    answer.append(count)
    return answer