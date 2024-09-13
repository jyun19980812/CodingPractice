# 방을 둘 이상 등록한 사람 = "헤비 유저"
# 헤비 유저가 등록한 공간의 정보를 아이디 순으로 조회
# ID, NAME, HOST_ID 출력, ID 순으로
# CTE문에서 GROUP BY HOST_ID로 COUNT 계산, 3 이상인 HOST ID만 저장
# 원래 테이블에서 HOST_ID를 매치 후 출력
WITH CTE AS (
    SELECT HOST_ID
    FROM PLACES
    GROUP BY HOST_ID
    HAVING COUNT(*) >= 2
)
SELECT *
FROM PLACES
WHERE HOST_ID IN (SELECT HOST_ID FROM CTE)
ORDER BY ID