# HR_DEPARTMENT 회사 부서 정보, HR_EMPLOYEES 회사 사원 정보, HR_GRADE 사원 평가 정보
# 2022년 한해 평가 점수가 가장 높은 사원 정보 조회
# SCORE(상반기, 하반기 합), EMP_NO, EMP_NAME, POSITION, EMAIL 출력
# HR_EMPLOYEE, HR_GRADE EMP_NO 기준으로 조인, SUM(SCORE)로 SCORE 측정
# ORDER BY SCORE DESC하고 LIMIT 1로 첫번째 사원만 출력
SELECT SUM(HG.SCORE) AS SCORE, HG.EMP_NO, HE.EMP_NAME, HE.POSITION, HE.EMAIL
FROM HR_EMPLOYEES HE
    JOIN HR_GRADE HG ON HE.EMP_NO = HG.EMP_NO
GROUP BY HG.EMP_NO, HE.EMP_NAME, HE.POSITION, HE.EMAIL
ORDER BY SCORE DESC
LIMIT 1