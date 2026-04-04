with real_estate_midian as (
  select
    county,
    district,
    approx_quantiles(unit_price, 2)[offset(1)] as median_unit_price
  from `project_name.2025_profile.taipei_newtaipei_real_estate_transactions_2020_202505`
  group by county,district
),

crime_record_total as (
  select
    oc_county,
    oc_region,
    sum(total_cases) as total_crime_cases,
  from `project_name.2025_crime.crime_record_by_crime_rate_per_10k`
  group by 1,2
),

populations_total as (
  select
    county,
    district,
    sum(populations) as total_populations,
  from `project_name.2025_profile.taiwan_population_2020_2024`
  group by 1,2
)


select
  c.oc_county,
  c.oc_region,
  r.median_unit_price,
  c.total_crime_cases,
  p.total_populations,
  round(safe_divide(c.total_crime_cases , p.total_populations) * 10000 , 2) as crime_rate_per_10k
from crime_record_total as c
join real_estate_midian as r
  on c.oc_county = r.county
  and c.oc_region = r.district
join populations_total as p
  on r.county = p.county
  and r.district = p.district;
