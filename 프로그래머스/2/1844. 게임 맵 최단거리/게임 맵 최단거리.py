from collections import deque
def solution(maps):
    # 상, 하, 좌, 우
    dx = [-1, 1, 0, 0]
    dy = [0, 0, -1, 1]
    answer = 0
    def bfs(x, y): 
        queue = deque()
        queue.append((x, y))
        while queue:
            x, y = queue.popleft()
            for i in range(4):
                nx = x + dx[i]
                ny = y + dy[i]
                if nx < 0 or nx >= len(maps) or ny < 0 or ny >= len(maps[0]):
                    continue;
                if maps[nx][ny] == 0:
                    continue;
                if maps[nx][ny] == 1:
                    maps[nx][ny] = maps[x][y] + 1
                    queue.append((nx, ny))
        return maps[len(maps) - 1][len(maps[0]) - 1]
    answer = bfs(0, 0)
    if answer == 1:
        return -1
    else:
        return answer

