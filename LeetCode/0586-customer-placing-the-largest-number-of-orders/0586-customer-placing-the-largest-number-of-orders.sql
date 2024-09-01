# Write your MySQL query statement below
# CTE절을 사용해서 customer number와 COUNT(*)를 SELECT문 안에 넣을 건데, customer_number를 group by 해서 구하고
# 나중에 SELECT문에서 가장 많은 COUNT를 가진 고객 ID를 구하는 식으로 하겠습니다
WITH CTE AS (
    SELECT customer_number, COUNT(*) AS order_count
    FROM Orders
    GROUP BY customer_number
)
SELECT customer_number
FROM CTE
ORDER BY order_count DESC
LIMIT 1