# Write your MySQL query statement below
SELECT t1.name AS Employee
FROM EMPLOYEE t1
    JOIN EMPLOYEE t2 ON t1.managerID = t2.id
WHERE t1.Salary > t2.Salary