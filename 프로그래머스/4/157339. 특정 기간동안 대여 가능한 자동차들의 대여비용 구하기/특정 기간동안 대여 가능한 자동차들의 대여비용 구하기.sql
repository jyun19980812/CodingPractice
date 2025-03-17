/*
    CAR_RENTAL_COMPANY_CAR: 대여중인 자동차 정보, CAR_RENTAL_COMPANY_RENTAL_HISTORY: 자동차 대여 기록 정보
    CAR_RENTAL_COMPANY_DISCOUNT_PLAN: 대여 기간 종류 별 할인 정책 정보
    자동차 종류가 '세단' 또는 'SUV' 자동차 중 2022년 11월 동안 대여 가능하고, 30일간 대여 금액이 50만원 이상 200만원 미만인
    자동차 정보 출력
*/
WITH rentable AS (
    SELECT DISTINCT a.car_id, a.car_type, a.daily_fee
    FROM CAR_RENTAL_COMPANY_CAR a
        JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY b ON a.CAR_ID = b.CAR_ID
    WHERE a.CAR_TYPE IN ('SUV', '세단')
    AND a.car_id NOT IN (SELECT DISTINCT car_id
                         FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                         WHERE START_DATE < "2022-11-30" 
                         AND END_DATE >= "2022-11-01")
),
discount AS (
    SELECT a.CAR_ID, 
           a.CAR_TYPE,
           ROUND((100 - b.DISCOUNT_RATE) * 0.01 * a.DAILY_FEE * 30) AS FEE
    FROM rentable a
        JOIN 
            (SELECT CAR_TYPE, DISCOUNT_RATE 
             FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN 
             WHERE CAR_TYPE IN ('SUV', '세단')
             AND DURATION_TYPE = '30일 이상') b 
    ON a.CAR_TYPE = b.CAR_TYPE
)
SELECT *
FROM discount
WHERE FEE >= 500000 AND FEE < 2000000
ORDER BY 3 DESC, 2 ASC, 1 DESC