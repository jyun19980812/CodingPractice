/*
    목표:3번이상 연속되는 숫자 찾기
    출력: ConsecutiveNums
    CTE 사용해서 LAG() LEAD() ORDER BY id 
    밖에 SELECT문에서 만약 이전 숫자와 이후 숫자가 같을경우 출력
*/
WITH CTE AS (
    SELECT
        id,
        num,
        LAG(num) OVER (ORDER BY id) AS prev_num,
        LEAD(num) OVER (ORDER BY id) AS aft_num 
    FROM 
        Logs
)
SELECT
    DISTINCT num AS ConsecutiveNums
FROM
    CTE
WHERE 
    num = prev_num AND
    num = aft_num