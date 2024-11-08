/*
    목표: each month and country, the number of transactions and their total amount, 
    the number of approved transactions and their total amount를 출력
    출력:month, country, trans_count, approved_count, trans_total_amount, approved_total_amount
    month는 DATE_FORMAT(trans_date, %Y-%m) AS month으로 만들고
    month랑 country로 그룹해서, trans_count는 COUNT(id), 그리고 approved_count랑 approved_total_amount는 SUM(CASE WHEN)
    으로 해결
*/
SELECT
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(CASE WHEN state = "approved" THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = "approved" THEN amount ELSE 0 END) AS approved_total_amount
FROM
    Transactions
GROUP BY
    month,
    country