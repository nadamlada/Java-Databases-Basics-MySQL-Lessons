/*
1.	Employee Address
Write a query that selects:
•	employee_id
•	job_title
•	address_id
•	address_text
Return the first 5 rows sorted by address_id in ascending order.

Example:
employee_id	job_title	address_id	address_text
142	Production Technician	1	108 Lakeside Court
30	Human Resources Manager	2	1341 Prospect St
…	…	…	…
*/

SELECT 
    `e`.`employee_id`,
    `e`.`job_title`,
    `a`.`address_id`,
    `a`.`address_text`
FROM
    `employees` AS `e`
        JOIN
    `addresses` AS `a` ON `e`.`address_id` = `a`.`address_id`
ORDER BY `a`.`address_id`
LIMIT 5;