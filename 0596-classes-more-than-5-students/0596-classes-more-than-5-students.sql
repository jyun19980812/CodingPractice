# Write your MySQL query statement below
WITH CTE AS (
    SELECT class, COUNT(*) AS stu_count 
    FROM Courses
    GROUP BY class
)
SELECT class
FROM CTE
WHERE stu_count >= 5