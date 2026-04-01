with crime as 
(
  select
    extract(year from oc_date) as year,
    oc_county,
    oc_region,
    type,
    count(type) as total_cases
  from `YOUR_PROJECT_ID.2025_profile.crime_statistics_2020_2024`
  group by 1,2,3,4
),

populations as (
  select 
    year,
    county,
    district,
    sum(populations) as populations
  from `YOUR_PROJECT_ID.2025_profile.taiwan_population_2020_2024`
  group by 1,2,3
)

select 
  p.year,
  c.oc_county,
  c.oc_region,
  c.type,
  c.total_cases,
  p.populations,
  round(safe_divide(total_cases,populations) *10000 ,2) as crime_rate_per_10k
from crime as c
join populations as p
  on c.year = p.year
  and c.oc_county = p.county
  and c.oc_region = p.district
