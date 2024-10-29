/*
    Users: 유저 정보, Rides: 얼만큼 움직였는지 테이블
    출력: 각 유저별로 얼만큼 움직였는지, ORDER BY travelled_distance DESC, name ASC
    테이블 두개 조인, USERS 테이블로 레프트 조인, GROUP BY u.name
    SUM(CASE WHEN distance NOT NULL THEN distance ELSE 0)
*/
SELECT
    U.name,
    SUM(CASE WHEN distance IS NOT NULL THEN distance ELSE 0 END) AS travelled_distance
FROM
    Users U
    LEFT JOIN Rides R ON U.id = R.user_id
GROUP BY
    U.id,
    U.name
ORDER BY
    travelled_distance DESC,
    U.name ASC