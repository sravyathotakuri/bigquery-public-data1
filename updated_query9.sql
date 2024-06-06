SELECT zipcode, male_population,
rank() over (ORDER BY male_population ASC) AS male_rank
FROM
(
  SELECT zipcode, SUM(population) AS male_population
 FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
 WHERE gender='male'
 Group by zipcode
)
 Order by male_population ASC
  LIMIT 10;