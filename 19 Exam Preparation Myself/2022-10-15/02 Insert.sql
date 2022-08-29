/*
02.	Insert
You will have to insert records of data into the products table, based on the waiters table.
For waiters with id greater than 6, insert data in the products table with the following values:
•	name – set it to the last name of the waiter followed by white space and then "specialty". 
-	(last_name + " " + "specialty")
•	type – set it to the "Cocktail".
•	price – set it to 1% of the waiter salary and round the DECIMAL always to the next largest number.
(HINT: FLOOR will round the decimal to the previous whole number, but we need the opposite of FLOOR)
*/

INSERT INTO `products` (
`name`,
`type`,
`price`
)
SELECT
CONCAT(`w`.`last_name`, ' ', 'specialty') AS 'name',
'Cocktail' AS 'type',
CEIL(`w`.`salary` * 0.01) AS 'price'
FROM
	`waiters` AS `w`
WHERE `w`.`id` > 6;