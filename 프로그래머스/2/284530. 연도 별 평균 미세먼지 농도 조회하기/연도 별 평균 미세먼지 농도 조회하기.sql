/* 수원 지역 연도 별 평균 미세먼지 및 평균 초미세먼지 오염도 조회
   YEAR, AVG(PM_VAL1) AS PM10, AVG(PM_VAL2) AS PM2.5 출력
   소수 셋째 자리에서 반올림
   ORDER BY YEAR
   WHERE문에서 LOCATION2가 수원일경우로 필터링, GROUP BY YEAR(YM) 해서 평균 구하고 출력
*/
SELECT YEAR(YM) AS YEAR, 
       ROUND(AVG(PM_VAL1), 2) AS PM10, 
       ROUND(AVG(PM_VAL2), 2) AS "PM2.5"
FROM AIR_POLLUTION
WHERE LOCATION2 = "수원"
GROUP BY YEAR
ORDER BY YEAR