/*
4.	Employee Departments
Write a query that selects:
•	employee_id
•	first_name
•	salary
•	department_name
Filter only employees with salary higher than 15000. Return the first 5 rows sorted by department_id in descending order.

Example:
employee_id	first_name	salary	department_name
109	Ken	125500.00	Executive
140	Laura	60100.00	Executive
…	…	…	…
*/

SELECT 
    `e`.`employee_id`,
    `e`.`first_name`,
    `e`.`salary`,
    `d`.`name`
FROM
    `employees` AS `e`
        JOIN
    `departments` AS `d` ON `e`.`department_id` = `d`.`department_id`
WHERE
    `e`.`salary` > 15000
ORDER BY `d`.`department_id` DESC
LIMIT 5;