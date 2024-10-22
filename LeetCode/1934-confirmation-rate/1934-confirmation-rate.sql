/*
    Signups: 회원가입 정보, Confirmations: 메세지가 confirmation 됐는지 아닌지 정보
    각 유저별로 Confirmation Rate을 구하기, two decimal place로 round해줘라. 어떠한 메세지도 날리지 않으면, rate은 0
    Signups와 Confiormations를 LEFT JOIN, group by user_id, 
    SUM(CASE WHEN) / COUNT(*)으로 비율 계산
*/
SELECT
    S.user_id,
    ROUND(SUM(CASE WHEN C.action = "confirmed" THEN 1 ELSE 0 END) / COUNT(*), 2) AS confirmation_rate
FROM
    Signups S
    LEFT JOIN Confirmations C ON S.user_id = C.user_id
GROUP BY
    S.user_id