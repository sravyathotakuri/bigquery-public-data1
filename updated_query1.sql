SELECT
  population,
  RANK() OVER (ORDER BY population DESC)
FROM
  `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE
  zipcode = '94085'
ORDER BY
  population DESC;