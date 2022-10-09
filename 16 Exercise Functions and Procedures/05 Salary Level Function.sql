/*
5.	Salary Level Function
Write a function ufn_get_salary_level that receives salary of an employee and returns the level of the salary.
•	If salary is < 30000 return "Low"
•	If salary is between 30000 and 50000 (inclusive) return "Average"
•	If salary is > 50000 return "High"
Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
salary	salary_Level
13500.00	Low
43300.00	Average
125500.00	High
*/

DELIMITER ***
CREATE FUNCTION `ufn_get_salary_level` (`salary` DECIMAL (19, 4 ))
RETURNS VARCHAR(7)
DETERMINISTIC
BEGIN
DECLARE `salary_level` VARCHAR(7);
	IF (`salary` < 30000)
		THEN SET `salary_level` := 'Low';
	ELSEIF (`salary` <= 50000)
		THEN SET `salary_level` := 'Average';
    ELSE SET `salary_level` := 'High';
    END IF;
RETURN `salary_level`;
END
***
