def solution(numbers):
    nums = [str(x) for x in numbers]
    nums.sort(key=lambda x: (x * 4)[:4], reverse=True)
    if nums[0] == '0':
        answer = '0'
    else:
        answer = ''.join(nums)
    return answer