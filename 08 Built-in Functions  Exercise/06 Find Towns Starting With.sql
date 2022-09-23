/*
6.	 Find Towns Starting With
Write a SQL query to find all towns that start with letters M, K, B or E (case insensitively). Order them alphabetically by town name. Submit your query statements as Prepare DB & run queries.
Example
town_id	name
5	Bellevue
31	Berlin
30	Bordeaux
…	…
*/

SELECT 
    `town_id`, `name`
FROM
    `towns`
WHERE
    `name` REGEXP '^[MmKkBbEe]'
ORDER BY `name`;