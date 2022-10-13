/*
2.	Insert
You will have to insert records of data into the coaches table, based on the players table. 
For players with age over 45 (inclusive), insert data in the coaches table with the following values:
•	first_name – set it to first name of the player
•	last_name – set it to last name of the player.
•	salary – set it to double as player’s salary. 
•	coach_level – set it to be equals to count of the characters in player’s first_name.
*/

INSERT INTO `coaches` (`first_name`,
						`last_name`,
						`salary`,
						`coach_level`)
	SELECT
		`first_name`,
		`last_name`,
		`salary` * 2,
		CHAR_LENGTH(`first_name`) AS `coach_level`
	FROM
		`players`
	 
 -- SELECT * FROM `coaches`;
