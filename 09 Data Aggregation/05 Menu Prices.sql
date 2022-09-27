/*
5.	 Menu Prices
Write a query to retrieve information about the prices of each category. The output should consist of:
•	Category_id
•	Average Price 
•	Cheapest Product
•	Most Expensive Product
See the examples for more information. Round the results to 2 digits after the decimal point. Submit your queries with the MySQL prepare DB & run queries strategy. 
Example
category_id	Average Price	Cheapest Product	Most Expensive Product
1	7.49	6.79	8.79
2	10.93	7.99	14.89
3	7.90	6.90	8.89
4	12.79	11.69	13.69
5	5.37	4.90	5.60
*/

SELECT 
    `category_id`,
    ROUND(AVG(`price`), 2) AS 'Average Price',
    ROUND(MIN(`price`), 2) AS 'Cheapest Product',
    ROUND(MAX(`price`), 2) AS 'Most Expensive Product'
FROM
    `products`
GROUP BY `category_id`;