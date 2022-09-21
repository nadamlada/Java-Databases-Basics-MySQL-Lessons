/*
04. Find Full Name of Each Employee 
Write SQL query to find the first, middle and last name of each employee. Sort the information by id. Submit your query statements as Prepare DB & run queries. 
Example 
first_name 	middle_name 	last_name 
Guy 	R 	Gilbert 
Kevin 	F 	Brown 
Roberto 	NULL 	Tamburello 
… 	… 	… 
*/

SELECT 
    `first_name`, `middle_name`, `last_name`
FROM
    `employees`
ORDER BY `employee_id`;