/*
10. Find All Employees Without Manager 
Write a SQL query to find first and last names about those employees that does not have a manager. Submit your query statements as Prepare DB & run queries. 
Example 
first_name 	last_name 
Ken 	Sanchez 
Svetlin 	Nakov 
… 	… 
*/

SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    `manager_id` IS NULL;
    