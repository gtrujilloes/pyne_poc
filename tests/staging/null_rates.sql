SELECT *
FROM (
    SELECT
        COUNTIF(weight IS NULL) / COUNT(*) AS null_rate_weight,
        COUNTIF(life_span IS NULL) / COUNT(*) AS null_rate_lifespan
    FROM {{ ref('stg_dogs_breeds') }}
)
WHERE null_rate_weight > 0.1
    OR  null_rate_lifespan > 0.1 -- allow max 5% nulls