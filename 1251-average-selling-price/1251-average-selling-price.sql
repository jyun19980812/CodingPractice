/*
    목표:각 제품별로 평균값을 찾아라
    출력: product_id, average_price
    2개의 테이블을 product_id와 purchase_date이 start_date과 end_date 중간에 있는지를 기준으로 조인
*/
SELECT
    product_id,
    CASE
        WHEN SUM(units) IS NULL THEN 0
        ELSE ROUND(SUM(profit) / SUM(units), 2) 
    END AS average_price
FROM (
    SELECT
        P.product_id,
        US.units,
        price * units AS profit
    FROM
        Prices P
        LEFT JOIN UnitsSold US ON P.product_id = US.product_id
                         AND US.purchase_date BETWEEN P.start_date AND P.end_date
    ) tb
GROUP BY
    P.product_id