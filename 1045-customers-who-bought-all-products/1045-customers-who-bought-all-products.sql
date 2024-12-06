/*
    Customer 테이블에서 모든 Product를 구매한 고객 아이디 출력
    츌력: customer_id
    
*/
SELECT
    customer_id
FROM
    Customer C
GROUP BY
    customer_id
HAVING
    COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product)
