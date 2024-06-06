SELECT
age_group1,
age_group2,
total_population,
rank() over (order by total_population DESC) AS combine_rank
FROM
(
SELECT
  (minimum_age) AS age_group1,
  (maximum_age) AS age_group2,
  SUM(population) AS total_population
FROM
  `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
GROUP BY
 minimum_age,
 maximum_age
)
ORDER BY
 total_population DESC
LIMIT
  1000;