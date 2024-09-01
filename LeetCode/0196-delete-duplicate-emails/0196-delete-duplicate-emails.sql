# Write your MySQL query statement below
DELETE
FROM PERSON
WHERE id NOT IN (SELECT MIN_ID 
                 FROM (SELECT MIN(ID) AS MIN_ID 
                       FROM PERSON 
                       GROUP BY EMAIL) AS A)