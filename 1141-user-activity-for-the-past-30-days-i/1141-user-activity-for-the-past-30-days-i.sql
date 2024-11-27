/*
    2019-07-27까지 30일동안 각 요일동안 몇명의 유저가 액티브했는지 출력
    GROUP BY activity_date해서 COUNT(DISTINCT user_id) 해주는데, WHERE절에서 DATE_ADD함수로
    만약 30일 더했는데 2019-07-27일보다 작을 경우만 출력
*/
SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM
    Activity
WHERE
    DATE_SUB("2019-07-27", INTERVAL 30 Day) < activity_date
    AND activity_date <= "2019-07-27"
GROUP BY
    activity_date
