SELECT
  minimum_age,
  maximum_age,
  total_population,
  RANK() OVER (ORDER BY total_population DESC) AS population_rank
FROM (
  SELECT
    minimum_age,
    maximum_age,
    SUM(population) AS total_population
  FROM
    `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
  GROUP BY
    minimum_age,
    maximum_age )
ORDER BY
  total_population DESC
LIMIT
  5;