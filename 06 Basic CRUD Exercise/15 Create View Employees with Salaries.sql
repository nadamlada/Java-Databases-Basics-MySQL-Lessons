/*
15. Create View Employees with Salaries 
Write a SQL query to create a view v_employees_salaries with first name, last name and salary for each employee. Submit your query statements as Run skeleton, run queries & check DB.  
Example 
first_name 	last_name 	salary 
Guy 	Gilbert 	12500.00 
Kevin 	Brown 	13500.00 
… 	… 	… 
*/

CREATE VIEW `v_employees_salaries` AS
    SELECT 
        `first_name`, `last_name`, `salary`
    FROM
        `employees`;