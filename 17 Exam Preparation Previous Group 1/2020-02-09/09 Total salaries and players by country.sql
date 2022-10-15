/*
9.	Total salaries and players by country

 And like everything else in this world, everything is ultimately about finances. Now you need to extract detailed information on the amount of all salaries given to football players by the criteria of the country in which they played.
If there are no players in a country, display NULL.  Order the results by total count of players in descending order, then by country name alphabetically.

Required Columns
•	name (country)
•	total_sum_of_salaries
•	total_count_of_players
Example
name	total_count_of_players	total_sum_of_salaries
Sweden	28	14968947.79

Brazil	18	8352732.65

China	13	7042890.51

Russia
	7	2230759.71
…	…	…
Thailand
	0	NULL
United States
	0	NULL
*/

SELECT
	`c`.`name` AS 'name',
	COUNT(`p`.`id`) AS 'total_count_of_players',
    SUM(`p`.`salary`) AS 'total_sum_of_salaries'
FROM
	`countries` AS `c`
LEFT JOIN `towns` AS `to` ON `to`.`country_id` = `c`.`id`
LEFT JOIN `stadiums` AS `s` ON `s`.`town_id` = `to`. `id`
LEFT JOIN `teams` AS `te` ON `te`.`stadium_id` = `s`. `id`
LEFT JOIN `players`AS `p` ON `p`.`team_id` = `te`.`id`
GROUP BY `c`.`id`
ORDER BY `total_count_of_players` DESC, `c`.`name`;