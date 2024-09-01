# Write your MySQL query statement below
SELECT product_name, SUM(unit) AS unit
FROM Products P
    JOIN Orders O ON P.product_id = O.product_id
WHERE LEFT(order_date, 7) = "2020-02"
GROUP BY product_name
HAVING unit >= 100