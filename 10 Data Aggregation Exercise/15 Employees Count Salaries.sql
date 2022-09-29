/*
15.	Employees Count Salaries
Count the salaries of all employees who don't have a manager.	

4
*/

SELECT
	COUNT(*) AS ''
FROM
	`employees`
WHERE `manager_id` IS NULL;