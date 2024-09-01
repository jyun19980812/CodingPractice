# Write your MySQL query statement below
WITH CTE AS (
    SELECT *,
           RANK() OVER (PARTITION BY product_id ORDER BY year) AS rk_year
    FROM Sales
)
SELECT product_id, year AS first_year, quantity, price
FROM CTE
WHERE rk_year = 1