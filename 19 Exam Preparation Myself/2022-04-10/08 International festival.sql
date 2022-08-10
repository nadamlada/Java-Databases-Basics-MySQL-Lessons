/*
08.	International festival
The international movie festival is about to begin. We need to find the countries which are nominated to host the event.
Extract from the database, the name the country and the number of movies created in this country. The number of movies must be higher or equal to 7.
Order the results descending by name.
Required Columns
•	name (country)
•	movies_count (number of movies created in the country)

Examples
name	movies_count
Sweden	13
Serbia	8
Philippines	9
…	…
Argentina	7
*/

SELECT 
    `c`.`name`, COUNT(`c`.`id`) AS 'movies_count'
FROM
    `countries` AS `c`
        JOIN
    `movies` AS `m` ON `m`.`country_id` = `c`.`id`
GROUP BY `c`.`name`
HAVING `movies_count` >= 7
ORDER BY `c`.`name` DESC;