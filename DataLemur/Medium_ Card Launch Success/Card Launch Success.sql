/*
  launch month(카드 출시 년월)에 맞춰 몇개의 카드가 출시 됐는지 파악하는 문제
  출력: card_name, issued_amount, ORDER BY issued_amount DESC
  CTE에서 RANK()를 사용해 가장 처음 나온 날짜 파악
  SELECT문에서 issued_amount 순으로 출력, WHERE rk = 1으로 처음 나온 카드 필터링
*/
WITH CTE AS (
  SELECT
    *,
    RANK() OVER (PARTITION BY card_name ORDER BY issue_year, issue_month) AS rk
  FROM
    monthly_cards_issued
)
SELECT
  card_name,
  issued_amount
FROM
  CTE
WHERE
  rk = 1
ORDER BY
  issued_amount DESC