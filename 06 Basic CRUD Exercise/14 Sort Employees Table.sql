/*
14. Sort Employees Table 
Write a SQL query to sort all records in the еmployees table by the following criteria:  
•	First by salary in decreasing order 
•	Then by first name alphabetically 
•	Then by last name descending 
•	Then by middle name alphabetically 
Sort the information by id. Submit your query statements as Prepare DB & run queries. 
Example 
id 	First 
Name 	Last 
Name 	Middle Name 	job_title 	Dept
ID 	Mngr 
ID 	Hire Date 	salary 	address_id 
109 	Ken 	Sanchez 	J 	Chief Executive Officer 	16 	NULL 	… 	125500.00 	177 
148 	James 	Hamilton 	R 	Vice President of Production 	7 	109 	… 	84100.00 	158 
273 	Brian 	Welcker 	S 	Vice President of Sales 	3 	109 	… 	72100.00 	134 
… 	… 	… 	… 	… 	… 	… 	… 	… 	… 
*/

SELECT 
    *
FROM
    `employees`
ORDER BY `salary` DESC , `first_name` , `last_name` DESC , `middle_name` , `employee_id`;
