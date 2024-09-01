# Write your MySQL query statement below
SELECT name, SUM(CASE WHEN distance IS NOT NULL THEN distance ELSE 0 END) AS travelled_distance
FROM Rides R
    RIGHT JOIN Users U ON R.user_id = U.id
GROUP BY U.id
ORDER BY travelled_distance DESC, name ASC