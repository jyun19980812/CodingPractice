# Write your MySQL query statement below
 WITH CTE AS (   
    SELECT contest_id, COUNT(R.user_id) AS counts
    FROM Register R
        JOIN Users U ON R.user_id = U.user_id
    GROUP BY contest_id
)
SELECT contest_id, ROUND((counts / (SELECT COUNT(*) FROM Users) * 100), 2) AS percentage
FROM CTE
ORDER BY percentage DESC, contest_id ASC