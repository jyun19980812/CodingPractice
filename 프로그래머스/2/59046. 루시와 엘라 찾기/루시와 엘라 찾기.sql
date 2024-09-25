/*
    동물 보호소에 들어온 동물중 Lucy, Ella, Pickle, Rogan, Sabrina, Mitty인 동물의 정보 출력
    출력 목록: ANIMAL_ID, NAME, SEX_UPON_INTAKE, ORDER BY ANIMAL_ID
    WHERE 절에서 IN으로 이름 리스트를 줘서 필터링
*/
SELECT ANIMAL_ID, NAME, SEX_UPON_INTAKE
FROM ANIMAL_INS
WHERE NAME IN ("Lucy", "Ella", "Pickle", "Rogan", "Sabrina", "Mitty")
ORDER BY ANIMAL_ID