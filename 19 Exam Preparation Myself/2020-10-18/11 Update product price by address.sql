/*
11.	Update product price by address
CREATE user define procedure udp_update_product_price (address_name VARCHAR (50)), that receives as parameter an address name.
Increase the product's price with 100 if the address starts with 0 (zero) otherwise increase the price with 200.

Example 1
Query
CALL udp_update_product_price('07 Armistice Parkway');
SELECT name, price FROM products WHERE id = 15;

Result
name	price
Spic And Span All Purpose  	136.53

Example 2
Query
CALL udp_update_product_price('1 Cody Pass');
SELECT name, price FROM products WHERE id = 17;

Result
name	price
Wine – Ruffino Chianti Classico	221.63
*/

DELIMITER ***
CREATE PROCEDURE `udp_update_product_price` (`address_name` VARCHAR (50))
BEGIN
	UPDATE `addresses` AS `a`
			JOIN
		`stores` AS `s` ON `s`.`address_id` = `a`.`id`
			JOIN
		`products_stores` AS `ps` ON `ps`.`store_id` = `s`.`id`
			JOIN
		`products` AS `p` ON `p`.`id` = `ps`.`product_id` 
	SET 
		`p`.`price` = 
        CASE
			WHEN `a`.`name` LIKE '0%' THEN `p`.`price` + 100
			ELSE `p`.`price` + 200
		END
	WHERE
		`a`.`name` = `address_name`;
END
***

DELIMITER ;
CALL udp_update_product_price('1 Cody Pass');
SELECT name, price FROM products WHERE id = 17;