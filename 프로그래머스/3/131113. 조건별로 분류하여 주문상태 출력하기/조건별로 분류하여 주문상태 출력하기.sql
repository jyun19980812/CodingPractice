-- 2022년 5월 1일 기준으로 출고 여부를 조회해야함
# 2022년 5월 1일 이전까지 OUT_DATE이 포함될경우 출고 완료, 아니면 출고대기, NULL일 경우 출고미정
# ORDER_ID, PRODUCT_ID, OUT_DATE, 출고여부 출력, ORDER BY 주문 ID
# SELECT 문에서 CASE WHEN 사용, OUT_DATE이 NULL일 경우 출고 미정
# 2022/05/01 이전이면 출고 완료, 아닐경우 출고대기
SELECT ORDER_ID, PRODUCT_ID,
       DATE_FORMAT(OUT_DATE, "%Y-%m-%d") AS OUT_DATE,
       CASE
            WHEN OUT_DATE <= "2022-05-01" THEN "출고완료"
            WHEN OUT_DATE > "2022-05-01" THEN "출고대기"
            ELSE "출고미정"
       END AS "출고여부"
FROM FOOD_ORDER
ORDER BY ORDER_ID