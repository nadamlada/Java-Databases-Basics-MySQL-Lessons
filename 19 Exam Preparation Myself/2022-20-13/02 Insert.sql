/*
02.	Insert
You will have to insert records of data into the reviews table, based on the products table.
For products with id equal or greater than 5, insert data in the reviews table with the following values:
•	content – set it to the first 15 characters from the description of the product.
•	picture_url – set it to the product's name but reversed.
•	published_at – set it to 10-10-2010.
•	rating – set it to the price of the product divided by 8.
*/

INSERT INTO `reviews`(
`content`,
`picture_url`,
`published_at`,
`rating`
)
SELECT
LEFT(`p`.`description`, 15) AS 'content',
REVERSE(`p`.`name`) AS 'picture_url',
'2010-10-10' AS 'published_at',
`p`.`price` / 8 AS 'rating'
FROM `products` AS `p`
WHERE `p`.`id` >= 5;