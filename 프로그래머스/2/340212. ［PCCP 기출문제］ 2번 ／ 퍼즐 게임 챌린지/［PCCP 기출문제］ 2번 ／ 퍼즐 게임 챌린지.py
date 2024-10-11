def search(diff, time_cur, time_prev, level):
    if level >= diff:
        return time_cur;
    else:
        time_consumed = (time_cur + time_prev) * (diff - level) + time_cur
        return time_consumed

def solution(diffs, times, limit):
    max_level = max(diffs)
    min_level = 1
    while min_level < max_level:
        mid_level = (max_level + min_level) // 2
        mid_total = 0
        for i in range(len(diffs)):
            if not i:
                time_prev = 0
            else:
                time_prev = times[i - 1]
            time_cur = times[i]
            mid_total += search(diffs[i], time_cur, time_prev, mid_level)    
        if mid_total <= limit:
            max_level = mid_level
        else:
            min_level = mid_level + 1
    return min_level