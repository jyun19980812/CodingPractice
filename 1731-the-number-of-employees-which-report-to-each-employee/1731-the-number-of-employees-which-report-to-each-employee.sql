# Write your MySQL query statement below
WITH CTE AS (
    SELECT
        b.employee_id,
        b.name,
        COUNT(a.employee_id) AS reports_count,
        ROUND(AVG(a.age),0) AS average_age
    FROM
        Employees a
        JOIN Employees b ON a.reports_to = b.employee_id
    GROUP BY b.employee_id, b.name
    ORDER BY b.employee_id
)
SELECT *
FROM CTE

