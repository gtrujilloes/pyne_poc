SELECT COUNT(*) as row_count
FROM {{ ref('stg_dogs_breeds') }}
HAVING COUNT(*) < 200  -- set your lower threshold
