-- olist_orders_dataset 주문 내역 데이터, olist_order_payments_dataset 주문 결제 정보
-- 두 테이블을 이용, 2018/01/01 이후 일별로 집계된 쇼핑몰의 결제 고객 수, 매출액, ARPPU 계산
-- ARPPU: 결제 고객 1인 당 평균 결제 금액(전체 매출액 / 결제 고객 수)
-- 출력: dt, pu, revenue_daily, arppu, order by dt
-- CTE문을 사용해서 두 테이블 조인, order_purchase_timestamp가 2018/01/01 이후로 만들기
-- GROUP BY로 날짜별로 그룹, customer_id count, SUM(payment_value)
-- 그 후 밖에 SELECT 문에서 arppu 계산 및 출력
WITH CTE AS (
  SELECT o.order_id, 
         DATE(o.order_purchase_timestamp) AS dt,
         COUNT(DISTINCT customer_id) AS pu,
         SUM(op.payment_value) AS revenue_daily
  FROM olist_orders_dataset o
    JOIN olist_order_payments_dataset op ON o.order_id = op.order_id
                                         AND o.order_purchase_timestamp >= '2018-01-01'
  GROUP BY dt
)
SELECT dt, pu, revenue_daily, ROUND((revenue_daily / pu), 2) AS arppu
FROM CTE
ORDER BY dt ASC