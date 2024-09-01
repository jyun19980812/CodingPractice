# Upload용 커맨트
SELECT CATEGORY, SUM(SALES) AS TOTAL_SALES
    FROM BOOK AS B
        LEFT JOIN BOOK_SALES BS ON B.BOOK_ID = BS.BOOK_ID
WHERE BS.SALES_DATE BETWEEN "2022-01-01" AND "2022-01-31"
GROUP BY CATEGORY
ORDER BY CATEGORY ASC