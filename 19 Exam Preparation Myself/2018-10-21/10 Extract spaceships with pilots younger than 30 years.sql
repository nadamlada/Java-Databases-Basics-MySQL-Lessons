/*
10.Extract spaceships with pilots younger than 30 years
Extract from the database those spaceships, which have pilots, younger than 30 years old. In other words, 30 years from 01/01/2019. Sort the results alphabetically by spaceship name.

Required Columns
•	name
•	manufacturer

Example
name	manufacturer
Anarchy	Fivebridge
...	...
*/

SELECT 
    `sh`.`name`,
    `sh`.`manufacturer`
FROM
    `spaceships` AS `sh`
        JOIN
    `journeys` AS `j` ON `j`.`spaceship_id` = `sh`.`id`
        JOIN
    `travel_cards` AS `tc` ON `tc`.`journey_id` = `j`.`id`
        JOIN
    `colonists` AS `c` ON `c`.`id` = `tc`.`colonist_id`
WHERE
    `tc`.`job_during_journey` LIKE 'Pilot'
        AND ADDDATE(`c`.`birth_date`,
        INTERVAL 30 YEAR) > '2019-01-01'
ORDER BY `sh`.`name`;