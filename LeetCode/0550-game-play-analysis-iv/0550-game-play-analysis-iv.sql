WITH CTE AS (
    SELECT player_id, MIN(event_date) as min_date 
    FROM ACTIVITY 
    GROUP BY player_id
)
SELECT ROUND(SUM(CASE WHEN A.event_date = DATE_ADD(CTE.min_date, INTERVAL 1 DAY) THEN 1 ELSE 0 END) / 
        COUNT(DISTINCT CTE.player_id), 2) AS fraction
FROM CTE
    JOIN ACTIVITY A ON CTE.player_id = A.player_id