/*
    HR_DEPARTMENT: 회사 부서 정보 테이블, HR_EMPLOYEES: 회사 사원 정보 테이블, 
    HR_GRADE: 2022년 사원 평가 정보 테이블
    목표: 평가 점수별 등급과 등급에 따른 사원별 성과금 정보 조회
    96 이상, S등급, 20% / 90 이상, A, 15% / 80 이상, B, 10% / 이외, C, 0%
    출력: EMP_NO, EMP_NAME, GRADE, BONUS
    CTE로 HR_GRADE에서 GROUP BY EMP_NO AVG(SCORE)을 해주고, AVG(SCORE) 별로 등급 매겨주고
    밖에 SELECT문에서 HR_EMPLOYEE와 조인 후 점수에 따라 보너스 계산
*/
WITH CTE AS (
    SELECT
        EMP_NO,
        AVG(SCORE) AS SCORE,
        CASE
            WHEN AVG(SCORE) >= 96 THEN "S"
            WHEN AVG(SCORE) >= 90 THEN "A"
            WHEN AVG(SCORE) >= 80 THEN "B"
            ELSE "C"
        END AS GRADE
    FROM
        HR_GRADE
    GROUP BY
        EMP_NO
)
SELECT
    HE.EMP_NO,
    HE.EMP_NAME,
    C.GRADE,
    CASE
        WHEN C.GRADE = "S" THEN SAL * 0.2
        WHEN C.GRADE = "A" THEN SAL * 0.15
        WHEN C.GRADE = "B" THEN SAL * 0.1
        ELSE SAL * 0
    END AS BONUS
FROM 
    HR_EMPLOYEES HE
    JOIN CTE C ON HE.EMP_NO = C.EMP_NO