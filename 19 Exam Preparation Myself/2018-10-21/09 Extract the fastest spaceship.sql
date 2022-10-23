/*
09.Extract the fastest spaceship
Extract from the database the fastest spaceship and its destination spaceport name. In other words, the ship with the highest light speed rate.

Required Columns
•	spaceship_name
•	spaceport_name

Example
spaceship_name	spaceport_name
SSE Priestess	Yggdrasil Station
*/

SELECT 
    `sh`.`name` AS 'spaceship_name',
    `p`.`name` AS 'spaceport_name'
FROM
    `spaceships` AS `sh`
        JOIN
    `journeys` AS `j` ON `j`.`spaceship_id` = `sh`.`id`
        JOIN
    `spaceports` AS `p` ON `p`.`id` = `j`.`destination_spaceport_id`
ORDER BY `sh`.`light_speed_rate` DESC
LIMIT 1;