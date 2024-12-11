/*
    목표:total investment value = tiv_2016 총 합을 구하는것
    조건은 tiv_2015 값이 다른 policyholder와 같을경우, 그리고 lat, lon이 유니크한 경우만
    출력: tiv_2016, ROUND(2)
    SUM(tiv_2016)을 하는데, WHERE절에서 서브쿼리로 policyholder와 같은 값을 같고 있는 tiv_2015 값이 있는지,
    그리고 다른 조건으로 lat, lon 이 유니크한 값인지 GROUP BY와 COUNT로 체크
*/
SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM
    Insurance
WHERE
    tiv_2015 IN (SELECT 
                    DISTINCT tiv_2015 
                 FROM 
                    Insurance 
                GROUP BY 
                    tiv_2015
                HAVING 
                    COUNT(*) > 1)
    AND (lat, lon) IN (SELECT
                        lat, 
                        lon
                        FROM
                            Insurance
                        GROUP BY
                            lat, 
                            lon
                        HAVING
                            COUNT(*) = 1
                       )
