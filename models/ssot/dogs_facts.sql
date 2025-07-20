{{ config(materialized='table') }}

with

source as (

    select * from {{ ref('stg_dogs_breeds') }}

)

select id
    , name
    , weight
    , min_weight
    , max_weight
    , COALESCE((max_weight + min_weight)/2, max_weight, min_weight)                 AS expected_weight
    , bred_for
    , breed_group
    , life_span
    , min_life_span
    , max_life_span
    , COALESCE((max_life_span + min_life_span)/2, max_life_span, min_life_span)     AS expected_life_span
    , temperament
    
from source