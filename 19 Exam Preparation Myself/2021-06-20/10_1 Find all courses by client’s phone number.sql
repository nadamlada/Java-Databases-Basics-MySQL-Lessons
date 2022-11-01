/*
10.	Find all courses by client’s phone number
Create a user defined function with the name udf_courses_by_client (phone_num VARCHAR (20)) that receives a client’s phone number and returns the number of courses that clients have in database.

Example
Query
SELECT udf_courses_by_client ('(803) 6386812') as `count`; 
count
5

Query
SELECT udf_courses_by_client ('(831) 1391236') as `count`;
count
3

Query
SELECT udf_courses_by_client ('(704) 2502909') as `count`;
count
0
*/

DELIMITER ***
CREATE FUNCTION `udf_courses_by_client` (`phone_num` VARCHAR (20))
RETURNS INTEGER
DETERMINISTIC
BEGIN
	DECLARE `count` INt;
	SET `count` :=(SELECT 
		COUNT(`cl`.`id`)
	FROM
		`clients` AS `cl`
			JOIN
		`courses` AS `co` ON `co`.`client_id` = `cl`.`id`
	WHERE
		`cl`.`phone_number` LIKE `phone_num`
	GROUP BY `cl`.`id`);
RETURN `count`;
END
***

SELECT udf_courses_by_client ('(831) 1391236') as `count`***