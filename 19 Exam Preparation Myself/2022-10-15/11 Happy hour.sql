/*
11.	Happy hour
Create a stored procedure udp_happy_hour which accepts the following parameters:
•	type (VARCHAR(50))
Extracts data about the products from the given type and reduces the prices by 20% of all products which have price higher or equal to 10.00 and are from the given type.
Result
Query
CALL udp_happy_hour ('Cognac');
This execution will update 1 product – Martell VS Single Distillery F
Result
Brandy Ararat 5YO Armenia|6.00 -> 6.00
Brandy Sarajishvili VS, Georgi|8.00 -> 8.00
Martell VS Single Distillery F|10.00 -> 8.00
*/

DELIMITER ***
CREATE PROCEDURE `udp_happy_hour` (`type` VARCHAR(50))
BEGIN

	UPDATE `products` 
	SET 
		`price` = 0.8 * `price`
	WHERE
		`type` = `type` AND `price` >= 10;
    
END
***

CALL udp_happy_hour ('Cognac');