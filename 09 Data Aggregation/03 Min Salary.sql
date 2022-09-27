/*
3.	 Min Salary
Write a query to retrieve information about the departments grouped by department_id with minimum salary higher than 800. Round the salary result to two digits after the decimal point. Submit your queries with the MySQL prepare DB & run queries strategy.
Example
department_id	Min Salary
1	1700
*/

SELECT 
    `department_id`, ROUND(MIN(`salary`), 2) AS 'Min Salary'
FROM
    `employees`
GROUP BY `department_id`
HAVING `Min Salary` > 800;