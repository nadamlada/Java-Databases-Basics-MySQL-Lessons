/*
16.	Emails Trigger
Create another table – notification_emails(id, recipient, subject, body). Add a trigger to logs table to create new email whenever new record is inserted in logs table. The following data is required to be filled for each email:
•	recipient – account_id
•	subject – "Balance change for account: {account_id}"
•	body - "On {date (current date)} your balance was changed from {old} to {new}."
Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example	
id	recipient	subject	body
1	1	Balance change for account: 1	On Sep 15 2016 at 11:44:06 AM your balance was changed from 133 to 143.
…	…	…	…
*/  

CREATE TABLE `notification_emails` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `recipient` INT NOT NULL,
    `subject` VARCHAR(50) NOT NULL,
    `body` VARCHAR(255) NOT NULL
);

DELIMITER ***
CREATE TRIGGER `tr_notification_emails`
AFTER INSERT ON `logs`
FOR EACH ROW
BEGIN
	INSERT INTO `notification_emails`(
    `recipient`,
    `subject`,
    `body`)
    VALUES(
		NEW.`account_id`,
		CONCAT('Balance change for account: ', NEW.`account_id`),
		CONCAT('On ',
				DATE_FORMAT(NOW(),'%b %d %Y at %r'),
				' your balance was changed from ',
				ROUND(NEW.`old_sum`,2),
				' to ',        
				ROUND(NEW.`new_sum`,2),
				'.'
		)
	);
END
***

