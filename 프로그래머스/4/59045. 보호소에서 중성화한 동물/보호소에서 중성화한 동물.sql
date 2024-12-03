/*
    목표: 보호소에 들어올 당시엔 중성화 X, 보호소 나갈땐 중성화된 동물의 정보 조회
    출력: ANIMAL_ID, ANIMAL_TYPE, NAME, ORDER BY ANIMAL_ID
    먼저 ANIMAL_INS와 ANIMAL_OUTS 조인, 이후 중성화 여부를 이전 테이블에는 Intact가,
    이후 테이블에는 Spayed나 Neutered가 포함되어있는 지 파악해서 풀기
*/
SELECT
    AI.ANIMAL_ID,
    AI.ANIMAL_TYPE,
    AI.NAME
FROM
    ANIMAL_INS AI
    JOIN ANIMAL_OUTS AO ON AI.ANIMAL_ID = AO.ANIMAL_ID
WHERE
    AI.SEX_UPON_INTAKE LIKE "%Intact%" AND
    (AO.SEX_UPON_OUTCOME LIKE "%Spayed%" OR 
     AO.SEX_UPON_OUTCOME LIKE "%Neutered%")
ORDER BY
    AI.ANIMAL_ID