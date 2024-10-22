/*
  7월의 MAU 구하기
  기준: 6월 7월에 event_type에 'sign-in', 'like', or 'comment'를 한 유저
  출력: month, monthly_active_users
  
*/
WITH CTE AS (
  SELECT
    user_id,
    event_id,
    event_type,
    event_date,
    EXTRACT(month FROM event_date) as month
  FROM user_actions
  WHERE event_date >= '2022-06-01' AND event_date < '2022-08-01'
),
CTE2 AS (
  SELECT
    user_id,
    COUNT(DISTINCT month) AS cnts
  FROM CTE
  GROUP BY user_id
  HAVING COUNT(DISTINCT month) > 1
)
SELECT
  7 AS month,
  COUNT(*) AS monthly_active_users
FROM 
  CTE2