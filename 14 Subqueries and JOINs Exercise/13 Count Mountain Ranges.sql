/*
13.	Count Mountain Ranges
Write a query that selects:
•	country_code
•	mountain_range
Filter the count of the mountain ranges in the United States, Russia and Bulgaria. Sort result by mountain_range count in decreasing order.

Example
country_code	mountain_range
BG	6
RU	1
US	1
*/

SELECT 
    `c`.`country_code`,
    COUNT(`mc`.`mountain_id`) AS 'mountain_range'
FROM
    `countries` AS `c`
        JOIN
    `mountains_countries` AS `mc` ON `c`.`country_code` = `mc`.`country_code`
        JOIN
    `mountains` AS `m` ON `mc`.`mountain_id` = `m`.`id`
GROUP BY `c`.`country_code`
HAVING `c`.`country_code` IN ('BG' , 'RU', 'US')
ORDER BY `mountain_range` DESC;