/*
10.	Find all basic information for a game
Create a user defined function with the name udf_game_info_by_name (game_name VARCHAR (20)) that receives a game's name and returns the basic information as a text sentence.
•	Example
o	The "game_name" is developed by a "team_name" in an office 
with an address "address_text"

Example 1
Query
SELECT udf_game_info_by_name('Bitwolf') AS info;
info
The Bitwolf is developed by a Rempel-O'Kon in an office with an address 92 Memorial Park

Example 2
Query
SELECT udf_game_info_by_name('Fix San') AS info;
info
The Fix San is developed by a Schulist in an office with an address 75 Harper Way

Example 3
Query
SELECT udf_game_info_by_name('Job') AS info;
info
The Job is developed by a Shields Group in an office with an address 036 Stuart Pass
*/

DELIMITER ***
CREATE FUNCTION `udf_game_info_by_name` (`game_name` VARCHAR (20))
RETURNS TEXT
DETERMINISTIC
BEGIN
	DECLARE `info` VARCHAR(255);
    DECLARE `team_name` VARCHAR(40);
    DECLARE `address_text` VARCHAR(50);
    
    SET `team_name`:= (SELECT 
		`t`.`name`
	FROM
		`games` AS `g`
			JOIN
		`teams` AS `t` ON `t`.`id` = `g`.`team_id` 
        	WHERE
		`g`.`name` = `game_name`);
        
	SET `address_text` := (SELECT
		`a`.`name`
	FROM
		`teams` AS `t`
			JOIN
		`offices` AS `o` ON `o`.`id` = `t`.`office_id`
			JOIN
		`addresses` AS `a` ON `a`.`id` = `o`.`address_id`
        WHERE
		`t`.`name` = `team_name`);
        
    SET `info`:= 
	   CONCAT_WS(' ',
	   'The',
	   `game_name`,
	   'is developed by a',
		`team_name`, 
		'in an office with an address',
		`address_text`);

RETURN `info`;
END
***

SELECT udf_game_info_by_name('Job') AS info***