/*
    물고기 평균 길이가 33cm 이상인 물고기들을 종류별로 분류 후 정보 출력
    출력: FISH_COUNT, MAX_LENGTH, FISH_TYPE
    FISH_TYPE으로 먼저 그룹 한 후 HAVING절에서 AVG(LENGTH) >= 33 하고
    필요한 내용들을 출력하면 풀릴듯 합니다.
*/
WITH CTE AS (
    SELECT
        ID,
        FISH_TYPE,
        CASE
            WHEN LENGTH IS NULL THEN 10 
            ELSE LENGTH 
        END AS LENGTH
    FROM
        FISH_INFO
)
SELECT
    COUNT(DISTINCT ID) AS FISH_COUNT,
    MAX(LENGTH) AS MAX_LENGTH,
    FISH_TYPE
FROM
    CTE
GROUP BY
    FISH_TYPE
HAVING
    AVG(LENGTH) >= 33