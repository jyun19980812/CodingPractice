# Write your MySQL query statement below
WITH CTE AS (    
    SELECT name, salary, departmentId, 
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rk
    FROM Employee
)
SELECT D.name AS Department, CTE.name AS Employee, CTE.salary AS Salary
FROM CTE
    JOIN Department D ON CTE.departmentId = D.id
WHERE rk <= 3