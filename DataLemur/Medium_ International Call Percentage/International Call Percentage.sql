/*
  phone_calls = 전화 내역 정보 테이블, phone_info: 전화한 사람의 정보 테이블
  국제 전화 비율 구하기, 1의 자리 수로 ROUND()
  phone_calls와 phone_info를 caller_id를 기준으로 조인, 
  또한, receiver도 caller_id가 될 수 있으므로 receiver_id와 caller_id를
  기준으로 조인.
  CASE WHEN으로 만약 country_id가 서로 다르면 국제 전화이니 합산,
  100.0을 곱해 Float형태로 돌려주고, 1의 자리로 반올림
*/
SELECT
  ROUND(100.0 * SUM(CASE WHEN pi.country_id != pi2.country_id THEN 1 ELSE 0 END) / COUNT(*), 1) AS international_calls_pct 
FROM
  phone_calls pc  
  LEFT JOIN phone_info pi ON pc.caller_id = pi.caller_id
  LEFT JOIN phone_info pi2 ON pc.receiver_id = pi2.caller_id