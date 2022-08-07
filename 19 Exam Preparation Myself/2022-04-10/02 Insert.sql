/*
02.	Insert
You will have to insert records of data into the actors table.
The new data will be based on actors with id equal or less than 10. Insert data in the actors table with the following values:
•	first_name – set it to the first name of the actor but reversed.
•	last_name – set it to the last name of the actor but reversed.
•	birthdate – set it to the birthdate of the actor but 2 days earlier.
•	height – set it to the height of the actor plus 10.
•	awards – set them to the country_id.
•	country_id – set it to the id of Armenia.
*/

INSERT INTO `actors` (
	`first_name`,
	`last_name`,
	`birthdate`,
	`height`,
	`awards`,
	`country_id`)
SELECT
	REVERSE(`first_name`),
	REVERSE(`last_name`),
	DATE_SUB(`birthdate`, INTERVAL 2 DAY),
	`height` + 10,
	`country_id`,
	 (SELECT `id` FROM `countries` AS `c`
		WHERE `c`.`name` LIKE 'Armenia')
FROM `actors`
WHERE `id` <= 10;