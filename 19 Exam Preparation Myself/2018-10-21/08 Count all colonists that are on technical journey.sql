/*
08.	Count all colonists that are on technical journey
Count all colonists, that are on technical journey. 

Required Columns
•	Count

Example
count
16
*/

SELECT 
    COUNT(`c`.`id`) AS 'count'
FROM
    `journeys` AS `j`
        JOIN
    `travel_cards` AS `tc` ON `tc`.`journey_id` = `j`.`id`
        JOIN
    `colonists` AS `c` ON `c`.`id` = `tc`.`colonist_id`
WHERE
    `j`.`purpose` LIKE 'Technical';