/*
02.	Insert
You will have to insert records of data into the cards table, based on the clients table. 
For clients with id between 191 and 200 (inclusive), insert data in the cards table with the following values:
•	card_number – set it to full name of the client, but reversed!
•	card_status – set it to "Active".
•	bank_account_id –set it to client's id value. 
*/

INSERT INTO `cards`(
	`card_number`,
	`card_status`,
	`bank_account_id`)
SELECT
	REVERSE(`c`.`full_name`),
	'Active',
	`c`.`id`
FROM `clients` AS `c`
WHERE
    `c`.`id` BETWEEN 191 AND 200;