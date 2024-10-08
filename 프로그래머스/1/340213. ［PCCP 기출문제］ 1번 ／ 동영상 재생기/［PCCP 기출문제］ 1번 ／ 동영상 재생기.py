def solution(video_len, pos, op_start, op_end, commands):
    v = 60 * int(video_len.split(":")[0]) + int(video_len.split(":")[1])
    p = 60 * int(pos.split(":")[0]) + int(pos.split(":")[1]) 
    s = 60 * int(op_start.split(":")[0]) + int(op_start.split(":")[1])
    e = 60 * int(op_end.split(":")[0]) + int(op_end.split(":")[1])
    for command in commands:
        if s <= p <= e:
            p = e
        if command == 'next':
            p = min(p + 10, v)
        elif command == 'prev':
            p = max(p - 10, 0)
    if s <= p <= e:
        p = e
    m = str(p // 60) if p // 60 >= 10 else f"0{p//60}"
    s = str(p % 60) if p % 60 >= 10 else f"0{p%60}"
    return m + ":" + s