{{ config(materialized='table') }}

with

source as (

    select * from {{ source('dog_raw','dog_api_raw') }}

)

select id
    , name
    , weight
    , SAFE_CAST(SPLIT(weight, ' - ')[SAFE_OFFSET(0)] AS FLOAT64) AS min_weight
    , SAFE_CAST(SPLIT(weight, ' - ')[SAFE_OFFSET(1)] AS FLOAT64) AS max_weight
    , bred_for
    , breed_group
    , life_span
    , SAFE_CAST(TRIM(SPLIT(life_span, '-')[SAFE_OFFSET(0)]) AS INT64) AS min_life_span
    , SAFE_CAST(REGEXP_EXTRACT(life_span, r'-\s*(\d+)') AS INT64) AS max_life_span
    , temperament
    
from source
where id is not null 
    and breed_group is not null 
    and breed_group != ''