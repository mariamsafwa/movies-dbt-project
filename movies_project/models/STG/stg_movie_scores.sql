SELECT
    CAST(imdbID              AS VARCHAR)       AS movie_id,
    CAST(Flickmetrix_Score   AS NUMERIC(6,2))  AS flickmetrix_score,
    CAST(IMDb_10             AS NUMERIC(4,1))  AS imdb_score,
    CAST(IMDb_100            AS NUMERIC(5,1))  AS imdb_score_100,
    CAST(IMDb_Votes          AS INTEGER)       AS imdb_votes,
    CAST(Metacritic          AS NUMERIC(5,1))  AS metacritic_score,
    CAST(Critic_Rating_RT    AS NUMERIC(5,1))  AS rt_critic_score,
    CAST(Critic_Reviews      AS INTEGER)       AS critic_reviews_count,
    CAST(Audience_Rating     AS NUMERIC(5,1))  AS audience_score,
    CAST(Audience_Reviews    AS NUMERIC(10,0)) AS audience_reviews_count,
    CAST(Letterboxd          AS INTEGER)       AS letterboxd_score,
    CAST(Letterboxd_Votes    AS NUMERIC(10,0)) AS letterboxd_votes,
    CAST(Google_Score        AS NUMERIC(5,1))  AS google_score
FROM {{ ref('raw_movies') }}
WHERE imdbID IS NOT NULL AND Title IS NOT NULL