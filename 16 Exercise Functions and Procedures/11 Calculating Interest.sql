/*
11.	Calculating Interest
Your task is to create a stored procedure usp_calculate_future_value_for_account that accepts as parameters – id of account and interest rate. The procedure uses the function from the previous problem to give an interest to a person's account for 5 years, along with information about his/her account id, first name, last name and current balance as it is shown in the example below. It should take the account_id and the interest_rate as parameters. Interest rate should have precision up to 0.0001, same as the calculated balance after 5 years. Be extremely careful to achieve the desired precision!
Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
Here is the result for account_id = 1 and interest_rate = 0.1.
account_id	fist_name	last_name	current_balance	balance_in_5_years
1	Susan	Cane	123.1200	198.2860
*/

DELIMITER ***
CREATE PROCEDURE `usp_calculate_future_value_for_account` (`account_id` INT, `interest_rate` DECIMAL(19, 4))
BEGIN
	SELECT 
	   `a`.`id` AS 'account_id',
       `ah`.`first_name`,
       `ah`.`last_name`,
       `a`.`balance` AS 'current_balance',
       `ufn_calculate_future_value`(`a`.`balance`, `interest_rate`, 5) AS 'balance_in_5_years'
	FROM
		`account_holders` AS `ah`
			LEFT JOIN
		`accounts` AS `a` ON `a`.`account_holder_id` = `ah`.`id`
	WHERE `a`.`id` = `account_id`;
END
***

CALL `usp_calculate_future_value_for_account` (1, 0.1)***
