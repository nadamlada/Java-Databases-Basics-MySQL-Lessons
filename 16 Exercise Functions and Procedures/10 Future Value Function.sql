/*
10.	Future Value Function
Your task is to create a function ufn_calculate_future_value that accepts as parameters – sum (with precision, 4 digits after the decimal point), yearly interest rate (double) and number of years(int). It should calculate and return the future value of the initial sum. The result from the function must be decimal, with percision 4.
 Using the following formula:
 
•	I – Initial sum
•	R – Yearly interest rate
•	T – Number of years
Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
Input	Output
Initial sum: 1000
Yearly Interest rate: 50%
years: 5
ufn_calculate_future_value(1000, 0.5, 5)	7593.7500
*/

DELIMITER ***
CREATE FUNCTION `ufn_calculate_future_value` (
`initial_sum` DECIMAL(19, 4),
`yearly_interest_rate` DOUBLE,
`number_of_years` INT
 )
RETURNS DECIMAL(19, 4)
DETERMINISTIC
BEGIN
RETURN 
`initial_sum`* POW((1+`yearly_interest_rate`),`number_of_years`);
END
***

SELECT `ufn_calculate_future_value`(1000, 0.5, 5)***
DROP FUNCTION `ufn_calculate_future_value`***