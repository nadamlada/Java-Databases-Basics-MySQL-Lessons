/*
03.	Data Deletion
REMOVE from colonists, those which are not assigned to any journey.
*/
    
DELETE `c` FROM `colonists` AS `c`
        LEFT JOIN
    `travel_cards` AS `tc` ON `tc`.`colonist_id` = `c`.`id`
        LEFT JOIN
    `journeys` AS `j` ON `j`.`id` = `tc`.`journey_id` 
WHERE
    `tc`.`journey_id` IS NULL;
    
    
-- -------------

DELETE FROM `colonists` 
WHERE
    `id` NOT IN (SELECT 
        `tc`.`colonist_id`
    FROM
        `travel_cards` AS `tc`);