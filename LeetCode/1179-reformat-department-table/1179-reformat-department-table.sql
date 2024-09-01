# Write your MySQL query statement below
SELECT id,
    SUM(CASE WHEN month = "Jan" THEN revenue else NULL END) AS Jan_Revenue,
    SUM(CASE WHEN month = "Feb" THEN revenue else NULL END) AS Feb_Revenue,
    SUM(CASE WHEN month = "Mar" THEN revenue else NULL END) AS Mar_Revenue,
    SUM(CASE WHEN month = "Apr" THEN revenue else NULL END) AS Apr_Revenue,
    SUM(CASE WHEN month = "May" THEN revenue else NULL END) AS May_Revenue,
    SUM(CASE WHEN month = "Jun" THEN revenue else NULL END) AS Jun_Revenue,
    SUM(CASE WHEN month = "Jul" THEN revenue else NULL END) AS Jul_Revenue,
    SUM(CASE WHEN month = "Aug" THEN revenue else NULL END) AS Aug_Revenue,
    SUM(CASE WHEN month = "Sep" THEN revenue else NULL END) AS Sep_Revenue,
    SUM(CASE WHEN month = "Oct" THEN revenue else NULL END) AS Oct_Revenue,
    SUM(CASE WHEN month = "Nov" THEN revenue else NULL END) AS Nov_Revenue,
    SUM(CASE WHEN month = "Dec" THEN revenue else NULL END) AS Dec_Revenue
FROM Department
GROUP BY id