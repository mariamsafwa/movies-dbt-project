SELECT
    CAST(imdbID       AS VARCHAR)            AS movie_id,
    CAST(Rank         AS INTEGER)            AS rank,
    CAST(Title        AS VARCHAR)            AS title,
    CAST(Year         AS INTEGER)            AS release_year,
    CAST(Director     AS VARCHAR)            AS director,
    CAST(Language     AS VARCHAR)            AS language,
    CAST(Plot         AS VARCHAR)            AS plot,
    COALESCE(CAST(Awards      AS VARCHAR), 'N/A')  AS awards,
    COALESCE(CAST(Production  AS VARCHAR), 'Unknown') AS production_company,
    CAST(RT_URL       AS VARCHAR)            AS rt_url,
    CAST(Custom_Score AS NUMERIC(6,2))       AS custom_score
FROM {{ ref('raw_movies') }}
WHERE imdbID IS NOT NULL
  AND Title  IS NOT NULL
  AND Director IS NOT NULL
  AND Rank IS NOT NULL