# Write your MySQL query statement below
WITH CTE AS (
    SELECT id, DATE_FORMAT(trans_date, '%Y-%m') AS "month", country,
           SUM(IF(state="approved", 1, 0)) AS approved_count,
           SUM(IF(state="approved", amount, 0)) AS approved_total_amount
    FROM Transactions
    GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country
),
CTE2 AS (
    SELECT id, DATE_FORMAT(trans_date, '%Y-%m') AS "month", country, 
        COUNT(*) AS trans_count,
        SUM(amount) AS trans_total_amount
    FROM Transactions
    GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country
)
SELECT C2.month, C2.country, trans_count, 
        approved_count,
        trans_total_amount,
        approved_total_amount
FROM CTE C
    RIGHT JOIN CTE2 C2 ON C.id = C2.id