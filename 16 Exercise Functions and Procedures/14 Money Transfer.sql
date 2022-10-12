/*
14.	Money Transfer
Write stored procedure usp_transfer_money(from_account_id, to_account_id, amount) that transfers money from one account to another. Consider cases when one of the account_ids is not valid, the amount of money is negative number, outgoing balance is enough or transferring from/to one and the same account. Make sure that the whole procedure passes without errors and if error occurs make no change in the database. 
Make sure to guarantee exact results working with precision up to fourth sign after decimal point.
Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
Here is the result for from_account_id = 1, to_account_id = 2 and money_amount = 10.
account_id	account_holder_id	balance
1	1	113.1200
2	3	4364.2300
*/

DELIMITER ***
CREATE PROCEDURE `usp_transfer_money` (`from_account_id` INT, `to_account_id` INT, `amount` DECIMAL (19, 4) )
BEGIN
	START TRANSACTION;
	-- Проверка дали и двете сметки не са еднакви
	-- Парите да са положителен десимал
	-- Парите да са налични по сметката, от която тегля
    -- Проверка дали и двете сметки са валидни
    IF (`amount` <= 0
		OR
			`from_account_id` = `to_account_id`		
		OR
			(SELECT `balance` FROM `accounts`
			WHERE `id` = `from_account_id`) < `amount`
        OR  
			(SELECT COUNT(`id`) FROM `accounts`
            WHERE `id` = `to_account_id`) <> 1
		OR
         (SELECT COUNT(`id`) FROM `accounts`
            WHERE `id` = `from_account_id`) <> 1)
		THEN ROLLBACK;
    ELSE
		UPDATE `accounts` SET `balance` = `balance` - `amount`
		WHERE `id` = `from_account_id`;
		UPDATE `accounts` SET `balance` = `balance` + `amount`
		WHERE `id` = `to_account_id`;
        COMMIT;
	END IF;
END
***

CALL `usp_transfer_money`(1, 2, 10)***