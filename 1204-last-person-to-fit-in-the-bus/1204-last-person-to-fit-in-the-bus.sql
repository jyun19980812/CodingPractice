/*
    목표: 무게 합계가 1000이 넘지 않는 선에서 마지막으로 타는 사람의 이름 출력
    먼저 CTE에서 윈도우 함수로 turn을 기준으로 무게 합산
    이후 밖에 SELECT문에서 WHERE절에서 합산한 무게가 1000이 안넘고, order by 합산무게 한 후
    LIMIT으로 마지막 사람 구하기
*/
WITH CTE AS (
    SELECT
        person_name,
        SUM(weight) OVER (ORDER BY turn ASC) AS total_weight
    FROM
        Queue
)
SELECT
    person_name
FROM 
    CTE
WHERE
    total_weight <= 1000
ORDER BY
    total_weight DESC
LIMIT 1