/*8.	The fastest player by towns
Extract from the database, the fastest player (having max speed), in terms of towns where their team played.
Order players by speed descending, then by town name.
Skip players that played in team ‘Devify’

Required Columns
•	max_speed
•	town_name

Example
max_speed	town_name
97	Smolensk
92	Bromma
92	Lühua
…	…
NULL	Zavolzh’ye
*/

SELECT 
    MAX(`sd`.`speed`) AS 'max_speed', `to`.`name` AS 'town_name'
FROM
    `skills_data` AS `sd`
        RIGHT JOIN
    `players` AS `p` ON `p`.`skills_data_id` = `sd`.`id`
        RIGHT JOIN
    `teams` AS `t` ON `t`.`id` = `p`.`team_id`
        RIGHT JOIN
    `stadiums` AS `s` ON `s`.`id` = `t`.`stadium_id`
        RIGHT JOIN
    `towns` AS `to` ON `to`.`id` = `s`.`town_id`
WHERE
    `t`.`name` != 'Devify'
GROUP BY `to`.`id`
ORDER BY `max_speed` DESC , `town_name`;