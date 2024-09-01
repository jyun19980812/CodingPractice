# Write your MySQL query statement below
SELECT lastName, firstName, city, state
FROM Person P 
    LEFT JOIN Address A ON P.personID = A.personID
