{{ config(materialized='table') }}

SELECT DISTINCT
    genre,
    ROW_NUMBER() OVER (ORDER BY genre) AS genre_id
FROM {{ ref('stg_movie_genres') }}
WHERE genre IS NOT NULL