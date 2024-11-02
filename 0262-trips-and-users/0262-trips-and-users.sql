/*
    Trips: 모든 택시 이용 정보 테이블, Users: 모든 유저에 대한 정보 테이블
    목표: 2013-10-01~2013-10-03까지 밴이 되지 않은 유저들의 cancellation_rate구하기
    Cancellation_rate:ROUND(밴 되지 않은 유저들의 택시 호출 취소 수 / 전체 밴 되지 않은 유저들의 택시 호출 수, 2)
    출력: Day, Cancellation Rate
    먼저 CTE에서 Trips와 driver 일경우로 먼저 합치고, client일 경우로 다시 합치기, 
    banned가 No일 경우로 미리 필터링,
    그리고 request_at을 2013-10-01부터 2013-10-03까지 필터링
    이후 밖에서 GROUP BY로 캔슬 수와 전체 호출 수 카운트, 그 후 비율 계산
*/
WITH CTE AS (
    SELECT
        T.id,
        T.client_id,
        T.driver_id,
        T.status,
        T.request_at
    FROM
        Trips T
        JOIN Users U ON T.client_id = U.users_id
                     AND U.banned = "No"
        JOIN Users U2 ON T.driver_id = U2.users_id
                     AND U2.banned ="No"
    WHERE
        DATE(request_at) BETWEEN "2013-10-01" AND "2013-10-03"
)
SELECT
    request_at AS Day,
    ROUND(SUM(CASE WHEN status LIKE "cancelled%" THEN 1 ELSE 0 END) / COUNT(*), 2) AS "Cancellation Rate"
FROM
    CTE C
GROUP BY
    request_at


