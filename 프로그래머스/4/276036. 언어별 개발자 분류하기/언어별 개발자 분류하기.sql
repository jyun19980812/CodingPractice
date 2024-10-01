/*
    SKILLCODES: 프로그래밍 언어 정보 테이블, DEVELOPERS= 개발자들의 프로그래밍 스킬 정보
    A : Front End 스킬과 Python 스킬을 함께 가지고 있는 개발자
    B : C# 스킬을 가진 개발자
    C : 그 외의 Front End 개발자
    GRADE가 존재하는 개발자의 GRADE, ID, EMAIL 조회하는 SQL문 작성
    출력: GRADE, ID, EMAIL, ORDER BY GRADE, ID
    CTE로 각 조건에 맞게 개발자 분류, 특히 A의 경우 파이썬과 Front End가 둘다 있을 경우여야 
    하기 때문에 Join을 활용, 마지막 CTE에서 GRADE ID별로 계산,
    밖에 SELECT 문에서 GRADE가 NULL이 아닌것만 가져오고 정렬
*/
WITH A AS (
    SELECT d.ID
    FROM DEVELOPERS d
        JOIN SKILLCODES s1 ON s1.code & d.skill_code != 0 AND s1.category = "Front End"
        JOIN SKILLCODES s2 ON s2.code & d.skill_code != 0 AND s2.name = "Python"
),
B AS (
    SELECT DISTINCT ID
    FROM DEVELOPERS, SKILLCODES
    WHERE NAME = 'C#' AND 
          CODE & SKILL_CODE > 0
),
C AS (
    SELECT DISTINCT ID
    FROM DEVELOPERS, SKILLCODES
    WHERE CATEGORY = "Front End" AND 
          CODE & SKILL_CODE > 0
),
CTE AS (
    SELECT 
        CASE
            WHEN ID IN (SELECT ID FROM A) THEN "A"
            WHEN ID IN (SELECT ID FROM B) THEN "B"
            WHEN ID IN (SELECT ID FROM C) THEN "C"
        END AS GRADE,
        ID,
        EMAIL
    FROM DEVELOPERS
)
SELECT *
FROM CTE
WHERE GRADE IS NOT NULL
ORDER BY GRADE, ID