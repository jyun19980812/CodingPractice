# UPPER, LOWER, CONCAT을 사용하면 쉽게 풀릴듯
# UPPER로 첫번째 문자 가져오고, LOWER로 나머지 문자, 그리고 CONCAT으로 마무리
SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2, 100))) AS name
FROM Users
ORDER BY user_id