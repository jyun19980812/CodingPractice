/*
  두번째로 높은 연봉을 받는 사원의 연봉 출력 (중복 가능)
  출력: second_highest_salary
  먼저 CTE에서 DENSE_RANK로 연봉 순위 파악
  그 후 SELECT 문에서 유니크한 연봉만 출력
*/
WITH CTE AS (
  SELECT
    *,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS rk
  FROM
    employee
)
SELECT
  DISTINCT salary
FROM
  CTE
WHERE 
  rk = 2