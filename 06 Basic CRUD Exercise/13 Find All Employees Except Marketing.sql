/*
13. Find All Employees Except Marketing 
Write a SQL query to find the first and last names of all employees whose department ID is different from 4. Submit your query statements as Prepare DB & run queries. 
Example 
first_name 	last_name 
Guy 	Gilbert 
Roberto 	Tamburello 
Rob 	Walters 
…	…
*/

SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    `department_id` != 4;