/*
07.	Extract all pilots
Extract from the database all colonists, which have a pilot job. Sort the result by id, ascending.

Required Columns
•	id
•	full_name

Example
id	full_name
6	Clark Cowan
18	Wald Bim
...	...
*/

SELECT 
    `c`.`id`,
    CONCAT(`c`.`first_name`, ' ', `c`.`last_name`) AS 'full_name'
FROM
    `colonists` AS `c`
        LEFT JOIN
    `travel_cards` AS `tc` ON `tc`.`colonist_id` = `c`.`id`
WHERE
    `tc`.`job_during_journey` LIKE 'Pilot'
ORDER BY `c`.`id`;