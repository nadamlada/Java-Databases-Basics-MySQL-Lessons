/*
12.	Highest Peaks in Bulgaria
Write a query that selects:
•	country_code	
•	mountain_range
•	peak_name
•	elevation
Filter all peaks in Bulgaria with elevation over 2835. Return all rows sorted by elevation in descending order.

Example
country_code	mountain_range	peak_name	elevation
BG	Rila	Musala	2925
BG	Pirin	Vihren	2914
…	…	…	…
*/

SELECT 
    `c`.`country_code`,
    `m`.`mountain_range`,
    `p`.`peak_name`,
    `p`.`elevation`
FROM
    `countries` AS `c`
        JOIN
    `mountains_countries` AS `mc` ON `mc`.`country_code` = `c`.`country_code`
        JOIN
    `mountains` AS `m` ON `m`.`id` = `mc`.`mountain_id`
        JOIN
    `peaks` AS `p` ON `p`.`mountain_id` = `m`.`id`
WHERE
    `c`.`country_name` = 'Bulgaria'
        AND `p`.`elevation` > 2835
ORDER BY `p`.`elevation` DESC;