/*
    목표:각 제품별로 평균값을 찾아라
    출력: product_id, average_price
    2개의 테이블을 product_id와 purchase_date이 start_date과 end_date 중간에 있는지를 기준으로 
    LEFT 조인 (units가 없을 수도 있기 때문)
    이후 product_id를 그룹해주고 CASE WHEN으로 유닛이 없으면 0, 아니면 average 계산 
*/
SELECT 
    P.product_id,
    CASE
        WHEN SUM(units) IS NULL THEN 0
        ELSE ROUND(SUM(price * units) / SUM(units), 2) 
    END AS average_price
FROM 
    Prices P
    LEFT JOIN UnitsSold US ON P.product_id = US.product_id
                           AND purchase_date BETWEEN start_date AND end_date
GROUP BY
    product_id