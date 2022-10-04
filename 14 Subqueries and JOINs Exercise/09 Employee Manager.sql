/*
9.	Employee Manager
Write a query that selects:
•	employee_id
•	first_name
•	manager_id
•	manager_name
Filter all employees with a manager who has id equal to 3 or 7. Return all rows sorted by employee first_name in ascending order.

Example
employee_id	first_name	manager_id	manager_name
122	Bryan	7	JoLynn
158	Dylan	3	Roberto
…	…	…	…
*/

SELECT 
    `e1`.`employee_id`,
    `e1`.`first_name`,
    `e2`.`employee_id` AS 'manager_id',
    `e2`.`first_name` AS 'manager_name'
FROM
    `employees` AS `e1`
        JOIN
    `employees` AS `e2` ON `e1`.`manager_id` = `e2`.`employee_id`
WHERE
   `e1`.`manager_id` IN (3 , 7)
ORDER BY `e1`.`first_name` ASC;