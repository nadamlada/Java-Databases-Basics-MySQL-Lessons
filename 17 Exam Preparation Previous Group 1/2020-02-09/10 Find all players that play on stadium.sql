/*
10.	Find all players that play on stadium
Create a user defined function with the name udf_stadium_players_count (stadium_name VARCHAR(30)) that receives a stadium’s name and returns the number of players that play home matches there.

Example
Query
SELECT udf_stadium_players_count ('Jaxworks') as `count`; 
count
14

Query
SELECT udf_stadium_players_count ('Linklinks') as `count`; 
count
0
*/

DELIMITER ***
CREATE FUNCTION `udf_stadium_players_count` (`stadium_name` VARCHAR(30))
RETURNS INTEGER
DETERMINISTIC
BEGIN
RETURN(
	SELECT 
		COUNT(`p`.`id`)
	FROM
		`players` AS `p`
			RIGHT JOIN
		`teams` AS `t` ON `t`.`id` = `p`.`team_id`
			RIGHT JOIN
		`stadiums` AS `s` ON `s`.`id` = `t`.`stadium_id`
	WHERE
		`s`.`name` = `stadium_name`
        );
END
***

SELECT `udf_stadium_players_count`('Jaxworks');
