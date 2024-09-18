-- RECORDS: 주문 상세 정보 데이터셋
-- 일별 주문 수가 10개 이상인 날 중, 'Furniture' 카테고리 주문의 비율이 40% 이상이었던 날 출력
-- 출력: order_date, furniture, furniture_pct
-- furniture_pct는 둘째자리까지, ORDER BY furniture_pct DESC, order_date
-- CTE로 날짜별, 카테고리별 각각 order_id 카운트, 두번째 CTE에서 전체 주문 계산
-- 밖에 SELECT에서 주문 비율 계산하고, furniture일 경우의 카테고리만 꺼내오도록
-- CASE WHEN으로 계산
WITH CTE AS (
  SELECT order_date, category, COUNT(DISTINCT order_id) AS category_cnt
  FROM records
  GROUP BY order_date, category
),
CTE2 AS (
  SELECT order_date, COUNT(DISTINCT order_id) AS full_cnt
  FROM records
  GROUP BY order_date
  HAVING full_cnt >= 10
)
SELECT CTE.order_date,
       CASE
          WHEN category = "Furniture" THEN category_cnt
          ELSE NULL
       END AS furniture,
       ROUND((CAST(category_cnt AS FLOAT) / CAST(full_cnt AS FLOAT)) * 100, 2) AS furniture_pct
FROM CTE
  JOIN CTE2 ON CTE.order_date = CTE2.order_date
WHERE furniture IS NOT NULL
      AND furniture_pct >= 40
ORDER BY furniture_pct DESC, CTE.order_date