/*
    자동차 종류가 '세단' 또는 'SUV'인 자동차 중에, 2022/11/01 ~ 2022/11/30까지 대여가 가능하고
    30일간의 대여금액이 50만원 이상 200만원 미만인 자동차에 대해서 정보 출력
    출력: CAR_ID, CAR_TYPE, FEE, ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC
   먼저 CTE로 CAR_RENTAL_COMPANY_RENTAL_HISTORY에서 대여 불가한 아이디 넘버를 구해놓고,
   CAR_RENTAL_COMPANY_CAR에서 대여 불가한 아이디가 없는것으로 필터링 한다음,
   CAR_RENTAL_COMPANY_DISCOUNT_PLAN과 조인 후 대여금액 계산
*/
WITH CTE AS (
    SELECT DISTINCT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE START_DATE <= "2022-11-30" AND END_DATE >= "2022-11-01"
),
CTE2 AS (
SELECT C1.CAR_ID, 
       C1.CAR_TYPE, 
       C1.DAILY_FEE * (1 - C2.DISCOUNT_RATE / 100) * 30 AS FEE
FROM CAR_RENTAL_COMPANY_CAR C1
    JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN C2 ON C1.CAR_TYPE = C2.CAR_TYPE
                                             AND C2.DURATION_TYPE = "30일 이상"
WHERE C1.CAR_ID NOT IN (SELECT * FROM CTE)
)
SELECT CAR_ID,
       CAR_TYPE,
       ROUND(FEE) AS FEE
FROM CTE2
WHERE FEE >= 500000 AND FEE < 2000000
      AND CAR_TYPE IN ('세단', 'SUV')
ORDER BY 3 DESC, 2, 1 DESC