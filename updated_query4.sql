SELECT
  gender,
  age_group1,
  age_group2,
  max_population,
  RANK() OVER(ORDER BY age_group1, age_group2 DESC) AS rank
FROM (
  SELECT
    gender,
    SUM(minimum_age) AS age_group1,
    SUM(maximum_age) AS age_group2,
    SUM(population) AS max_population,
  FROM
    `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
  WHERE
    ZIPCODE = '94085'
    AND gender = 'male'
  GROUP BY
    gender )
ORDER BY
  age_group1,
  age_group2 DESC,
  max_population DESC
LIMIT
  1000;