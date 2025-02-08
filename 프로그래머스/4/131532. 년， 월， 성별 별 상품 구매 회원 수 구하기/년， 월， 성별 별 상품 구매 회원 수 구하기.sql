/*
    목표: 년, 월, 성별 별로 상품을 구매한 회원수 집계
    출력: YEAR, MONTH, GENDER, USERS ORDER BY 1,2,3
    CTE로 ONLINE SALE 테이블에서 먼저 고유 유저 아이디, 그리고 년 월을 뽑아주고
    밖에 쿼리에서 USER 테이블과 조인을 하는데 온라인 세일 정보가 전부 필요하니 CTE를 기준으로 조인
    이후 GENDER가 없는건 제외해주고, 년,월,성별 별로 그룹해서 유저 수 카운트 
*/

WITH CTE AS (
    SELECT DISTINCT USER_ID, YEAR(SALES_DATE) AS YEAR, MONTH(SALES_DATE) AS MONTH
    FROM ONLINE_SALE
)
SELECT YEAR, MONTH, GENDER, COUNT(C.USER_ID) AS USERS
FROM CTE C
    LEFT JOIN USER_INFO UI ON C.USER_ID = UI.USER_ID
WHERE GENDER IS NOT NULL
GROUP BY YEAR, MONTH, GENDER
ORDER BY YEAR, MONTH, GENDER