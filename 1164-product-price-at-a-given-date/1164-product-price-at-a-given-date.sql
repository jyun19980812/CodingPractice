WITH CTE AS (
    SELECT DISTINCT product_id, 
           new_price AS price,
           change_date, 
           RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rk
    FROM Products
    WHERE change_date <= "2019-08-16"
),
CTE2 AS (
    SELECT product_id, price
    FROM CTE
    WHERE rk = 1
    UNION ALL
    SELECT product_id, 10 AS price
    FROM Products
    WHERE change_date > "2019-08-16"
)
SELECT product_id, MAX(price) AS price
FROM CTE2
GROUP BY product_id