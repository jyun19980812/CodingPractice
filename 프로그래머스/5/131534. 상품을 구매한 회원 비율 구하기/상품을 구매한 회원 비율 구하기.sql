/*
    목표: 2021년 가입한 전체 회원들 중 상품을 구매한 회원수와 상품을 구매한 회원의 비율을 년, 월 별로 출력
    출력: YEAR, MONTH, PURCHASED_USERS, PURCHASED_RATIO
    ORDER BY YEAR, MONTH
    비율(=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수)
    CTE로 먼저 2021년 가입한 유저로 필터링,
    그리고 밖에서 상품 구매한 유저 중 2021년 가입한 유저 아이디 매칭 후 비율 구하기
*/
WITH CTE AS (
    SELECT
        USER_ID
    FROM
        USER_INFO
    WHERE
        YEAR(JOINED) = "2021"
)    
SELECT
    YEAR(SALES_DATE) AS YEAR,
    MONTH(SALES_DATE) AS MONTH,
    COUNT(DISTINCT USER_ID) AS PURCHASED_USERS,
    ROUND(COUNT(DISTINCT USER_ID) / (SELECT COUNT(DISTINCT USER_ID) FROM CTE), 1) AS PURCHASED_RATIO
FROM
    ONLINE_SALE
WHERE
    USER_ID IN (SELECT * FROM CTE)
GROUP BY
    YEAR,
    MONTH
ORDER BY
    YEAR,
    MONTH