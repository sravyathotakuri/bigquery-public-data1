SELECT
  gender,
  SUM(population) AS total_population,
  RANK() OVER (ORDER BY gender DESC)
FROM
  `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE
  zipcode = '94085'
GROUP BY
  gender;