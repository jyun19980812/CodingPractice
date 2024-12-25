/*
    목표:각 부서별 가장 높은 salary를 받고 있는 직원의 정보 출력
    출력: Department, Employee, Salary
    CTE로 먼저 employee 테이블과 department 테이블을 id 기준으로 합쳐주는데
    RANK() 윈도우 함수를 사용해서 각 아이디별 높은 연봉 순서대로 기록,
    이후 밖에 쿼리에서 랭크가 1인걸로 필터링
*/
WITH CTE AS(
    SELECT  
        E.name AS Employee,
        D.name AS Department,
        salary,
        RANK() OVER (PARTITION BY D.id ORDER BY salary DESC) AS rk
    FROM 
        Employee E
        JOIN Department D ON E.departmentId = D.id
)
SELECT 
    Department, 
    Employee, 
    salary AS Salary
FROM 
    CTE
WHERE 
    rk = 1