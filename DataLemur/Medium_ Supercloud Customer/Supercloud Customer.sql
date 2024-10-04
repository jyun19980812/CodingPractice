/*
  Microsoft Azure Supercloud customer는 모든 카테고리에서 하나의 제품은 산사람
  customer_contracts: 고객이 어떤 제품을 얼마나 샀는지 정보, products: 제품 정보 테이블
  supercloud customer인 고객 ID 출력
  CTE테이블에서 customer_contracts와 products product_id를 기준으로 조인, 
  밖에 SELECT문에서 카테고리가 3개임으로 COUNT했을때 3 이상인 것으로 필터링
*/
WITH CTE AS (
  SELECT DISTINCT p.product_category, cc.customer_id
  FROM 
    customer_contracts cc
    JOIN products p ON cc.product_id = p.product_id
)
SELECT customer_id
FROM CTE
GROUP BY customer_id
HAVING COUNT(*) >= 3