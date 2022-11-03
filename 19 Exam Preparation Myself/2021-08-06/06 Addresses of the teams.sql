/*
6.	    Addresses of the teams
Extract from the database all the team names and their addresses. Also display the count of the characters of the address names.
Skip those teams whose office does not have a website. 
Order the results by team names, then by the address names. 
Required Columns
•	team_name
•	address_name
•	count_of_characters(of the address name)

Example
team_name	address_name	count_of_characters
Abbott, Deckow and Goyette	20605 Helena Lane	17
Armstrong	49099 Manitowish Court	22
Bartoletti-King	10 Jenna Park	13
…	…	…
Yost Group	31314 Butterfield Lane	22
Yundt	444 Golden Leaf Place	21
*/

SELECT
	`t`.`name`,
    `a`.`name`,
    CHAR_LENGTH(`a`.`name`) AS 'count_of_characters'
FROM `addresses` AS `a`
RIGHT JOIN `offices` AS `o` ON `o`.`address_id` = `a`.`id`
RIGHT JOIN `teams` AS `t` ON `t`.`office_id` = `o`.`id`
WHERE `o`.`website` IS NOT NULL
ORDER BY `t`.`name`, `a`.`name`;