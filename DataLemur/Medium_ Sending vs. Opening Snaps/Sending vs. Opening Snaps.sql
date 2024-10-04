/*
  time spent sending / (Time spent sending + Time spent opening)
  Time spent opening / (Time spent sending + Time spent opening)
  age_bucket별로 스냅 보내는 비율과 스냅 열어보는 비율 출력
  activities와 age_breakdown user_id를 기준으로 조인
  하나의 CTE에는 send관련 데이터 합산, 다른 하나에는 open관련 데이터 합산
  밖에 SELECT문에서 비율 계산
*/
WITH send AS (
  SELECT ab.age_bucket, SUM(time_spent) AS send_spent
  FROM activities a
    JOIN age_breakdown ab ON a.user_id = ab.user_id
  WHERE activity_type = 'send'
  GROUP BY ab.age_bucket
),
open AS (
  SELECT ab.age_bucket, SUM(time_spent) AS open_spent
  FROM activities a
    JOIN age_breakdown ab ON a.user_id = ab.user_id
  WHERE activity_type = 'open'
  GROUP BY ab.age_bucket
)
SELECT 
  s.age_bucket,
  ROUND((100.0 * send_spent / (send_spent + open_spent)), 2) AS send_perc,
  ROUND((100.0 * open_spent / (send_spent + open_spent)), 2) AS open_perc
FROM send s 
  JOIN open o ON s.age_bucket = o.age_bucket