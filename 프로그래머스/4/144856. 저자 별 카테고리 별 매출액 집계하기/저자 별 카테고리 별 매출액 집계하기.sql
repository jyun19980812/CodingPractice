/*
    도서 정보:Book, 저자 정보: Author, BOOK_SALES: 도서 날짜별 판매량 정보
    2022년 1월의 도서 판매 데이터를 기준으로 저자별, 카테고리 별 매출액(TOTAL_SALES = 판매량 * 판매가), 등등
    ORDER BY AUTHOR_ID, CATEGORY DESC
    출력: AUTHOR_ID, AUTHOR_NAME, CATEGORY, TOTAL_SALES
    CTE로 Book이랑 BOOK_SALES를 조인, 조건을 BOOK_ID를 기준 WHERE SALES_DATE이 LIKE "2022-01%", 그룹바이 BOOK_ID
    TOTAL_SALES를 구해놓고, 밖에서 Author테이블이랑 조인, 필요한 정보 출력
*/
WITH CTE AS (
    SELECT
        B.BOOK_ID,
        B.CATEGORY,
        B.AUTHOR_ID,
        SUM(BS.SALES * B.PRICE) AS TOTAL_SALES
    FROM
        BOOK B
        JOIN BOOK_SALES BS ON B.BOOK_ID = BS.BOOK_ID
    WHERE
        BS.SALES_DATE LIKE "2022-01%"
    GROUP BY
        B.AUTHOR_ID,
        B.CATEGORY
)

SELECT
    C.AUTHOR_ID,
    A.AUTHOR_NAME,
    C.CATEGORY,
    C.TOTAL_SALES
FROM 
    CTE C
    JOIN AUTHOR A ON C.AUTHOR_ID = A.AUTHOR_ID
ORDER BY 
    AUTHOR_ID,
    CATEGORY DESC