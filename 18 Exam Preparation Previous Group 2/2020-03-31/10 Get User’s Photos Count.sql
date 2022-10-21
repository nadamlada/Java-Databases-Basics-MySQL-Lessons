/*
10.	Get User’s Photos Count
Create a user defined function with the name udf_users_photos_count(username VARCHAR(30)) that receives a username and returns the number of photos this user has upload.

Example
Query
SELECT udf_users_photos_count('ssantryd') AS photosCount;
photosCount
2
*/

DELIMITER ***
CREATE FUNCTION `udf_users_photos_count` (`username` VARCHAR(30))
RETURNS INTEGER
DETERMINISTIC
BEGIN
RETURN
	(SELECT 
		COUNT(*)
	FROM  
		`users` AS `u`
			JOIN
		`users_photos` AS `up` ON `up`.`user_id` = `u`.`id`
	WHERE
		`u`.`username` = `username`);
END
***

DELIMITER ;
SELECT udf_users_photos_count('ssantryd') AS photosCount;