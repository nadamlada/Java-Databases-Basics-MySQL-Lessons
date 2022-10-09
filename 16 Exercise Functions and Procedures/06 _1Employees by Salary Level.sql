/*
6.	Employees by Salary Level
Write a stored procedure usp_get_employees_by_salary_level that receive as parameter level of salary (low, average or high) and print the names of all employees that have given level of salary. The result should be sorted by first_name then by last_name both in descending order.
Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
Here is the list of all employees with high salary.
first_name	last_name
Terri	Duffy
Laura	Norman
Ken	Sanchez
…	…
*/

DELIMITER ***
CREATE PROCEDURE `usp_get_employees_by_salary_level` (`salary_level` VARCHAR(7))
BEGIN
	SELECT 
		`e`.`first_name`, `e`.`last_name`
	FROM
		`employees` AS `e`
	WHERE
	`e`.`salary` < 30000 AND `salary_level` = 'Low'
		OR `e`.`salary`>= 30000 AND `e`.`salary`<= 50000 AND `salary_level` = 'Average'
		OR `e`.`salary`> 50000 AND `salary_level` = 'High'
	ORDER BY `e`.`first_name` DESC, `e`.`last_name` DESC;
END
***

CALL `usp_get_employees_by_salary_level` ('High')