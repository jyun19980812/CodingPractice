# Write your MySQL query statement below
SELECT name AS Customers
FROM CUSTOMERS C
    LEFT JOIN ORDERS O ON C.id = O.customerId
WHERE customerId IS NULL