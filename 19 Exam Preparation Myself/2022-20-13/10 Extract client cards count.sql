/*
10.	Extract client cards count
Create a user defined function with the name udf_customer_products_count(name VARCHAR(30)) that receives a customer’s first name and returns the total number of products he ordered;

Required Columns
•	first_name (customers)
•	last_name (customers)
•	total_products (udf_customer_products_count)

Example

Query
SELECT c.first_name,c.last_name, udf_customer_products_count('Shirley') as `total_products` FROM customers c
WHERE c.first_name = 'Shirley';
first_name	last_name	total_products
Shirley	Clayfield	5
*/

DELIMITER ***
CREATE FUNCTION `udf_customer_products_count` (`name` VARCHAR(30))
RETURNS INTEGER
DETERMINISTIC
BEGIN
RETURN(
	SELECT
		COUNT(`c`.`id`) AS 'total_products'
	FROM
		`customers` AS `c`
		LEFT JOIN
		`orders` AS `o` ON `o`.`customer_id` = `c`.`id`
		LEFT JOIN
		`orders_products` AS `op` ON `op`.`order_id` = `o`.`id`
		LEFT JOIN
		`products` AS `p` ON `p`.`id` = `op`.`product_id`
	WHERE `c`.`first_name` LIKE `name`
	GROUP BY `c`.`id`);
END
***

SELECT `udf_customer_products_count`('Shirley')***
