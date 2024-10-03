/*
  구글 센서에서 홀수인 measurements, 짝수인 measurements 측정
  출력: measurement_day, odd_sum, even_sum
  CTE문에서 measurement_time으로 ROW_NUMBER세기기
  후에 SELECT문에서 odd_sum과 even_sum 측정
*/
WITH CTE AS (
  SELECT
    measurement_value,
    measurement_day,
    ROW_NUMBER() OVER (PARTITION BY measurement_day ORDER BY measurement_time) AS rk
  FROM (
    SELECT
      measurement_value,
      measurement_time,
      CAST(measurement_time as DATE) AS measurement_day
    FROM 
      measurements
  ) A
)
SELECT
  measurement_day,
  SUM(CASE WHEN rk % 2 = 1 THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM(CASE WHEN rk % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM 
  CTE
GROUP BY
  measurement_day
