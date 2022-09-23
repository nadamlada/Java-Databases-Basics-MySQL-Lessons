/*
2.	Find Names of All Employees by Last Name
Write a SQL query to find first and last names of all employees whose last name contains "ei" (case insensitively). Order the information by id. Submit your query statements as Prepare DB & run queries.
Example
first_name	last_name
Kendall	Keil
Christian	Kleinerman
…	…
*/

SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    LOWER(`last_name`) LIKE '%ei%'
ORDER BY `employee_id`;