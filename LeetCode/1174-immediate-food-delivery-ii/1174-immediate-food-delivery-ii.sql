WITH CTE AS (
    SELECT *,
        RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS rk_date
    FROM Delivery
),
CTE2 AS(
    SELECT 
        CASE 
            WHEN order_date = customer_pref_delivery_date THEN 1
            ELSE 0
        END AS immed
    FROM CTE
    WHERE rk_date = 1
)
SELECT ROUND(100 * (SUM(immed) / COUNT(*)), 2) AS immediate_percentage
FROM CTE2