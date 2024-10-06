/*
  Zomato라는 앱에서 오류가 난 Delivery 시스템 고치기 (order_id를 서로 스왑)
  출력: corrected_order_id, item
  CTE에서 LAG와 LEAD함수를 활용, item이전과 이후 가져오기
  그후 출력에서 서로 스왑한 아이템 출력
*/

WITH CTE AS (
  SELECT 
    *,
    LAG(item) OVER (ORDER BY order_id) AS prev_item,
    LEAD(item) OVER (ORDER BY order_id) AS next_item
  FROM
    orders
)
SELECT 
  order_id AS corrected_order_id,
  CASE
    WHEN order_id % 2 = 1 AND next_item IS NOT NULL THEN next_item
    WHEN order_id % 2 = 0 THEN prev_item
    ELSE item
  END AS item
FROM
  CTE