/*
7.	 Find Towns Not Starting With
Write a SQL query to find all towns that do not start with letters R, B or D (case insensitively). Order them alphabetically by name. Submit your query statements as Prepare DB & run queries.
Example
town_id	name
2	Calgary
23	Cambridge
15	Carnation
…	…
*/

SELECT 
    *
FROM
    `towns`
WHERE
    UPPER(`name`) NOT LIKE 'R%'
        AND UPPER(`name`) NOT LIKE 'D%'
        AND UPPER(`name`) NOT LIKE 'B%'
ORDER BY `name` ASC;