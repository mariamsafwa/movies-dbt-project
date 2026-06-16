WITH split AS (
    SELECT
        CAST(imdbID AS VARCHAR) AS movie_id,
        TRIM(UNNEST(STRING_SPLIT(Genre, ','))) AS genre
    FROM {{ ref('raw_movies') }}
    WHERE imdbID IS NOT NULL
      AND Genre  IS NOT NULL
)
SELECT movie_id, genre
FROM split
WHERE genre <> ''