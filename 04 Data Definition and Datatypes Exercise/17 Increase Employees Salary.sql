/*
17.	Increase Employees Salary
Use softuni database and increase the salary of all employees by 10%. Then select only salary column from the employees table. Submit your query statements as Prepare DB & Run queries.
*/

USE `soft_uni`;
UPDATE `employees`
SET `salary` = `salary` * 1.10;

SELECT `salary`	 FROM `employees`;