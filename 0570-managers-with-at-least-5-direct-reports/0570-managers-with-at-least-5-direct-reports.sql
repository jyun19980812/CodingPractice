/*
    employee중 5개 이상의 리포트를 받은 매니저 이름 출력
    출력: name
    CTE로 먼저 ManagerId 각각 카운트, 5개 이상인 매니저만 필터링
    이후 employee에서 cte의 5개 이상인 아이디만 매치, name 출력
*/
WITH CTE AS (
    SELECT
        managerId
    FROM
        EMPLOYEE
    GROUP BY 
        managerId
    HAVING
        COUNT(*) >= 5
)
SELECT
    name
FROM 
    EMPLOYEE
WHERE
    id IN (SELECT * FROM CTE)