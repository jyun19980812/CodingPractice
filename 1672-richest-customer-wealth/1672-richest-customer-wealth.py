class Solution:
    def maximumWealth(self, accounts: List[List[int]]) -> int:
        max_count = 0
        for i in accounts:
            count = 0
            for j in i:
                count += j
            if max_count < count:
                max_count = count
        return max_count