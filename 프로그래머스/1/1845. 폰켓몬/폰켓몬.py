def solution(nums):
    d = {}
    for i in nums:
        d[i] = d.get(i, 0) + 1
    if len(d) >= len(nums) / 2:
        return len(nums) / 2
    else:
        return len(d)