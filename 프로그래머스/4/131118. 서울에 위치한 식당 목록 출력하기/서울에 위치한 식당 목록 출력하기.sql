# Upload용 커맨트
SELECT RI.REST_ID, 
       RI.REST_NAME, 
       RI.FOOD_TYPE, 
       RI.FAVORITES, 
       RI.ADDRESS,
       ROUND(AVG(REVIEW_SCORE), 2) AS SCORE
FROM REST_INFO RI
    JOIN REST_REVIEW RR ON RI.REST_ID = RR.REST_ID
WHERE RI.ADDRESS LIKE "서울%"
GROUP BY RI.REST_NAME
ORDER BY SCORE DESC, RI.FAVORITES DESC