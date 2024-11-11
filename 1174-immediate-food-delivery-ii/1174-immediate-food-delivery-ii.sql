/*
    첫번째 오더 중 immediate 주문의 비율(%)을 찾는 문제
    출력: immediate_percentage
    먼저 CTE로 각 customer별 rank()로 오더 랭크 기록,
    두번째에서 첫번째 주문 중 immediate과 아닌 것 새로운 컬럼으로 계산
    밖에서 비율 계산
*/
WITH CTE AS (
    SELECT
        *,
        RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS rk
    FROM
        Delivery
),
CTE2 AS (
    SELECT
        *,
        CASE 
            WHEN order_date = customer_pref_delivery_date THEN 1
            ELSE 0
        END AS immediate_count
    FROM
        CTE
    WHERE
        rk = 1
)
SELECT
    ROUND(SUM(immediate_count) * 100 / COUNT(*), 2) AS immediate_percentage
FROM
    CTE2
