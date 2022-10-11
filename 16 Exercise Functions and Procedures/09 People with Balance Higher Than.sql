/*
9.	People with Balance Higher Than
Your task is to create a stored procedure usp_get_holders_with_balance_higher_than that accepts a number as a parameter and returns all people who have more money in total of all their accounts than the supplied number. The result should be sorted by account_holders.id ascending. 
Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
Supplied number for that example is 7000.
first_name	last_name
Susan	Cane
Petar	Kirilov
Zlatina	Pateva
…	…
*/

DELIMITER ***
CREATE PROCEDURE `usp_get_holders_with_balance_higher_than` (`accepted_parameter` DECIMAL(19, 4))
BEGIN
	SELECT 
		`ah`.`first_name`, `ah`.`last_name`
	FROM
		`account_holders` AS `ah`
			RIGHT JOIN
		`accounts` AS `a` ON `a`.`account_holder_id` = `ah`.`id`
 -- GROUP BY `ah`.`first_name`, `ah`.`last_name`
	GROUP BY `ah`.`id`
	HAVING
		SUM(`a`.`balance`) > `accepted_parameter`
	ORDER BY `ah`.`id`;
END
***

CALL `usp_get_holders_with_balance_higher_than` (7000)***
DROP PROCEDURE `usp_get_holders_with_balance_higher_than`***