/*
11.	Find good playmaker by teams
Create a stored procedure udp_find_playmaker which accepts the following parameters:
•	min_dribble_points 
•	team_name (with max length 45)
 And extracts data about the players with the given skill stats (more than min_dribble_points), played for given team (team_name) and have more than average speed for all players. Order players by speed descending. Select only the best one.
Show all needed info for this player: full_name, age, salary, dribbling, speed, team name.
CALL udp_find_playmaker (20, ‘Skyble’);
Result
full_name	age	salary	dribbling	speed	team_name
Royal Deakes	19	49162.77	33	92	Skyble
*/

DELIMITER ***
CREATE PROCEDURE `udp_find_playmaker` (`min_dribble_points` INT, `team_name` VARCHAR(45))
BEGIN
SELECT 
    CONCAT(`p`.`first_name`, ' ', `p`.`last_name`) AS 'full_name',
    `p`.`age`,
    `p`.`salary`,
    `sd`.`dribbling`,
    `sd`.`speed`,
    `t`.`name`
FROM
    `skills_data` AS `sd`
        RIGHT JOIN
    `players` AS `p` ON `p`.`skills_data_id` = `sd`.`id`
        RIGHT JOIN
    `teams` AS `t` ON `t`.`id` = `p`.`team_id`
WHERE
    `sd`.`dribbling` > `min_dribble_points`
        AND `t`.`name` = `team_name`
        AND `sd`.`speed` > (SELECT AVG(`speed`) FROM `skills_data`)
ORDER BY `sd`.`speed` DESC
LIMIT 1;
END
***

CALL `udp_find_playmaker`(20, 'Skyble')***
