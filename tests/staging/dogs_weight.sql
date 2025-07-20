SELECT *
FROM {{ ref('stg_dogs_breeds') }}
WHERE min_weight > 1 OR max_weight < 100 