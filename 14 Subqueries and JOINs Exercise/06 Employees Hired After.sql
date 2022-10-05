/*
6.	Employees Hired After
Write a query that selects:
•	first_name
•	last_name
•	hire_date
•	dept_name
Filter only employees hired after 1/1/1999 and from either the "Sales" or the "Finance" departments. Sort the result by hire_date (ascending).

Example:
first_name	last_name	hire_date	dept_name
Debora     	Poe	2001-01-19 00:00:00	Finance
Wendy	Kahn	2001-01-26 00:00:00	Finance
…	…	…	…
*/

SELECT 
    `e`.`first_name`,
    `e`.`last_name`,
    `e`.`hire_date`,
    `d`.`name` AS 'dept_name'
FROM
    `employees` AS `e`
        JOIN
    `departments` AS `d` ON `d`.`department_id` = `e`.`department_id`
WHERE
    `e`.`hire_date` > '1999-01-01'
        AND `d`.`name` IN ('Sales' , 'Finance')
ORDER BY `e`.`hire_date`;