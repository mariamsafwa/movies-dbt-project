{{ config(materialized='table') }}

SELECT
    s.movie_id,
    m.title,
    m.release_year,
    m.director,
    m.language,
    s.imdb_score,
    s.imdb_votes,
    s.metacritic_score,
    s.rt_critic_score,
    s.critic_reviews_count,
    s.audience_score,
    s.audience_reviews_count,
    s.letterboxd_score,
    s.google_score,
    s.flickmetrix_score,
    ROUND(
        (COALESCE(s.rt_critic_score, 0) + COALESCE(s.audience_score, 0)) / 2
    , 2) AS avg_combined_score
FROM {{ ref('stg_movie_scores') }} s
JOIN {{ ref('dim_movies') }} m ON s.movie_id = m.movie_id