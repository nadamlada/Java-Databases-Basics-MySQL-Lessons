/*
10.	History movies
Create a user defined function with the name udf_actor_history_movies_count(full_name VARCHAR(50)) that receives an actor’s full name and returns the total number of history movies in which the actor has a role.

Required Columns
•	history_movies(udf_customer_products_count)

Example

Query
SELECT udf_actor_history_movies_count('Stephan Lundberg')  AS 'history_movies';
history_movies
2

Query
SELECT udf_actor_history_movies_count('Jared Di Batista')  AS 'history_movies';
history_movies
1
*/

DELIMITER ***
CREATE FUNCTION `udf_actor_history_movies_count` (`full_name` VARCHAR(50))
RETURNS INTEGER
DETERMINISTIC
BEGIN
RETURN 
	(SELECT 
		COUNT(*)
	FROM
		`actors` AS `a`
			JOIN
		`movies_actors` AS `ma` ON `ma`.`actor_id` = `a`.`id`
			JOIN
		`movies` AS `m` ON `m`.`id` = `ma`.`movie_id`
			JOIN
		`genres_movies` AS `gm` ON `gm`.`movie_id` = `m`.`id`
			JOIN
		`genres` AS `g` ON `g`.`id` = `gm`.`genre_id`
	WHERE
		`g`.`name` = 'History'
			AND CONCAT(`a`.`first_name`, ' ', `a`.`last_name`) = `full_name`
	GROUP BY `a`.`id`);
END
***

SELECT udf_actor_history_movies_count('Jared Di Batista')  AS 'history_movies'***