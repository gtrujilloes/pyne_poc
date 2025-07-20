SELECT COUNT(*) as row_count
FROM {{ ref('stg_dogs_breeds') }}
HAVING COUNT(*) > 5000  -- set your lower threshold