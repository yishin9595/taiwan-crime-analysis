with crime as (
  select
    extract(year from oc_date) as year,
    oc_county,
    count(*) as total_cases
  from `project_name.2025_profile.crime_statistics_2020_2024`
  where extract(year from oc_date) in (2020, 2024)
  group by 1,2
),

populations as (
  select 
    year,
    county,
    sum(populations) as total_populations
  from `project_name.2025_profile.taiwan_population_2020_2024`
  where year in (2020, 2024)
  group by 1,2
),

crime_rate as (
  select
    c.year,
    c.oc_county,
    round(safe_divide(c.total_cases, p.total_populations) * 10000, 2) as crime_rate_per_10k
  from crime c
  join populations p
    on c.year = p.year
   and c.oc_county = p.county
)

select
  oc_county,
  max(case when year = 2020 then crime_rate_per_10k end) as crime_rate_2020,
  max(case when year = 2024 then crime_rate_per_10k end) as crime_rate_2024,
  round(
    max(case when year = 2024 then crime_rate_per_10k end) - max(case when year = 2020 then crime_rate_per_10k end), 2
    ) as diff,
  round(
    safe_divide(max(case when year = 2024 then crime_rate_per_10k end),max(case when year = 2020 then crime_rate_per_10k end))- 1, 2
    ) as pct_change
from crime_rate
group by 1
order by 1;
