# Write your MySQL query statement below
SELECT name, bonus
FROM Employee E
    LEFT JOIN BONUS B ON E.empId = B.empId
WHERE bonus IS NULL OR bonus < 1000