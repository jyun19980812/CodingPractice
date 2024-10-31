/*
    목표: 100명 이상이 스태디움에 들어왔던 날중 3 consecutive ids가 있는 경우 출력
    출력: id, visit_date, people ORDER BY visit_date
    CTE에서 LAG(people, 1), LAG(people, 2), LEAD(people, 1), LEAD(people, 2) id를 기준으로 ORDER BY
    밖에 출력 문에서, WHERE을 사용해서 조건이 맞는지 확인해보면 될 듯 합니다
*/
WITH CTE AS (
    SELECT
        *,
        LAG(people, 1) OVER (ORDER BY id) AS prev_1,
        LAG(people, 2) OVER (ORDER BY id) AS prev_2,
        LEAD(people, 1) OVER (ORDER BY id) AS next_1,
        LEAD(people, 2) OVER (ORDER BY id) AS next_2
    FROM
        Stadium
)
SELECT
    id,
    visit_date,
    people
FROM
    CTE
WHERE
    (people >= 100 AND prev_1 >= 100 AND prev_2 >= 100) OR
    (people >= 100 AND prev_1 >= 100 AND next_1 >= 100) OR
    (people >= 100 AND next_1 >= 100 AND next_2 >= 100)
ORDER BY
    visit_date