/*
04.	Delete
Delete all customers, who didn't order anything.
*/

DELETE `c`
FROM
	`orders` AS `o`
		RIGHT JOIN
	`customers` AS `c` ON `c`.`id` = `o`.`customer_id`
WHERE `o`.`id` IS NULL;