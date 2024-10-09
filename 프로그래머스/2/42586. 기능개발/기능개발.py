def solution(progresses, speeds):
    answer = []
    time = 0
    count = 0
    while len(progresses) > 0:
        if progresses[0] + speeds[0] * time < 100:
            if count > 0:
                answer.append(count)
                count = 0
            time += 1
        else:
            progresses.pop(0)
            speeds.pop(0)
            count += 1
    answer.append(count)
    return answer

