# Write your MySQL query statement below
/* 
    Primary department에 있는 모든 직원들의 아이디와 부서 아이디 출력
    출력: employee_id, department_id
    UNION ALL로 풀기, 처음 쿼리에선
    employee_id로 그룹해서 department_id 카운트, 카운트가 =1인 아이디만
    SELECT문에서 CASE WHEN으로 primary_flag가 'Y'일 경우 출력
*/
SELECT 
    employee_id, 
    department_id
FROM 
    Employee
GROUP BY 
    employee_id
HAVING 
    COUNT(department_id) = 1

UNION ALL

SELECT 
    employee_id,
    department_id
FROM
    Employee
WHERE
    primary_flag = "Y"