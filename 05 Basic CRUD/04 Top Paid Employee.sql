/*
Problem 4: Top Paid Employee
Write a query to create a view that selects all information about the top paid employee from the "employees" table in the hotel database.
Example
id	first_name	last_name	job_title	department_id	salary
8	Pedro	Petrov	Front Desk Supervisor	1	2100
*/

USE `hotel`;
CREATE VIEW `top_paid_employee` AS
    SELECT 
        *
    FROM
        `employees`
    ORDER BY `salary` DESC
    LIMIT 1;
    
    SELECT 
    *
FROM
    `top_paid_employee`;