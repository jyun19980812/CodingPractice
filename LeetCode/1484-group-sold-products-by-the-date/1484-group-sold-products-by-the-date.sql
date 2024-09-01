# Write your MySQL query statement below
WITH CTE AS (
    SELECT sell_date, product
    FROM Activities
    ORDER BY sell_date, product
)
SELECT sell_date, COUNT(DISTINCT product) AS num_sold, GROUP_CONCAT(DISTINCT product) AS products
FROM CTE
GROUP BY sell_date