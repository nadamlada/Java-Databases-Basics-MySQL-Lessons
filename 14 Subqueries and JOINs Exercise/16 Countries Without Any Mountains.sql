/*
16.  Countries Without Any Mountains
Find the count of all countries which don't have a mountain.

Example
country_count
231
*/

SELECT
	COUNT(*) AS 'country_count'
FROM `countries` AS `c`
LEFT JOIN `mountains_countries` AS `mc` ON `mc`.`country_code` = `c`.`country_code`
WHERE `mc`.`mountain_id` IS NULL;