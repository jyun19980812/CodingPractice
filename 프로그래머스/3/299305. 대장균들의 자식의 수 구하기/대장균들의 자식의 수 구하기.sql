# SELF JOIN을 할껀데 첫번째 테이블에서 ParentID와 두번째 테이블의 ID를 조건으로 조인을 하면 될거 같습니다.
# 그러고 나중에 두번째 테이블의 ID를 카운트 한다면 나올듯 합니다.
SELECT A.ID, COUNT(B.ID) AS CHILD_COUNT
FROM ECOLI_DATA A
    LEFT JOIN ECOLI_DATA B ON A.ID = B.PARENT_ID
GROUP BY A.ID
ORDER BY A.ID ASC