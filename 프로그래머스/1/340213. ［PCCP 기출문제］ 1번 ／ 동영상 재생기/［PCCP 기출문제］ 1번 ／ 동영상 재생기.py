def solution(video_len, pos, op_start, op_end, commands):
    answer = ''
    video_len = int(video_len[0:2]) * 60 + int(video_len[3:])
    pos = int(pos[0:2]) * 60 + int(pos[3:])
    op_start = int(op_start[0:2]) * 60 + int(op_start[3:])
    op_end = int(op_end[0:2]) * 60 + int(op_end[3:])
    if pos >= op_start and pos <= op_end:
        pos = op_end 
    for command in commands:   
        if command == "prev":
            pos -= 10
            if pos < 0:
                pos = 0
        else:
            pos += 10
            if pos > video_len:
                pos = video_len
        if pos >= op_start and pos <= op_end:
            pos = op_end
    h = pos // 60
    m = pos % 60
    if h < 10:
        answer = "0" + str(h) + ":"
    else:
        answer = str(h) + ":"
    if m < 10:
        answer += "0" + str(m)
    else:
        answer += str(m)
    return answer