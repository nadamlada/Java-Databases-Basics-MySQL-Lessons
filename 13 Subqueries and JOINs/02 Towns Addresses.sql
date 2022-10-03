/*
2.	Towns Addresses

Write a query to get information about the addresses in the database, which are in San Francisco, Sofia or Carnation. Retrieve town_id, town_name, address_text. Order the result by town_id, then by address_id. Submit your queries using the "MySQL prepare DB and Run Queries" strategy. 

Example
town_id	town_name	address_text
9	San Fransisco	1 34 Seaside Way
9	San Fransisco	5725 Glaze Drive
15	Carnation	1411 Ranch Drive
…	…	…
*/

SELECT 
    `t`.`town_id`, `t`.`name` AS 'town_name', `a`.`address_text`
FROM
    `towns` AS `t`
        JOIN
    `addresses` AS `a` ON `t`.`town_id` = `a`.`town_id`
WHERE
    `t`.`town_id` IN (9 , 32, 15)
ORDER BY `t`.`town_id` , `a`.`address_id`;
