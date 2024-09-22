/*
    SKILLCODES = 개발자들이 사용하는 프로그래밍 언어 테이블
    DEVELOPERS = 개발자들의 프로그래밍 스킬 정보 테이블
    문제: DEVELOPERS 테이블에서 Python이나 C# 스킬을 가진 개발자 정보 조회
    출력: ID, EMAIL, FIRST_NAME, LAST_NAME, ORDER BY ID
    풀이방법: BITWISE OPERATOR 문제; 먼저 두 테이블을 FULL JOIN, 가능한 모든 조합을 찾고,
            WHERE절에서 파이썬이나 C#일경우와, SKILL_CODE & CODE != 0 경우로 필터링
*/
SELECT DISTINCT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
FROM SKILLCODES S, DEVELOPERS D
WHERE (S.NAME = "Python" OR S.NAME = "C#") AND
      S.CODE & D.SKILL_CODE != 0
ORDER BY ID
