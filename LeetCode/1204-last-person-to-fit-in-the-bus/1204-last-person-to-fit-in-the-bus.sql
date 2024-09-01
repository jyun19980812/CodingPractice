# Write your MySQL query statement below
WITH CTE AS (
    SELECT person_name, SUM(weight) OVER (ORDER BY turn) AS TotalWeight
    FROM Queue
)
SELECT person_name
FROM CTE
WHERE TotalWeight <= 1000
ORDER BY TotalWeight DESC
LIMIT 1