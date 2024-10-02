/*
    문제: 식품분류별로 가격이 제일 비싼 식품의 분류, 가격, 이름을 조회하는 SQL문을 작성
    조건: 식품분류가  '과자', '국', '김치', '식용유'인 경우만 출력, ORDER BY 식품 가격
    출력: CATEGORY, MAX_PRICE, PRODUCT_NAME
    CTE문에서 GROUP BY CATEGORY, MAX(PRICE)를 찾아 놓고,
    밖에 SELECT문에서 필요한 정보 출력하는데, WHERE문에서 조건에 맞춰서 출력
*/
WITH CTE AS (
    SELECT
        PRODUCT_ID,
        MAX(PRICE) AS N_PRICE
    FROM 
        FOOD_PRODUCT
    GROUP BY 
        CATEGORY
)
SELECT
    CATEGORY,
    PRICE AS MAX_PRICE,
    PRODUCT_NAME
FROM
    FOOD_PRODUCT
WHERE 
    PRICE IN (SELECT N_PRICE FROM CTE) AND
    CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY 
    MAX_PRICE DESC