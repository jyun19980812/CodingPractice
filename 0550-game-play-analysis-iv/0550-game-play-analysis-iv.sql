/*
    2일 이상 연속으로 로그인 한 유저의 비율을 구해달라 (첫번째 로그인날부터 연속 2일동안 로그인한 유저 수 / 총 유저 수)
    출력: fraction, round 2번째 자리수까지
    CTE문을 써서 LEAD()로 다음 이벤트날짜, player_id partition, order by event_date
    CTE2에서는, GROUP BY player_id, event_date = MIN(event_date) AND next_event_date = DATE_ADD(day, 1, event_date), 그러고 카운트
    SELECT CTE2에서 카운트 한 값 / COUNT( player_id) 비율을 구해주면 될듯 합니다
*/
WITH CTE AS (
    SELECT
        player_id,
        event_date,
        LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS next_event
    FROM
        Activity
),
CTE2 AS (
    SELECT
        player_id,
        event_date,
        next_event
    FROM
        CTE
    GROUP BY
        player_id
    HAVING
        event_date = MIN(event_date) AND
        next_event = DATE_ADD(event_date, INTERVAL 1 DAY)
)
SELECT
    ROUND((SELECT COUNT(DISTINCT player_id) FROM CTE2) / COUNT(DISTINCT player_id), 2) AS fraction
FROM
    Activity
