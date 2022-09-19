/*
01. Find All Information About Departments 
Write a SQL query to find all available information about the departments. Sort the information by id. Submit your query statements as Prepare DB & run queries. 
Example 
department_id 	name 	manager_id 
1 	Engineering 	12 
2 	Tool Design 	4 
3 	Sales 	273 
… 	… 	… 
*/

-- USE `soft_uni`;
SELECT 
    *
FROM
    `departments`
ORDER BY `department_id`;