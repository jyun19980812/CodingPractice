/*
    목표: 각 제품 별 첫번째로 팔린 년도의 정보 출력
    출력: product_id, first_year, quantity, price
    CTE로 각 product_id별로 최소 년도 찾기
    이후 밖에 SELECT문에서 product_id와 year로 조인, 이후 매치되는 정보 출력
*/
WITH CTE AS (
    SELECT
        product_id,
        MIN(year) AS first_year
    FROM
        Sales
    GROUP BY
        product_id
)
SELECT
    S.product_id,
    first_year,
    quantity,
    price
FROM
    Sales S
    JOIN CTE C ON S.product_id = C.product_id
               AND S.year = C.first_year