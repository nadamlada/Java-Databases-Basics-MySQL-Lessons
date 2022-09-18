/*
Problem 2: Select Employees with Filter
Write a query to select all employees (id, first_name and last_name (as full_name), job_title, salary) whose salaries are higher than 1000.00, ordered by id. Concatenate fields first_name and last_name into 'full_name'.
Example
id	full_name	job_title	salary
3	Smith Johnson	Porter	1100
4	Peter Petrov	Front Desk Clerk	1100
5	Peter Ivanov	Sales	1500.23
…	…	…	…
*/

USE `hotel`;
SELECT 
    `id`,
    CONCAT_WS(" ", `first_name`, `last_name`) AS `full_name`,
    `job_title`,
    `salary`
FROM
    `employees`
WHERE
    `salary` > 1000
ORDER BY `id`;
