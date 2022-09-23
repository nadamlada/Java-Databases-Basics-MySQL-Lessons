/*
1.	Find Names of All Employees by First Name
Write a SQL query to find first and last names of all employees whose first name starts with "Sa" (case insensitively). Order the information by id. Submit your query statements as Prepare DB & run queries.
Example
first_name	last_name
Sariya	Harnpadoungsataya
Sandra	Reategui Alayo
…	…
*/

SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    LOWER(`first_name`) LIKE 'Sa%'
ORDER BY `employee_id`;