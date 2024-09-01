# Write your MySQL query statement below
WITH CTE AS (
    SELECT id,
           student,
           LAG(student) OVER (ORDER BY id) AS prev_stu,
           LEAD(student) OVER (ORDER BY id) AS aft_stu
    FROM Seat
)
SELECT id,
      CASE
        WHEN id % 2 = 1 AND aft_stu IS NULL THEN student
        WHEN id % 2 = 1 THEN aft_stu
        ELSE prev_stu
      END AS student
FROM CTE