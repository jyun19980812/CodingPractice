/*
    CAR_RENTAL_COMPANY_CAR: 대여 중인 자동차들의 정보, 
    CAR_RENTAL_COMPANY_RENTAL_HISTORY: 자동차 대여 기록 정보,
    CAR_RENTAL_COMPANY_DISCOUNT_PLAN: 자동차 종류 별 대여 기간 종류 별 할인 정책 정보
    자동차 종류가 '세단' 또는 'SUV'인 자동차 중에, 2022/11/01 ~ 2022/11/30까지 대여가 가능하고
    30일간의 대여금액이 50만원 이상 200만원 미만인 자동차에 대해서 정보 출력
    출력: CAR_ID, CAR_TYPE, FEE, ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC
    CTE에서, CAR_RENTAL_COMPANY_CAR이랑, CAR_RENTAL_COMPANY_RENTAL_HISTORY 조인, 기준은 CAR_ID
    WHERE문에서 CAR_TYPE이 SUV나 세단인걸로 필터하고, CAR_RENTAL_HISTORY는 CAR_ID 그룹해서 MAX(END_DATE)하고
    이게 2022-11-01~2022-11-30일안이 아닌걸로 필터링
    밖에서 또 조인, 조인 기준은 CAR_TYPE인데 DURATION_TYPE이 30일 이상으로 적혀있는 걸로
    FEE를 계산
*/
WITH CTE AS (
    SELECT 
        CRCC.CAR_ID, 
        CRCC.CAR_TYPE, 
        CRCC.DAILY_FEE
    FROM 
        CAR_RENTAL_COMPANY_CAR CRCC
        LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY CRCRH ON CRCC.CAR_ID = CRCRH.CAR_ID
                                                     AND START_DATE <= "2022-11-30" 
                                                     AND END_DATE >= "2022-11-01"
    WHERE CRCC.CAR_TYPE IN ('SUV', '세단') AND HISTORY_ID IS NULL
),
CTE2 AS (
    SELECT 
        C.CAR_ID,
        C.CAR_TYPE, 
        CRCDP.DURATION_TYPE,
        ROUND((C.DAILY_FEE - (C.DAILY_FEE * (CRCDP.DISCOUNT_RATE / 100))) * 30) AS FEE
    FROM 
        CTE C
        JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN CRCDP ON C.CAR_TYPE = CRCDP.CAR_TYPE
                                                    AND CRCDP.DURATION_TYPE = "30일 이상"
)
SELECT 
    CAR_ID,
    CAR_TYPE,
    FEE
FROM
    CTE2
WHERE
    FEE >= 500000 AND FEE < 2000000
ORDER BY 
    FEE DESC, 
    CAR_TYPE ASC, 
    CAR_ID DESC