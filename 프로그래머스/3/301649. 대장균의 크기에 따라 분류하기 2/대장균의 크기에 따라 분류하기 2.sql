/*
    대장균 개체 ID와 분류된 이름 (크기 카테고리) 출력, ORDER BY ID ASC
    25% = CRITICAL, 26~50% = HIGH, 51~75% MEDIUM, 76~100% LOW
    CTE에서 PERCENT_RANK()로 상위 % 구하기, 이후 SELECT문에서 CASE WHEN으로 크기 카테고리 계산
*/
WITH CTE AS (
    SELECT
        ID,
        PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS rk
    FROM
        ECOLI_DATA
)
SELECT
    ID,
    CASE
        WHEN rk >= 0.0 AND rk <= 0.25 THEN 'CRITICAL'
        WHEN rk > 0.25 AND rk <= 0.5 THEN 'HIGH'
        WHEN rk > 0.5 AND rk <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS COLONY_NAME
FROM
    CTE
ORDER BY
    ID