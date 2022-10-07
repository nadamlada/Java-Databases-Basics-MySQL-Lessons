/*
2.	Employees Promotion
Write a stored procedure usp_raise_salaries(department_name) to raise the salary of all employees in given department as parameter by 5%. Submit your queries using the "MySQL Run Skeleton, run queries and check DB" strategy. 

Example
The following example is given with employees in the "Finance" department ordered by first_name, then by salary.
first_name	salary
Barbara	27 720.00
Bryan	19 950.00
Candy	19 950.00
…	…
*/

DELIMITER ***
CREATE PROCEDURE `usp_raise_salaries` (department_name VARCHAR(100))
BEGIN
	UPDATE `employees` AS `e`
			JOIN
		`departments` AS `d` ON `e`.`department_id` = `d`.`department_id` 
	SET   
		`e`.`salary` = `e`.`salary` * 1.05
	WHERE
			`d`.`name` = `department_name`;
END
***

-- CALL `usp_raise_salaries` ('Sales')***