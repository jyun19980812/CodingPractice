/* 
  멘티 = 2021/12/31 기준 3개월 이내 입사한 모든 사람
  멘토 = 2021/12/31 기준 입사한지 2년 이상 
  서로 다른 부서에 속하는 직원끼리 멘토링 진행
  매칭 가능한 멘토가 없는 경우도 모두 포함되어야 함
  CTE로 멘티 테이블 하나, 멘토 테이블 하나를 만들어서 밖에 SELECT문에서 FULL JOIN
  mentee_id, mentee_name, mentor_id, mentor_name 출력, ORDER BY mentee_id, mentor_id
*/
WITH mentee AS (
    SELECT employee_id AS mentee_id, name AS mentee_name, department
    FROM employees
    WHERE join_date >= "2021-09-31"
), mentor AS (
    SELECT employee_id AS mentor_id, name AS mentor_name, department
    FROM employees
    WHERE join_date <= "2019-12-31"
)
SELECT mentee_id, mentee_name, mentor_id, mentor_name
FROM mentee ME 
  FULL JOIN mentor MT 
WHERE ME.department != MT.department
ORDER BY mentee_id, mentor_id