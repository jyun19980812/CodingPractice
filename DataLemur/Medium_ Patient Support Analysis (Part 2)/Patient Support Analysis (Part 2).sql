/*
  Advocate4Me에 전화한 사람 중 카테고리가 없는 전화 비율 계산
  출력: uncategorised_call_pct, 1의 자리수로 반올림
  COUNT(case_id)로 CTE에서 n/a의 비율을 구해놓고, 밖에 SELECT문에서
  비율 계산
*/
WITH CTE AS (
  SELECT COUNT(case_id) AS na_cnt
  FROM callers
  WHERE call_category = 'n/a' OR call_category IS NULL
)
SELECT ROUND((SELECT na_cnt FROM CTE) * 100.0 / COUNT(*), 1) AS uncategorised_call_pct
FROM callers