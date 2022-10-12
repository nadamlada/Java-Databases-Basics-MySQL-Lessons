/*
12.	Deposit Money
Add stored procedure usp_deposit_money(account_id, money_amount) that operate in transactions. 
Make sure to guarantee valid positive money_amount with precision up to fourth sign after decimal point. The procedure should produce exact results working with the specified precision.
Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
Here is the result for account_id = 1 and money_amount = 10.
account_id	account_holder_id	balance
1	1	133.1200
*/

DELIMITER ***
CREATE PROCEDURE `usp_deposit_money` (`account_id` INT, `money_amount` DECIMAL (19, 4))
BEGIN
-- money amount да е валидна
	START TRANSACTION;
    IF (`money_amount` <= 0) THEN ROLLBACK;
    ELSE 
		UPDATE `accounts` SET `balance` = `balance` + `money_amount`
        WHERE `accounts`.`id` = `account_id`;
	END IF;
END
***

CALL `usp_deposit_money` (1, 10)***
