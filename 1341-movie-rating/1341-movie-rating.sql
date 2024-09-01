# Write your MySQL query statement below
WITH CTE AS (
    SELECT MR.user_id, name, COUNT(*) AS UserCount
    FROM MovieRating MR
        JOIN Users U ON MR.user_id = U.user_id
    GROUP BY MR.user_id
    ORDER BY UserCount DESC, name ASC
    LIMIT 1
),
CTE2 AS (
    SELECT MR.movie_id, title, AVG(rating) AS avg_rating, created_at
    FROM MovieRating MR
        JOIN Movies M ON MR.movie_id = M.movie_id
    WHERE created_at LIKE "2020-02-%"
    GROUP BY MR.movie_id
    ORDER BY avg_rating DESC, title ASC
    LIMIT 1
)
SELECT name AS results
FROM CTE
UNION ALL
SELECT title AS results
FROM CTE2