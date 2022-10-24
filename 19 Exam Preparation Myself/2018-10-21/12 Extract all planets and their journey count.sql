/*
12. Extract all planets and their journey count
Extract from the database all planets’ names and their journeys count. Order the results by journeys count, descending and by planet name ascending.
Required Columns
•	planet_name
•	journeys_count

Example
planet_name	journeys_count
Otroyphus	4
Eipra	2
...	...
*/

SELECT 
    `p`.`name` AS 'planet_name',
    COUNT(`j`.`id`) AS 'journeys_count'
FROM
    `planets` AS `p`
        JOIN
    `spaceports` AS `sp` ON `sp`.`planet_id` = `p`.`id`
        JOIN
    `journeys` AS `j` ON `j`.`destination_spaceport_id` = `sp`.`id`
GROUP BY `p`.`id`
ORDER BY `journeys_count` DESC , `planet_name`;