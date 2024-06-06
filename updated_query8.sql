SELECT zipcode,
female_population,
rank() over(ORDER BY female_population DESC) AS female_rank
FROM
(
    SELECT zipcode,SUM(population)
AS female_population
FROM
`bigquery-public-data.census_bureau_usa.population_by_zip_2010` 
WHERE gender = 'female'
    GROUP BY zipcode
)
    Order by female_population DESC
    LIMIT 5;
