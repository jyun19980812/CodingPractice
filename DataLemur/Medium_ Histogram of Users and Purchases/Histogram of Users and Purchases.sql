/*
  월마트 유저간 거래 내역 테이블, 유저간 가장 최근 거래내역과 몇번이나
  구매했는지 출력해야하는 문제
  transaction_date, user_id, purchase_count 출력, order by transaction_date
  GROUP BY user_id하고, MAX(transaction_date),과 COUNT(product_id)하면 될듯
*/
WITH CTE AS (
  SELECT MAX(transaction_date) AS transaction_date, user_id
  FROM user_transactions
  GROUP BY user_id
)
SELECT ut.transaction_date, ut.user_id, COUNT(product_id) AS purchase_count
FROM user_transactions ut
  JOIN CTE ON ut.user_id = CTE.user_id AND
              ut.transaction_date = CTE.transaction_date
GROUP BY ut.transaction_date, ut.user_id
ORDER BY ut.transaction_date