-- 우유와 요거트를 동시에 구입한 장바구니가 있는지?
# CART_ID 출력, ORDER BY CART_ID
# WITH CTE로 name이 milk와 yogurt로 필터링
# GROUP BY CART_ID 한 후, COUNT(*) 로 횟수 카운트
# 밖에 SELECT문에서 WHERE문에서 COUNT가 2일경우 출력, CART_ID는 DISTINCT
WITH CTE AS (
    SELECT CART_ID, COUNT(*) AS PRODUCT_COUNT
    FROM CART_PRODUCTS
    WHERE NAME = "Milk"
    GROUP BY CART_ID
),
CTE2 AS (
    SELECT CART_ID, COUNT(*) AS PRODUCT_COUNT
    FROM CART_PRODUCTS
    WHERE NAME = "Yogurt"
    GROUP BY CART_ID
)
SELECT CTE.CART_ID
FROM CTE
    JOIN CTE2 ON CTE.CART_ID = CTE2.CART_ID
ORDER BY CTE.CART_ID