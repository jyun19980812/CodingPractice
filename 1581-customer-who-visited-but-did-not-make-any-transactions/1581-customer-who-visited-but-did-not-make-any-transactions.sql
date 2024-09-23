# Visits: 몰에 방문한 고객 정보, Transactions: 거래 정보
# 방문을 했지만 거래를 하지 않은 유저의 아이디 및 방문 횟수 출력
# CTE로 Visits와 Transactions LEFT JOIN, transaction_id가 null인 경우만 필터링
# 밖에 SELECT문에서 GROUP BY customer_id 하고 COUNT(customer_id)로 횟수 카운트
WITH CTE AS (
    SELECT V.visit_id, V.customer_id, T.transaction_id
    FROM Visits V
        LEFT JOIN Transactions T ON V.visit_id = T.visit_id
    WHERE transaction_id IS NULL
)
SELECT customer_id, COUNT(*) AS count_no_trans
FROM CTE
GROUP BY customer_id
