# Write your MySQL query statement below
WITH client_tb AS (
    SELECT users_id AS ct_id,
           banned AS client_banned,
           role AS client_role
    FROM Users
    WHERE role = 'client'
),
driver_tb AS (
    SELECT users_id AS dv_id,
           banned AS driver_banned,
           role AS driver_role
    FROM Users
    WHERE role = 'driver'
),
total_trip AS (
    SELECT *
    FROM Trips t
        JOIN client_tb ct ON t.client_id = ct.ct_id
        JOIN driver_tb dt ON t.driver_id = dt.dv_id
    WHERE CAST(request_at AS DATE) BETWEEN CAST("2013-10-01" AS DATE) AND CAST("2013-10-03" AS DATE)
)
SELECT request_at AS "Day",
       ROUND(SUM(status IN ("cancelled_by_driver", "cancelled_by_client")) / COUNT(*), 2) AS "Cancellation Rate"       
FROM total_trip
WHERE client_banned = "No" AND driver_banned = "No"
GROUP BY request_at