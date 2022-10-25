/*
16. Modify spaceship
Create a user defined stored procedure with the name udp_modify_spaceship_light_speed_rate(spaceship_name VARCHAR(50), light_speed_rate_increse INT(11)) that receives a spaceship name and light speed increase value and increases spaceship light speed only if the given spaceship exists. If the modifying is not successful rollback any changes and throw an exception with error code ‘45000’ and message: “Spaceship you are trying to modify does not exists.” 

Example
Query
CALL udp_modify_spaceship_light_speed_rate (‘Na Pesho koraba’, 1914);
SELECT name, light_speed_rate FROM spacheships WHERE name = ‘Na Pesho koraba’
Response
Spaceship you are trying to modify does not exists.
Query
CALL udp_modify_spaceship_light_speed_rate (‘USS Templar’, 5);
SELECT name, light_speed_rate FROM spaceships WHERE name = ‘USS Templar’
name	light_speed_rate
USS Templar	11
*/

DELIMITER ***
CREATE PROCEDURE `udp_modify_spaceship_light_speed_rate` (`spaceship_name` VARCHAR(50) ,`light_speed_rate_increse` INT)
BEGIN
	IF
		(SELECT
			COUNT(`name`)
		FROM 
			`spaceships` 
		WHERE `name` = `spaceship_name` > 0)
	THEN
		UPDATE 
			`spaceships`
		SET 
		`light_speed_rate` = `light_speed_rate` + `light_speed_rate_increse`
		WHERE `name` = `spaceship_name`;
	ELSE
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Spaceship you are trying to modify does not exists.';
		ROLLBACK;
	END IF;
END
***