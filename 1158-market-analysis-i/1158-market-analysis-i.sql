/*
    Users: 유저 정보 테이블, Orders: 주문 정보 테이블, Items: 아이템 정보 테이블
    2019년 구매자 정보와 몇번의 구매를 했는지 출력
    출력: buyer_id, join_date, orders_in_2019
    users와 orders 조인, GROUP BY buyer_id 하고 
    COUNT()으로 2019년일때 카운트 하게만 하면 될듯
*/
SELECT 
  u.user_id AS buyer_id, 
  join_date, 
  COUNT(o.order_id) AS orders_in_2019 
FROM 
  Users u 
  LEFT JOIN Orders o ON u.user_id = o.buyer_id 
  AND YEAR(order_date)= '2019' 
GROUP BY 
  u.user_id 
ORDER BY 
  u.user_id