# Write your MySQL query statement below
WITH CTE AS (
    SELECT S.user_id, action,
        SUM(CASE
            WHEN action = "confirmed" THEN 1 ELSE 0
        END) AS ConfirmationCount,
        COUNT(S.user_id) AS TotalCount
    FROM Signups S
        LEFT JOIN Confirmations C ON S.user_id = C.user_id
    GROUP BY S.user_id
)
SELECT user_id, ROUND(ConfirmationCount / TotalCount, 2) AS confirmation_rate
FROM CTE 