/*
    2022년 1월의 카테고리 별 도서 판매량 합산해 카테고리와 총 판매량 출력
    먼저 두 테이블을 BOOK_ID 기준으로 조인, 다만 모든 책 정보가 중요하니 book 테이블을 기준으로
    LEFT JOIN, 이후 1월로 필터링해서 카테고리별로 총 판매량 구하기
*/
SELECT CATEGORY, SUM(SALES) AS TOTAL_SALES
    FROM BOOK AS B
        LEFT JOIN BOOK_SALES BS ON B.BOOK_ID = BS.BOOK_ID
WHERE BS.SALES_DATE BETWEEN "2022-01-01" AND "2022-01-31"
GROUP BY CATEGORY
ORDER BY CATEGORY ASC