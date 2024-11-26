class Solution:
    def runningSum(self, nums: List[int]) -> List[int]:
        ls = []
        x = 0
        for num in nums:
            x += num
            ls.append(x)
        return ls