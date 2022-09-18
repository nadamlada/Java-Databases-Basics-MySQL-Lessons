
/*
Problem 1: Select Employee Information
Write a query to select all employees and retrieve information about their id, first_name, last_name and job_title ordered by id.
Example
id	first_name	last_name	job_title
1	John 	Smith	Manager
2	John 	Johnson	Customer Service
3	Smith 	Johnson	Porter
…	…	…	…
*/

USE `hotel`;
SELECT 
    `id`, `first_name`, `last_name`, `job_title`
FROM
    `employees`
ORDER BY `id`;