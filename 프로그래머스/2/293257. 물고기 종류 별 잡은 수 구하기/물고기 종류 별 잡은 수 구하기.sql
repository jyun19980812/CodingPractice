SELECT COUNT(*) AS FISH_COUNT, FISH_NAME
FROM FISH_INFO FI
    JOIN FISH_NAME_INFO FNI ON FI.FISH_TYPE = FNI.FISH_TYPE
GROUP BY FISH_NAME
ORDER BY FISH_COUNT DESC