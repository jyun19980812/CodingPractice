# t에서 p와 길이가 같은 문자열 중, p보다 작거나 같은 수가 나오는 횟수
#  ls = []
#  cnt = 0
#  for i in range(len(t) - length):
#  ls.append(t[i: i+ length])
#  target = int(p)
#  for loop ls:
#  if loop <= target:
# cnt+=1
# return cnt

def solution(t, p):
    cnt = 0
    ls = []
    target = int(p)
    for i in range(len(t) - len(p) + 1):
        ls.append(t[i: i + len(p)])
    print(ls)
    for j in ls:
        if int(j) <= target:
            cnt += 1
    return cnt