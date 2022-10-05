/*
14.	Countries with Rivers
Write a query that selects:
•	country_name
•	river_name
Find the first 5 countries with or without rivers in Africa. Sort them by country_name in ascending order.

Еxample
country_name	river_name
Algeria	Niger
Angola	Congo
Benin	Niger
Botswana	NULL
Burkina Faso	Niger
*/

SELECT 
    `c`.`country_name`, `r`.`river_name`
FROM
    `countries` AS `c`
        LEFT JOIN
    `countries_rivers` AS `cr` ON `cr`.`country_code` = `c`.`country_code`
        LEFT JOIN
    `rivers` AS `r` ON `cr`.`river_id` = `r`.`id`
        JOIN
    `continents` AS `cont` ON `c`.`continent_code` = `cont`.`continent_code`
WHERE
-- По-борзо ще е, ащо използваме Primary key-а за търсенето
    `cont`.`continent_name` LIKE 'Africa'
ORDER BY `c`.`country_name` ASC
LIMIT 5;