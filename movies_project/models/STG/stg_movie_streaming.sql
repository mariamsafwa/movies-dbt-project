WITH split AS (
    SELECT
        CAST(imdbID AS VARCHAR) AS movie_id,
        TRIM(UNNEST(STRING_SPLIT(Streaming_On, ','))) AS platform
    FROM {{ ref('raw_movies') }}
    WHERE imdbID     IS NOT NULL
      AND Streaming_On IS NOT NULL
)
SELECT movie_id, LOWER(platform) AS platform
FROM split
WHERE platform <> ''