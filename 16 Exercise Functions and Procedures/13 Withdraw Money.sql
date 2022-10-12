/*
13.	Withdraw Money
Add stored procedures usp_withdraw_money(account_id, money_amount) that operate in transactions. 
Make sure to guarantee withdraw is done only when balance is enough and money_amount is valid positive number. Work with precision up to fourth sign after decimal point. The procedure should produce exact results working with the specified precision.
Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
Here is the result for account_id = 1 and money_amount = 10.
account_id	account_holder_id	balance
1	1	123.1200
*/

DELIMITER ***
CREATE PROCEDURE `usp_withdraw_money` (`account_id` INT, `money_amount` DECIMAL (19, 4))
-- when balance is enough and money_amount is valid positive number
BEGIN
	START TRANSACTION;
    IF ((SELECT `balance` FROM `accounts` AS `a`
        WHERE `a`.`id` = `account_id`) < `money_amount`)
		OR 
        (`money_amount` <= 0)
		THEN ROLLBACK;
	ELSE
		UPDATE `accounts` SET `a`.`balance` = `a`.`balance` - `money_amount`
		WHERE `a`.`id` = `account_id`;
		COMMIT;
	END IF;
END
***

CALL `usp_withdraw_money` (1, 10)***
