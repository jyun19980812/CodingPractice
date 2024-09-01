# Write your MySQL query statement below
WITH CTE AS(
    SELECT num, COUNT(*) AS NumCount
    FROM MyNumbers
    GROUP BY num
)
SELECT CASE
            WHEN NumCount = 1 THEN num ELSE NULL
        END AS num
FROM CTE
ORDER BY num DESC
LIMIT 1