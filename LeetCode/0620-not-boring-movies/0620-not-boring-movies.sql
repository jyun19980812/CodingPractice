# Write your MySQL query statement below
# movie의 id, name, description, rating 리턴
# id를 WHERE절에 사용해서 홀수인것과 description이 boring을 안가질때, description을 주도록 해보겠습니다.

SELECT *
FROM Cinema
WHERE id % 2 = 1 AND description NOT LIKE "%boring%"
ORDER BY rating DESC