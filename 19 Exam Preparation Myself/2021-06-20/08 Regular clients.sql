/*
8.	Regular clients
Extract the regular clients, who have ridden in more than one car. The second letter of the customer's full name must be 'a'. Select the full name, the count of cars that he ridden and total sum of all courses.
Order clients by their full_name.

Required Columns
•	full_name
•	count_of_cars
•	total_sum

Example
full_name	count_of_cars	total_sum
Haven Seaton	4	129.65
Jacquelynn Plackstone	2	64.36
Kaylee Coushe	4	135.71
Lanita Crockatt	2	84.12
Parker McGeorge	2	62.58
Randie Cridge	5	154.65
Raynor Dobbison	2	66.77
*/

SELECT
`cl`.`full_name`,
COUNT(`co`.`id`)AS 'count_of_cars',
SUM(`co`.`bill`) AS 'total_sum'
FROM`clients` AS `cl`
JOIN `courses` AS `co`ON `co`.`client_id` = `cl`.`id`
JOIN `cars` AS `ca` ON `ca`.`id` = `co`.`car_id`
WHERE `cl`.`full_name` LIKE '_a%'
GROUP BY `cl`.`id`
HAVING `count_of_cars` > 1
ORDER BY `cl`.`full_name`;