# Write your MySQL query statement below
WITH CTE AS (
    SELECT buyer_id, COUNT(*) AS orders_in_2019
    FROM Orders
    WHERE order_date >= "2019-01-01"
    GROUP BY buyer_id
)
SELECT user_id AS buyer_id, join_date, 
    CASE
        WHEN orders_in_2019 IS NULL THEN 0
        ELSE orders_in_2019
    END AS orders_in_2019
FROM Users U
    LEFT JOIN CTE ON U.user_id = CTE.buyer_id