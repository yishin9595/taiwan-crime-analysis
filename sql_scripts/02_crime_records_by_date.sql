select
  extract(year from oc_date) as year,
  extract(month from oc_date) as month,
  type,
  oc_county,
  oc_region
from `project_name.2025_profile.crime_statistics_2020_2024`
order by year,month
