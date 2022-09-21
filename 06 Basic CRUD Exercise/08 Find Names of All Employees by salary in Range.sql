/*
08. Find Names of All Employees by salary in Range 
Write a SQL query to find the first name, last name and job title of all employees whose salary is in the range [20000, 30000]. Sort the information by id. Submit your query statements as Prepare DB & run queries. 
Example 
first_name 	last_name 	job_title 
Rob 	Walters 	Senior Tool Designer 
Thierry 	D'Hers 	Tool Designer 
JoLynn 	Dobney 	Production Supervisor 
… 	… 	… 
*/

SELECT 
    `first_name`, `last_name`, `job_title`
FROM
    `employees` AS `e`
WHERE
   `e`.`salary` BETWEEN 20000 AND 30000
ORDER BY `employee_id`;