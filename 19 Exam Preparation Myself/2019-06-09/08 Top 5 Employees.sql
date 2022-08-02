/*
08.	Top 5 Employees
Extract from the database, the top 5 employees, in terms of clients assigned to them.
Order the results descending by count of clients, and ascending by employee id.
Required Columns
•	name (employees)
•	started_on
•	count_of_clients

Example
name	started_on	count_of_clients
Trula Glasscott	2017-08-23	14
...	...	...
*/

SELECT
	CONCAT(`first_name`, ' ', `last_name`) AS 'name', 
    `e`.`started_on`,
    COUNT(`ec`.`client_id`) AS 'count_of_clients'
FROM
    `employees` AS `e`
       LEFT JOIN
    `employees_clients` AS `ec` ON `ec`.`employee_id` = `e`.`id`
GROUP BY `e`.`id`
ORDER BY `count_of_clients` DESC, `e`.`id`
LIMIT 5;