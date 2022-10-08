/*
3.	Town Names Starting With
Write a stored procedure usp_get_towns_starting_with that accept string as parameter and returns all town names starting with that string. The result should be sorted by town_name alphabetically. Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
Here is the list of all towns starting with "b".
town_name
Bellevue
Berlin 
Bordeaux
Bothell
*/

DELIMITER ***
CREATE PROCEDURE `usp_get_towns_starting_with` (`town_name` VARCHAR(50))
BEGIN
	SELECT 
		`name` AS 'town_name'
	FROM
		`towns`
	WHERE
		`name` LIKE CONCAT(`town_name`, '%')
	ORDER BY `name`;
END
***

CALL `usp_get_towns_starting_with` ('b')***