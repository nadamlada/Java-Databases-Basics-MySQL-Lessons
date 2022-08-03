/*
10.	Extract client cards count
Create a user defined function with the name udf_client_cards_count(name VARCHAR(30)) that receives a client's full name and returns the number of cards he has.
Required Columns
•	full_name (clients)
•	cards (count of cards)

Example
Query
SELECT c.full_name, udf_client_cards_count('Baxy David') as `cards` FROM clients c
WHERE c.full_name = 'Baxy David';
full_name	cards
Baxy David	6
*/

DELIMITER ***
CREATE FUNCTION `udf_client_cards_count` (`name` VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN

RETURN (
	SELECT 
		COUNT(`ca`.`id`)
	FROM
		`clients` AS `cl`
			LEFT JOIN
		`bank_accounts` AS `ba` ON `ba`.`client_id` = `cl`.`id`
			LEFT JOIN
		`cards` AS `ca` ON `ca`.`bank_account_id` = `ba`.`id`
	WHERE `cl`.`full_name` = `name`
	GROUP BY `cl`.`id`
);
END
***

SELECT c.full_name, udf_client_cards_count('Baxy David') as `cards` FROM clients c
WHERE c.full_name = 'Baxy David'***