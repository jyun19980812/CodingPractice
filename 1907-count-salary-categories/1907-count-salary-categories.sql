/*
    문제: 카테고리 별 은행 계좌 개수 카운트 한거 출력
    출력: category, accounts_count
    Low < 20000, 20000 <= average <= 50000, 50000 < high
    SELECT 문으로 각각의 조건에 따라서 CASE WHEN으로 구하고, UNION ALL로 합치기
*/
SELECT
    "Low Salary" AS category,
    COUNT(*) AS accounts_count
FROM
    Accounts
WHERE
    income < 20000

UNION ALL

SELECT
    "Average Salary" AS category,
    COUNT(*) AS accounts_count
FROM
    Accounts
WHERE
    income BETWEEN 20000 AND 50000

UNION ALL

SELECT
    "High Salary" AS category,
    COUNT(*) AS accounts_count
FROM
    Accounts
WHERE
    income > 50000