/*
03. Find salary of Each Employee 
Write SQL query to find the first name, last name and salary of each employee. Sort the information by id. Submit your query statements as Prepare DB & run queries. 
Example 
first_name 	last_name 	salary 
Guy 	Gilbert 	12500.00 
Kevin 	Brown 	13500.00 
Roberto 	Tamburello 	43300.00 
… 	… 	… 
*/

SELECT 
    `first_name`, `last_name`, `salary`
FROM
    `employees`
ORDER BY `employee_id`;