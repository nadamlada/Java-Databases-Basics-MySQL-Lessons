/*
3.	Many-To-Many Relationship
Create three tables as follows. Use appropriate data types.

exams
exam_id	name
101	Spring MVC
102	Neo4j
103	Oracle 11g

students
student_id	name
1  	Mila                                      
2	Toni
3	Ron

students_exams
student_id	exam_id
1	101
1	102
2	101
3	103
2	102
2	103

Insert the data from the example above.
•	Add primary and foreign keys.
•	Have in mind that the table student_exams should have a 
composite primary key.
Submit your queries by using "MySQL run queries & check DB" strategy.
*/

CREATE TABLE `exams` (
    `exam_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL
) AUTO_INCREMENT = 101;

CREATE TABLE `students` (
    `student_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL
);

CREATE TABLE `students_exams` (
    `student_id` INT NOT NULL,
    `exam_id` INT NOT NULL,
    CONSTRAINT `pk_students_exams` PRIMARY KEY (`student_id` , `exam_id`),
    CONSTRAINT `fk_students_exams` FOREIGN KEY (`student_id`)
        REFERENCES `students` (`student_id`),
    CONSTRAINT `fk_exams_students` FOREIGN KEY (`exam_id`)
        REFERENCES `exams` (`exam_id`)
);

INSERT INTO `exams`(`name`)
VALUES
('Spring MVC'),
('Neo4j'),
('Oracle 11g');

INSERT INTO `students`(`name`)
VALUES
('Mila'),
('Toni'),
('Ron');

INSERT INTO `students_exams`(`student_id`, `exam_id`)
VALUES
(1,	101),
(1,	102),
(2,	101),
(3,	103),
(2,	102),
(2,	103);