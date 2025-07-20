with source as as (
    select *
    from {{ ref('dogs_facts') }}

)

, classified_weights as (

  select
    *
    , case
      when expected_weight < 10 then 'Small'
      when expected_weight between 10 and 25 then 'Medium'
      else 'Large'
    end                         as weight_class

  from source

),

weight_dist as (

  select breed_group
        , weight_class
        , count(*)              as class_count
  from classified_weights
  group by all

)

, total_per_breed as (

  select
    , breed_group
    , count(*)                  as total_count
  from classified_weights
  group by all

)

, weight_stats as (

  select breed_group
    , avg(expected_weight)                          as avg_weight
    , approx_quantiles(expected_weight)[OFFSET(1)]  as median_weight
    , min(expected_weight)                          as min_weight,
    , max(expected_weight)                          as max_weight
  from source
  group by all

)

select
  weight_dist.breed_group,
  weight_dist.weight_class,
  weight_dist.class_count,
  round(weight_dist.class_count * 100.0 / total_per_breed.total_count, 2) as pct_class_share,
  weight_stats.avg_weight,
  weight_stats.median_weight,
  weight_stats.min_weight,
  weight_stats.max_weight
from weight_dist
    left join total_per_breed on weight_dist.breed_group = total_per_breed.breed_group
    left join weight_stats on weight_dist.breed_group = weight_stats.breed_group
order by weight_dist.breed_group, weight_dist.weight_class