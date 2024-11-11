def solution(wallet, bill):
    answer = 0
    wallet.sort()
    bill.sort()
    while (wallet[0] < bill[0]) | (wallet[1] < bill[1]):
            bill[1] = bill[1] // 2
            print(bill)
            bill.sort()
            answer += 1
    return answer