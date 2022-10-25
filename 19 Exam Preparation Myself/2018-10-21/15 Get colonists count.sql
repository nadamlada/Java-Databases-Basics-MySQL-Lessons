/*
15. Get colonists count
Create a user defined function with the name udf_count_colonists_by_destination_planet (planet_name VARCHAR (30)) that receives planet name and returns the count of all colonists sent to that planet.

Example
Query
SELECT p.name, udf_count_colonists_by_destination_planet(‘Otroyphus’) AS count
FROM planets AS p
WHERE p.name = ‘Otroyphus’;
name	count
Otroyphus	35
*/

DELIMITER ***
CREATE FUNCTION `udf_count_colonists_by_destination_planet` (`planet_name` VARCHAR (30))
RETURNS INTEGER
DETERMINISTIC
BEGIN

RETURN (
		SELECT 
		COUNT(`co`.`id`)
	FROM
		`planets` AS `p`
			JOIN
		`spaceports` AS `sp` ON `sp`.`planet_id` = `p`.`id`
			JOIN
		`journeys` AS `j` ON `j`.`destination_spaceport_id` = `sp`.`id`
			JOIN
		`travel_cards` AS `tc` ON `tc`.`journey_id` = `j`.`id`
			JOIN
		`colonists` AS `co` ON `co`.`id` = `tc`.`colonist_id`
	WHERE `p`.`name` = `planet_name`
	GROUP BY `p`.`name`
);
END
***

SELECT p.name, udf_count_colonists_by_destination_planet('Otroyphus') AS count
FROM planets AS p
WHERE p.name = 'Otroyphus';