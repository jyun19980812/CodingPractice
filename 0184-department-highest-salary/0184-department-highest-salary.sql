# Write your MySQL query statement below 
-- SELECT D.name AS Department, E.name AS Employee, MAX(salary) AS Salary
WITH CTE AS(
    SELECT  E.name AS Employee,
            D.name AS Department,
            salary,
            RANK() OVER (PARTITION BY D.id ORDER BY salary DESC) AS rk
    FROM Employee E
        JOIN Department D ON E.departmentId = D.id
)
SELECT Department, Employee, salary AS Salary
FROM CTE
WHERE rk = 1