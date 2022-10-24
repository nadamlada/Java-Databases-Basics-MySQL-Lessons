/*
11. Extract all educational mission planets and spaceports
Extract from the database names of all planets and their spaceports, which have educational missions. Sort the results by spaceport name in descending order.

Required Columns
•	planet_name
•	spaceport_name

Example
planet_name	spaceport_name
Kascarth	Yggdrasil Station
Lescore	Tartarus
...	...
*/

SELECT 
    `p`.`name` AS 'planet_name', `sp`.`name` AS 'spaceport_name'
FROM
    `planets` AS `p`
        JOIN
    `spaceports` AS `sp` ON `sp`.`planet_id` = `p`.`id`
        JOIN
    `journeys` AS `j` ON `j`.`destination_spaceport_id` = `sp`.`id`
WHERE
    `j`.`purpose` = 'Educational'
ORDER BY `sp`.`name` DESC;