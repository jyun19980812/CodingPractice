/*
    3세대 대장균의 id를 출력하는 문제 (1세대 -> parent id가 NULL, 2세대 -> parent_id가 1세대, 3세대 -> 2세대)
    출력: ID, ORDER BY ID
    CTE로 SELF JOIN을 해서 1세대에 해당하는 ID를 파악, 그러고 같은 방식으로 3세대 파악
    이후 밖에 SELECT문에서 출력
*/
WITH CTE AS (
    SELECT 
        A.ID
    FROM
        ECOLI_DATA A
        JOIN ECOLI_DATA B ON A.PARENT_ID = B.ID
    WHERE
        B.PARENT_ID IS NULL
)
SELECT
    ID
FROM
    ECOLI_DATA
WHERE
    PARENT_ID IN (SELECT ID FROM CTE)
ORDER BY
    ID ASC