/*
07. Find all Information About Employees 
Write a SQL query to find all information about the employees whose job title is "Sales Representative". Sort the information by id. Submit your query statements as Prepare DB & run queries. 
Example 
id 	First 
Name 	Last 
Name 	Middle Name 	Job Title 	Dept
ID 	Mngr 
ID 	Hire Date 	salary 	address_id 
275 	Michael 	Blythe 	G 	Sales 
Representative 	3 	268 	… 	23100.00 	60 
276 	Linda 	Mitchell 	C 	Sales 
Representative 	3 	268 	… 	23100.00 	170 
277 	Jillian 	Carson 	NULL 	Sales 
Representative 	3 	268 	… 	23100.00 	61 
… 	… 	… 	… 	… 	… 	… 	… 	… 	… 
*/

SELECT 
    *
FROM
    `employees`
WHERE
    `job_title` = 'Sales Representative'
ORDER BY `employee_id`;