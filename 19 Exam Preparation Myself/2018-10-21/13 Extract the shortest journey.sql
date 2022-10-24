/*
13.Extract the shortest journey
Extract from the database the shortest journey, its destination spaceport name, planet name and purpose.
Required Columns
•	Id
•	planet_name
•	spaceport_name
•	journey_purpose

Example
id	planet_name	spaceport_name	journey_purpose
3	Casmadus	Minerva Station	Military
*/

SELECT 
    `j`.`id`,
    `p`.`name` AS 'planet_name',
    `sp`.`name` AS 'spaceport_name',
    `j`.`purpose` AS 'journey_purpose'
FROM
    `planets` AS `p`
        JOIN
    `spaceports` AS `sp` ON `sp`.`planet_id` = `p`.`id`
        JOIN
    `journeys` AS `j` ON `j`.`destination_spaceport_id` = `sp`.`id`
ORDER BY DATEDIFF(`j`.`journey_end`, `j`.`journey_start`)
LIMIT 1;