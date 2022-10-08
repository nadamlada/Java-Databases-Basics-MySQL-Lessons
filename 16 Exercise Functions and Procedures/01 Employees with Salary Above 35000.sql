/*
1.	Employees with Salary Above 35000
Create stored procedure usp_get_employees_salary_above_35000 that returns all employees' first and last names for whose salary is above 35000. The result should be sorted by first_name then by last_name alphabetically, and id ascending. Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
first_name	last_name
Amy	Alberts
Brian	Welcker
Dan	Wilson
…	…
*/

DELIMITER ***
CREATE PROCEDURE `usp_get_employees_salary_above_35000` ()
BEGIN
	SELECT 
		`first_name`, `last_name`
	FROM
		`employees`
	WHERE
		`salary` > 35000
	ORDER BY `first_name` , `last_name` , `employee_id`;
END
***

-- CALL `usp_get_employees_salary_above_35000` ()***
-- DROP PROCEDURE IF EXISTS `usp_get_employees_salary_above_35000` ()***
