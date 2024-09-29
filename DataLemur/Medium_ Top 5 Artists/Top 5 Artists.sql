/*
  artists: 아티스트 정보 테이블, songs: 노래 정보 테이블, 
  global_song_rank: 뮤직 차트 순위 테이블
  탑 텐 뮤직 차트에 가장 많이 나타나는 상위 5명 아티스트 출력
  출력: artist_name, artist_rank, ORDER BY artist_rank
  global_song_rank와 songs를 song_id를 기준 조인, rank가 10위 이상인 것으로만
  그리고 artist를 조인 artist_id를 기준으로, DENSE_RANK()로 순위 먹이기
  SELECT 문에서 5위 까지 출력
*/
WITH CTE AS (
  SELECT
    a.artist_name,
    DENSE_RANK() OVER (ORDER BY COUNT(a.artist_name) DESC) AS artist_rank
  FROM
    global_song_rank gsr
    LEFT JOIN songs s ON gsr.song_id = s.song_id AND gsr.rank <= 10
    JOIN artists a ON s.artist_id = a.artist_id
  GROUP BY 
    a.artist_name
)
SELECT 
  *
FROM 
  CTE
WHERE 
  artist_rank <= 5