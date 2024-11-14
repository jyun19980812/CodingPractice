/*
    transactions에서 각 날짜별로 홀수 거래 내역, 짝수 거래내역 합산한 가격 찾기
    출력: transaction_date, odd_sum, even_sum
    SUM(CASE WHEN)으로 각각의 조건에 맞춰서 % 2 == 1이면 odd, 아니면 even으로 합산
    group by transaction_date, order_by transaction_date
*/
SELECT
    transaction_date,
    SUM(CASE WHEN amount % 2 = 1 THEN amount ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN amount % 2 = 0 THEN amount ELSE 0 END) AS even_sum
FROM
    transactions
GROUP BY
    transaction_date
ORDER BY
    transaction_date