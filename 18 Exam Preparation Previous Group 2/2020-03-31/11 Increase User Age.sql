/*
11.	Increase User Age
Create a stored procedure udp_modify_user which accepts the following parameters:
•	address
•	town 
udp_modify_user (address VARCHAR(30), town VARCHAR(30)) that receives an address and town and increase the age of the user by 10 years only if the given user exists. 

Show all needed info for this user: username, email, gender, age and job_title.

CALL udp_modify_user ('97 Valley Edge Parkway', 'Divinópolis');
Query
CALL udp_modify_user ('97 Valley Edge Parkway', 'Divinópolis');
SELECT u.username, u.email,u.gender,u.age,u.job_title FROM users AS u
WHERE u.username = 'eblagden21';

Result
username	email	gender	age	Job_title
eblagden21	eishak21@skyrock.com	M	91	Associate Professor
*/ 

DELIMITER ***
CREATE PROCEDURE `udp_modify_user` (`address` VARCHAR(30), `town` VARCHAR(30))
BEGIN
	UPDATE `users` AS `u`
			JOIN
		`addresses` AS `a` ON `a`.`user_id` = `u`.`id` 
	SET 
		`u`.`age` = `u`.`age` + 10
	WHERE
		`a`.`address` = `address`
			AND `a`.`town` = `town`
			AND a.user_id IS NOT NULL; 
END
***
DELIMITER ;

CALL udp_modify_user ('97 Valley Edge Parkway', 'Divinópolis');
SELECT 
    u.username, u.email, u.gender, u.age, u.job_title
FROM
    users AS u
WHERE
    u.username = 'eblagden21';