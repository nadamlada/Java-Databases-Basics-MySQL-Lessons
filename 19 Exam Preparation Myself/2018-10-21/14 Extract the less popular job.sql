/*
14.Extract the less popular job
Extract from the database the less popular job in the longest journey. In other words, the job with less assign colonists.

Required Columns
•	job_name

Example
job_name
Engineer
*/

SELECT 
    `tc`.`job_during_journey` AS 'job_name'
FROM
    `travel_cards` AS `tc`
        JOIN
    `journeys` AS `j` ON `j`.`id` = `tc`.`journey_id`
GROUP BY `j`.`id` , `tc`.`job_during_journey`
ORDER BY DATEDIFF(`j`.`journey_end`, `j`.`journey_start`) DESC , COUNT(`tc`.`id`)
LIMIT 1;