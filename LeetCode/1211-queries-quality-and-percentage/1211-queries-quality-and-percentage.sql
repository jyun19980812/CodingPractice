# Write your MySQL query statement below
# CTE 문에 SELECT문에 QUERY_NAME, (rating/ postion) AS quality_score, CASE WHEN rating < 3 THEN 1 ELSE 0 AS poor_query
# 밖에 SELECT문에 GROUPBY로 query_name별 quality와 poor_query_percentage 구할거 같습니다.

WITH CTE AS (
    SELECT query_name, (rating / position) AS quality_score,
        CASE
            WHEN rating < 3 THEN 1 ELSE 0
        END AS poor_query
    FROM Queries
)
SELECT query_name, ROUND(SUM(quality_score) / COUNT(*), 2) AS quality, ROUND((SUM(poor_query) / COUNT(*)) * 100, 2) AS poor_query_percentage
FROM CTE
WHERE query_name IS NOT NULL
GROUP BY query_name