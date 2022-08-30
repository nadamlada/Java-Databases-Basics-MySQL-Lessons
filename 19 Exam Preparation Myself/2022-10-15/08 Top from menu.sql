/*
08.	Top from menu
There are many items in our menu list, but the owner wants to know which one is the best sellable item from the restaurant.
Extract from the database the id(product), the name and the count of products from all orders with this name where the count is greater or equal to 5.
Order the results descending by count and then by name in ascending.
Required Columns
•	id (product)
•	name (product)
•	count (the count of products with the same name) 
Examples
id	name	count
143	Beef Minced Meat with Bulgur	9
100	Hot chocolate	9
136	Chicken Crispy Fillets 300 g.	8
…	…	…
86	Розе от Совиньон Блан Резерва	5
*/

SELECT 
    `op`.`product_id` AS 'id',
    `p`.`name` AS 'name',
    COUNT(`op`.`order_id`) AS 'count'
FROM
    `orders` AS `o`
        JOIN
    `orders_products` AS `op` ON `op`.`order_id` = `o`.`id`
        JOIN
    `products` AS `p` ON `p`.`id` = `op`.`product_id`
GROUP BY `p`.`id`
HAVING `count` >= 5
ORDER BY `count` DESC , `name`;