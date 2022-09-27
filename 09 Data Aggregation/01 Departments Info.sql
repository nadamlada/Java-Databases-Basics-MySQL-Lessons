/*
1.	 Departments Info
Write a query to count the number of employees in each department by id. Order the information by deparment_id, then by Number of employees. Submit your queries with the MySQL prepare DB & run queries strategy.
Example
department_id	Number of employees
1	2
2	4
3	3
*/

SELECT 
    `department_id`, COUNT(`id`) AS 'count'
FROM
    `employees`
GROUP BY `department_id`
ORDER BY `department_id`, `count`;