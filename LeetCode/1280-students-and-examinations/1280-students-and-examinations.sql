# Write your MySQL query statement below
WITH CTE AS (
    SELECT *
    FROM Students, Subjects
)
SELECT C.student_id, C.student_name, C.subject_name,
    IFNULL(COUNT(E.subject_name), 0) AS attended_exams
FROM CTE C
    LEFT JOIN Examinations E USING (student_id, subject_name)
GROUP BY student_name, subject_name
ORDER BY student_id, subject_name ;