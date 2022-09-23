/*
5.	Find Towns with Name Length
Write a SQL query to find town names that are 5 or 6 symbols long and order them alphabetically by town name. Submit your query statements as Prepare DB & run queries.
Example
name
Berlin
Duluth
Duvall
…
*/

SELECT 
    `name`
FROM
    `towns`
WHERE
    CHAR_LENGTH(`name`) IN (5 , 6)
ORDER BY `name`;