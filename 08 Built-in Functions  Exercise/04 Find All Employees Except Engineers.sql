/*
4.	Find All Employees Except Engineers
Write a SQL query to find the first and last names of all employees whose job titles does not contain "engineer". Order the information by id. Submit your query statements as Prepare DB & run queries.
Example
first_name	last_name
Guy	Gilbert
Kevin	Brown
Rob	Walters
…	…
*/

SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    `job_title` NOT LIKE '%engineer%'
ORDER BY `employee_id`;