/*
    목표: 테이블에 있는 사람 중 가장 많은 친구를 가진 사람 출력
    requester_id나 accpeter_id에서 가장 많이 노출되는 id가 친구가 많은 id
    CTE로 accepter_id와 requester_id 하나의 컬럼으로, union으로 결합
    이후 밖에 SELECT문에서 id로 GROUPBY 하고, 카운트
*/
WITH CTE AS (
    SELECT 
        requester_id AS id
    FROM 
        RequestAccepted
    
    UNION ALL
    
    SELECT 
        accepter_id AS id
    FROM 
        RequestAccepted
)
SELECT
    id,
    COUNT(*) AS num
FROM 
    CTE
GROUP BY
    id
ORDER BY
    num DESC
LIMIT 1