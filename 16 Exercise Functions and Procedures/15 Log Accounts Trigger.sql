/*
15.	Log Accounts Trigger
Create another table – logs(log_id, account_id, old_sum, new_sum). Add a trigger to the accounts table that enters a new entry into the logs table every time the sum on an account changes.
Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
The following data in logs table is inserted after updating balance of account with account_id = 1 with 10.
log_id	account_id	old_sum	new_sum
1	1	123.12	113.12
2	1	145.43	155.43
*/

CREATE TABLE `logs` (
    `log_id` INT PRIMARY KEY AUTO_INCREMENT,
    `account_id` INT NOT NULL,
    `old_sum` DECIMAL(19 , 4 ) NOT NULL,
    `new_sum` DECIMAL(19 , 4 ) NOT NULL
);

DELIMITER ***
CREATE TRIGGER `tr_balance_update`
AFTER UPDATE ON `accounts`
FOR EACH ROW
BEGIN
 -- IF OLD.`balance` <> NEW.`balance`
	IF OLD.`balance` != NEW.`balance`
    THEN
		INSERT INTO `logs` (`account_id`, `old_sum`, `new_sum`)
		VALUES(OLD.`id`, OLD.`balance`, NEW.`balance`);
	END IF;
END
***