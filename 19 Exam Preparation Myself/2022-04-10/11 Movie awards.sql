/*
11.	Movie awards
A movie has won an award. Your task is to find all actors and give them the award.
Create a stored procedure udp_award_movie which accepts the following parameters:
•	movie_title(VARCHAR(50))
Extracts data about the movie with the given title and find all actors that play in it and increase their awards with 1.

Result
Query
CALL udp_award_movie('Tea For Two');
This execution will update 3 actors – Vanna Bilborough, Armando Cabrera, Ingrid Ackenhead
Result

full_name	awards
before	->	awards
after
Vanna Bilborough	20	->	21
Armando Cabrera	18	->	19
Ingrid Ackenhead	24	->	25
*/

DELIMITER ***
CREATE PROCEDURE `udp_award_movie` (`movie_title` VARCHAR(50))
BEGIN
	UPDATE
			`actors` AS `a`
				JOIN
			`movies_actors` AS `ma` ON `ma`.`actor_id` = `a`.`id`
				JOIN
			`movies` AS `m` ON `m`.`id` = `ma`.`movie_id`
	SET `a`.`awards` = `a`.`awards` + 1
	WHERE `m`.`title` LIKE `movie_title`;
END
***

CALL udp_award_movie('Tea For Two')***