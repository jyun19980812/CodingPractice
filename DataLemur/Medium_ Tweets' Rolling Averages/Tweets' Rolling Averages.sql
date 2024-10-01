/*
  3-day rolling average 트윗 찾는 문제 (3일간 평균 트윗 횟수)
  출력: user_id, tweet_date, rolling_avg_3d
  CTE에서 LAG()로 1일전, 2일전 카운트 가져오고,
  밖 SELECT 문에서 AVERAGE 계산
*/
WITH CTE AS (
  SELECT 
    *,
    LAG(tweet_count, 1) OVER (PARTITION BY USER_ID) AS day_before,
    LAG(tweet_count, 2) OVER (PARTITION BY USER_ID) AS two_day_before
  FROM tweets
)
SELECT
  user_id,
  tweet_date,
  CASE
    WHEN day_before IS NULL AND two_day_before IS NULL THEN 1.00 * tweet_count
    WHEN two_day_before IS NULL THEN ROUND(1.00 * (tweet_count + day_before) / 2, 2)
    ELSE ROUND(1.00 * (tweet_count + day_before + two_day_before) / 3, 2)
  END AS rolling_avg_3d
FROM CTE