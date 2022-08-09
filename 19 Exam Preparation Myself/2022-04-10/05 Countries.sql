/*
05.	Countries
Extract from the softuni_imdb system database, info about the name of countries.
Order the results by currency in descending order and then by id.
Required Columns
•	id (countries)
•	name
•	continent
•	currency
Example
id	name	continent	currency
42	South Africa	Africa	ZAR
53	Uzbekistan	Asia	UZS
50	Uruguay	South America	UYU
...	...		
*/

SELECT 
    `id`, `name`, `continent`, `currency`
FROM
    `countries`
ORDER BY `currency` DESC , `id`;