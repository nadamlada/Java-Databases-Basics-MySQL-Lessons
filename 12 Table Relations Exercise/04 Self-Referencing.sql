/*
4.	Self-Referencing
Create a single table as follows. Use appropriate data types.
teachers
teacher_id	name	manager_id
101	John	
102	Maya	106
103	Silvia	106
104	Ted	105
105	Mark	101
106	Greta	101

Insert the data from the example above. 
•	Add primary and foreign keys. 
•	The foreign key should be between manager_id and teacher_id.
Submit your queries by using "	MySQL run queries & check DB" strategy.
*/

CREATE TABLE `teachers`(
	`teacher_id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL,
	`manager_id`INT DEFAULT NULL
) AUTO_INCREMENT = 101;

INSERT INTO `teachers`(`name` , `manager_id`) 
	VALUES
	('John', NULL), 
	('Maya', 106),
	('Silvia', 106),
	('Ted', 105),
	('Mark', 101),
	('Greta', 101);

ALTER TABLE `teachers`
	ADD CONSTRAINT `fk_teacher_namager`
	FOREIGN KEY (`manager_id`)
	REFERENCES `teachers` (`teacher_id`);
