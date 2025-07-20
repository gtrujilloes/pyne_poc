with lifespan_stats as (
  
  select breed_group
    -- Calculate average as the mean of min and max lifespan
    , avg(expected_life_span)                                as avg_life_span
    , approx_quantiles(expected_life_span, 2)[OFFSET(1)]     as median_life_span
    , min(min_life_span)                                     as min_life_span
    , max(max_life_span)                                     as max_life_span
    , count(*)                                               as breed_count
  
  from {{ ref('dogs_facts') }}
  group by breed_group
)

select
  *
  , rank() over (order by avg_life_span desc)           as life_span_rank
from lifespan_stats
order by avg_life_span desc
