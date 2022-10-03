 /*
1.	Managers
Write a query to retrieve information about the managers – id, full_name, deparment_id and department_name. Select the first 5 departments ordered by employee_id. Submit your queries using the "MySQL prepare DB and Run Queries" strategy. 

Example
employee_id	full_name	department_id	department_name
3	Roberto Tamburello	10	Finance
4	Rob Walters	2	Tool Design
…	…	…	…
*/

 SELECT 
    `d`.`manager_id` AS 'employee_id',
    CONCAT_WS(' ', `e`.`first_name`, `e`.`last_name`) AS 'full_name',
    `d`.`department_id`,
    `d`.`name` AS 'department_name'
FROM
    `departments` AS `d`
        JOIN
    `employees` AS `e` ON `d`.`manager_id` = `e`.`employee_id`
ORDER BY `e`.`employee_id`
LIMIT 5;