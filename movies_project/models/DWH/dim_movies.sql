{{ config(materialized='table') }}

SELECT
    movie_id,
    title,
    release_year,
    director,
    language,
    production_company,
    awards,
    plot,
    rt_url,
    custom_score
FROM {{ ref('stg_movies') }}