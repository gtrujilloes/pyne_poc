SELECT *
FROM {{ ref('stg_dogs_breeds') }}
WHERE min_weight < 0