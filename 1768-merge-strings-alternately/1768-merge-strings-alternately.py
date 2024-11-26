class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        word1 = list(word1)
        word2 = list(word2)
        word1_length = len(word1)
        word2_length = len(word2)
        answer = ''
        if word1_length > word2_length:
            for i in range(word2_length):
                answer += word1[i]
                answer += word2[i]
            for j in range(word2_length, word1_length):
                answer += word1[j]
        elif word1_length < word2_length:
            for i in range(word1_length):
                answer += word1[i]
                answer += word2[i]
            for j in range(word1_length, word2_length):
                answer += word2[j]      
        else:
            for i in range(word1_length):
                answer += word1[i]
                answer += word2[i] 
        return answer