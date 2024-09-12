# ANIMAL_INS 동물 보호소에 들어온 동물 정보, ANIMAL_OUTS 동물 보호소에서 입양 보낸 동물의 정보
# 입양 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문
# CTE에서 ANIMAL_ID를 기준으로 두 테이블 조인, DATETIME을 DATEDIFF로 보호기간 구하기
# 두번째 CTE에서 RANK()로 순위 새기고
# 밖에서 rank가 2 이상인 동물만 출력
WITH CTE AS (
    SELECT AI.ANIMAL_ID, 
           DATEDIFF(AO.DATETIME, AI.DATETIME) AS PROTECTED,
           AI.NAME
    FROM ANIMAL_INS AI
        JOIN ANIMAL_OUTS AO ON AI.ANIMAL_ID = AO.ANIMAL_ID
),
CTE2 AS (
    SELECT *, 
           RANK() OVER (ORDER BY PROTECTED DESC) AS rk
    FROM CTE
)
SELECT ANIMAL_ID, NAME
FROM CTE2
WHERE rk <= 2
ORDER BY rk