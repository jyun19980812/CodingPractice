/*
    목표: 가장 많이 영화를 리뷰를 남긴 유저 이름과, 2020년 2월에 가장 높은 평균을 기록한 영화 이름 출력
    출력: results, 사전 순서로 낮은 이름 순서대로
    첫번째 쿼리엔 user_id 별로 카운트가 가장 많은 유저 아이디 구해놓고, users 테이블과 합쳐 이름 구하기
    두번째 쿼리엔 2020년 2월로 필터링 한다음, movie_id 별로 가장 높은 평균 점수 영화 구하기
    마지막에 union으로 이름 합치기
*/
(
SELECT
    name AS results
FROM
    MovieRating MR
    JOIN Users U ON MR.user_id = U.user_id
GROUP BY
    MR.user_id
ORDER BY
    COUNT(*) DESC,
    1 ASC
LIMIT
    1
)

UNION ALL

(
SELECT
    title AS results
FROM
    MovieRating MR
    JOIN Movies M ON MR.movie_id = M.movie_id
WHERE
    LEFT(MR.created_at, 7) = "2020-02"
GROUP BY
    MR.movie_id 
ORDER BY
    AVG(rating) DESC,
    1 ASC
LIMIT
    1
)