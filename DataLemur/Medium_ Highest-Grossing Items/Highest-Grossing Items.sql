/*
  아마존에서 2022년에 카테고리별 상위 매출 product 2개 출력
  출력: category, product, total_spend
  CTE로 spend 집계, 집계된 매출을 카테고리를 기준으로 랭크 매기기,
  2위까지 출력
*/
WITH CTE AS (
  SELECT 
    category, 
    product, 
    SUM(spend) AS total_spend,
    RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS rk
  FROM 
    product_spend
  WHERE 
    EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY 
    category,
    product
)
SELECT 
  category, 
  product, 
  total_spend
FROM 
  CTE
WHERE 
  rk <= 2