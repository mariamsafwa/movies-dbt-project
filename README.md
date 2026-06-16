# 🎬 Top 500 Movies — dbt Data Warehouse

A data warehouse pipeline built with **dbt + DuckDB** 
for the Top 500 Movies dataset ranked by combined 
critics and audience scores.

## Architecture
raw_movies (ODS)

├──► stg_movies          ──► dim_movies

├──► stg_movie_scores    ──► fact_movie_scores

├──► stg_movie_genres    ──► dim_genres

└──► stg_movie_streaming ──► dim_platforms
## Layers

| Layer | Models | Type | Description |
|-------|--------|------|-------------|
| ODS | raw_movies | Seed | Raw CSV data |
| STG | 4 models | Views | Cleaned & normalized |
| DWH | 4 models | Tables | Dimensional warehouse |

## Data Quality

- **43 tests** — all passing
- Nullable columns documented by design
- Every primary key tested for uniqueness

## Stack

- **dbt Core** 1.11
- **DuckDB** 1.10
- **Python** + pandas (inspection scripts)

## How to Run

```bash
dbt seed       # Load raw data
dbt run        # Build all models
dbt test       # Run all 43 tests
dbt docs generate && dbt docs serve
```
