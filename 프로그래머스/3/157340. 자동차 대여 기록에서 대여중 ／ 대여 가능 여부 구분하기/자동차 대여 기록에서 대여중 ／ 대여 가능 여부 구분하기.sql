/*
    2022년 10월 16일에 대여중인 자동차 경우 '대여중', 아닌경우 '대여 가능'을 표시하는 컬럼 추가후 출력
    출력: CAR_ID, AVAILABILITY ORDER BY CAR_ID
    SUM(CASE WHEN)을 사용해서 각 car_id 별로 대여중이면 1 아니면 0을 더하게 해서 구분하기
*/
SELECT
    CAR_ID,
    CASE
        WHEN SUM(IF("2022-10-16" BETWEEN 
                 START_DATE AND END_DATE, 1, 0)) = 0 
        THEN '대여 가능' ELSE '대여중'
    END AS AVAILABILITY
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY 1
ORDER BY 1 DESC