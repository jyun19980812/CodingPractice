/*
    목표: 물고기 종류 별로 가장 큰 물고기의 정보 출력
    출력: ID, FISH_NAME, LENGTH, ORDER BY ID
    CTE로 각 물고기 별로 최대 길이를 가진 ID 찾아 놓고,
    이후 SELECT문에서 FISH_INFO와 CTE 조인하면서 조건 주기, 그리고 FISH_NAME_INFO 조인해서
    이름과 함께 출력
*/
WITH CTE AS (
    SELECT
        FISH_TYPE,
        MAX(LENGTH) AS MAX_LENGTH
    FROM
        FISH_INFO
    GROUP BY
        FISH_TYPE
)
SELECT 
    ID,
    FISH_NAME,
    LENGTH
FROM 
    FISH_INFO FI
    JOIN CTE C ON FI.FISH_TYPE = C.FISH_TYPE AND FI.LENGTH = C.MAX_LENGTH
    JOIN FISH_NAME_INFO FNI ON FI.FISH_TYPE = FNI.FISH_TYPE
ORDER BY
    ID