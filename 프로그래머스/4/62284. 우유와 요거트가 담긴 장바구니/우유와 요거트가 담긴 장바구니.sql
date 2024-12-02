/*
    목표: 우유와 요거트를 동시에 구입한 장바구니의 아이디 조회
    출력: CART_ID, ORDER BY CART_ID
    CTE로 Milk를 구입한 장바구니 아이디 필터링, 그러고 밖에 SELECT문에서
    Yogurt 구입한 장바구니로 필터링 하고, milk 구입한 장바구니 아이디와 매칭되는것으로 필터링
*/
WITH CTE AS (
    SELECT
        CART_ID
    FROM
        CART_PRODUCTS
    WHERE
        NAME = "Milk"
)
SELECT
    CART_ID
FROM
    CART_PRODUCTS
WHERE
    NAME = "Yogurt" AND
    CART_ID IN (SELECT * FROM CTE)
ORDER BY
    CART_ID