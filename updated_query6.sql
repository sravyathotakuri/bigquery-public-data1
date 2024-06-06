SELECT zipcode,
total_population,
  RANK() OVER (ORDER BY
  total_population DESC) AS rank
  FROM(
SELECT
  zipcode,
  SUM(population) AS total_population,

FROM
  `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
GROUP BY
  zipcode
  )
ORDER BY
  total_population DESC
LIMIT
  1000;