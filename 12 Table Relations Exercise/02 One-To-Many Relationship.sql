/*
2.	One-To-Many Relationship
Create two tables as follows. Use appropriate data types.
manufacturers
manufacturer_id	name	established_on
1  	BMW                                            	01/03/1916
2	Tesla	01/01/2003
3	Lada	01/05/1966
models
model_id	name	manufacturer_id
101	X1	1
102	i6	1
103	Model S	2
104	Model X	2
105	Model 3	2
106	Nova	3

Insert the data from the example above. 
•	Add primary and foreign keys.
Submit your queries by using "MySQL run queries & check DB" strategy.
*/

CREATE TABLE `manufacturers` (
    `manufacturer_id` INT AUTO_INCREMENT UNIQUE NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `established_on` DATE NOT NULL
);

CREATE TABLE `models` (
    `model_id` INT AUTO_INCREMENT UNIQUE NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `manufacturer_id` INT NOT NULL
)  AUTO_INCREMENT=101;

INSERT INTO `manufacturers`(`name`, `established_on`)
VALUES
('BMW', '1916-03-01'),
('Tesla', '2003-01-01'),
('Lada', '1966-05-01');

INSERT INTO `models` (`name`, `manufacturer_id`)
VALUES
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3);

ALTER TABLE `manufacturers`
ADD CONSTRAINT `pk_manufacturer`
PRIMARY KEY (`manufacturer_id`);

ALTER TABLE `models`
ADD CONSTRAINT `pk_model`
PRIMARY KEY (`model_id`),
ADD CONSTRAINT `fk_models_manufacturers`
FOREIGN KEY (`manufacturer_id`)
REFERENCES `manufacturers`(`manufacturer_id`);