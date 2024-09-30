/*
미국의 각 지역, 카테고리별 주문량을 계산해 출력
출력 내역: Region, Furniture, Office Supplies, Technology, ORDER BY Region
region으로 GROUP BY를 하고, COUNT(CASE WHEN)을 사용해서 각 카테고리별로 카운트
*/
SELECT
  region AS Region,
  COUNT(
    DISTINCT (
      CASE
        WHEN category = "Furniture" THEN order_id
      END
    )
  ) AS Furniture,
  COUNT(
    DISTINCT (
      CASE
        WHEN category = "Office Supplies" THEN order_id
      END
    )
  ) AS "Office Supplies",
  COUNT(
    DISTINCT (
      CASE
        WHEN category = "Technology" THEN order_id
      END
    )
  ) AS Technology
FROM
  records
GROUP BY
  region
ORDER BY
  region