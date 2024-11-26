import datetime
def solution(a, b):
    answer = datetime.date(2016, a, b).strftime("%a").upper()
    return answer