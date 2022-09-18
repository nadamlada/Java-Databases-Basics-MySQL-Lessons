/*
Problem 5: Select Employees by Multiple Filters
Write a query to retrieve information about employees, who are in department 4 and has a salary higher or equal to 1000. Order the information by id.
Example
id	first_name	last_name	job_title	department_id	salary
3	Smith	Johnson	Porter	4	1100
9	Nikolay	Ivanov	Housekeeping	4	1600
*/

SELECT 
    *
FROM
    `employees`
WHERE
    `department_id` = 4 AND `salary` >= 1000;