/*
11.	Extract Client Info
Create a stored procedure udp_clientinfo which accepts the following parameters:
•	full_name
And extracts data about the client with the given full name.
Aside from the full_name, the procedure should extract the client's age, bank account number and balance.
The account’s salary should have "$" prefix.
 
Result
full_name	age	account_number	balance
Hunter Wesgate	33	69666616-8	$803355.32
*/

DELIMITER ***
CREATE PROCEDURE `udp_clientinfo` (`full_name` VARCHAR (50))
BEGIN
	SELECT 
		`cl`.`full_name`,
		`cl`.`age`,
		`ba`.`account_number`,
		CONCAT('$', `ba`.`balance`) AS 'balance'
	FROM
		`clients` AS `cl`
			JOIN
		`bank_accounts` AS `ba` ON `ba`.`client_id` = `cl`.`id`
			JOIN
		`cards` AS `ca` ON `ca`.`bank_account_id` = `ba`.`id`
	WHERE
		`cl`.`full_name` = `full_name`
	GROUP BY `cl`.`id`;
END
***

CALL `udp_clientinfo` ('Hunter Wesgate')***