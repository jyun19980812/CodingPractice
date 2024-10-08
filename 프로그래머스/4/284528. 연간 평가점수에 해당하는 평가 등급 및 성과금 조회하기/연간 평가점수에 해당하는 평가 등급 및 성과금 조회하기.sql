WITH CTE AS (
    SELECT EMP_NO, AVG(SCORE) AS SCORE
    FROM HR_GRADE
    GROUP BY EMP_NO
)
SELECT HE.EMP_NO, EMP_NAME, 
    CASE
        WHEN SCORE >= 96 THEN "S"
        WHEN SCORE < 96 AND SCORE >= 90 THEN "A"
        WHEN SCORE < 90 AND SCORE >= 80 THEN "B"
        ELSE "C"
    END AS GRADE,
    CASE
        WHEN SCORE >= 96 THEN SAL * 0.2
        WHEN SCORE < 96 AND SCORE >= 90 THEN SAL * 0.15
        WHEN SCORE < 90 AND SCORE >= 80 THEN SAL * 0.1
        ELSE 0
    END AS BONUS
FROM HR_EMPLOYEES HE
    JOIN CTE C ON HE.EMP_NO = C.EMP_NO
ORDER BY HE.EMP_NO ASC