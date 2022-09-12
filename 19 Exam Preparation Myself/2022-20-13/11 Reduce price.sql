/*
11.	Reduce price
Create a stored procedure udp_reduce_price which accepts the following parameters:
•	category_name (VARCHAR(50))
Extracts data about the products from the given category and reduces the prices by 30% of all products which have reviews with rating less than 4 and are from the given category.

Result
Query
CALL udp_reduce_price ('Phones and tablets');
This execution will update 6 products – Galaxy M52 5G, Galaxy Z Fold3 5G, XS 420 …
Result
Galaxy M52 5G - 789.00 -> 552.30 
Galaxy Z Fold3 5G – 599.00 -> 419.30 
XS 420 – 754.00 -> 527.80
…    …   … 
*/

DELIMITER ***
CREATE PROCEDURE `udp_reduce_price` (`category_name`VARCHAR(50))
BEGIN
	UPDATE `categories` AS `c`
			JOIN
		`products` AS `p` ON `p`.`category_id` = `c`.`id`
			JOIN
		`reviews` AS `r` ON `r`.`id` = `p`.`review_id` 
	SET 
		`p`.`price` = `p`.`price` * 0.70
	WHERE
		`r`.`rating` < 4
			AND `c`.`name` = `category_name`;
END
***

CALL `udp_reduce_price`('Phones and tablets')***