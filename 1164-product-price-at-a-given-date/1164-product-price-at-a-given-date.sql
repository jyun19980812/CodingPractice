/*
    2019-08-16일 기준으로 각각 product_id에 대한 가격 출력
    출력: product_id, price
    CTE로 먼저 change_date을 2019-08-16이전으로 필터링, 각각 product_id별로 파티션해서 change_date에 랭크 먹이기
    두번째 CTE에서 랭크가 1위(가장 최근)일 경우로 필터링해서, price 가져오기
    밖에 CTE에서 products 테이블과 LEFT JOIN, 이후 price가 NULL일 경우 10 줘서 출력
*/
WITH CTE AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rk
    FROM
        Products
    WHERE
        change_date <= "2019-08-16"
),
CTE2 AS (
    SELECT
        product_id,
        new_price AS price
    FROM
        CTE
    WHERE
        rk = 1
)
SELECT
    DISTINCT P.product_id,
    CASE
        WHEN C.price IS NULL THEN 10
        ELSE C.price
    END AS price
FROM
    Products P
    LEFT JOIN CTE2 C ON P.product_id = C.product_id