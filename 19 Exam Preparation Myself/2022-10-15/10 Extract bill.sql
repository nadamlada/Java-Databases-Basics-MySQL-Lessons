/*
10.	Extract bill
Create a user defined function with the name udf_client_bill(full_name VARCHAR(50)) that receives a customer’s full name and returns the total price of products he ordered;

Required Columns
•	first_name (client)
•	last_name (client)
•	bill (udf_client_bill) (should be DECIMAL(19,2))

Example
Query
SELECT c.first_name,c.last_name, udf_client_bill('Silvio Blyth') as 'bill' FROM clients c
WHERE c.first_name = 'Silvio' AND c.last_name= 'Blyth';
first_name	last_name	bill
Silvio	Blyth	96.90
*/

DELIMITER ***
CREATE FUNCTION `udf_client_bill` (`full_name` VARCHAR(50))
RETURNS DECIMAL(19, 2)
DETERMINISTIC
BEGIN

RETURN (
	SELECT s
		SUM(`p`.`price`)
	FROM
		`clients` AS `c`
			JOIN
		`orders_clients` AS `oc` ON `oc`.`client_id` = `c`.`id`
			JOIN
		`orders` AS `o` ON `o`.`id` = `oc`.`order_id`
			JOIN
		`orders_products` AS `op` ON `op`.`order_id` = `o`.`id`
			JOIN
		`products` AS `p` ON `p`.`id` = `op`.`product_id`
	WHERE CONCAT_WS(' ', `c`.`first_name`, `c`.`last_name`) = `full_name`
	GROUP BY `c`.`id`);
END
***

SELECT c.first_name,c.last_name, udf_client_bill('Silvio Blyth') as 'bill' FROM clients c
WHERE c.first_name = 'Silvio' AND c.last_name= 'Blyth'***