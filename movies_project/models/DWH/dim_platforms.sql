{{ config(materialized='table') }}

SELECT DISTINCT
    platform,
    ROW_NUMBER() OVER (ORDER BY platform) AS platform_id
FROM {{ ref('stg_movie_streaming') }}
WHERE platform IS NOT NULL