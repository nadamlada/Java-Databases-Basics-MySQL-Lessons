/*
0. Create New Database
Write a query that will create the "gamebar" database.
*/
CREATE DATABASE `gamebar`;

/*
1. Create Tables	
When we create tables, we specify the database we want to add them to. This is done by using the "USE" clause.
Submit your solutions in JUDGE without the "USE {database name}" row.
Table "employees":
•	id – INT, primary key, AUTO_INCREMENT;
•	first_name – VARCHAR, NOT NULL; 
•	last_name – VARCHAR, NOT NULL;  
Create the "categories" and "products" tables analogically:
Table "categories":
•	id – INT, primary key, AUTO_INCREMENT;
•	name – VARCHAR, NOT NULL; 
Table "products":
•	id –  INT, primary key, AUTO_INCREMENT;
•	name – VARCHAR, NOT NULL; 
•	category_id – INT, NOT NULL – it is not a foreign key for now.
*/
CREATE TABLE `employees`(
`id` INT AUTO_INCREMENT PRIMARY KEY,
`first_name` VARCHAR(100) NOT NULL,
`last_name` VARCHAR(100) NOT NULL
);

USE `gamebar`;

CREATE TABLE `categories`(
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(100) NOT NULL
);

CREATE TABLE `products`(
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(100) NOT NULL,
`category_id` INT NOT NULL
);

/*
2. Insert Data in Tables
Inserting data can be done with a query too. To do that we use the "INSERT" clause. Populate the "employees" table with 3 test values.
*/
INSERT INTO `employees`(`first_name`, `last_name`) VALUES ("Pet", "Petrov");
INSERT INTO `employees`(`first_name`, `last_name`) VALUES 
("Ger", "Gerov"),
("Ivan", "Ivanov");

/*
3. Alter Tables
Altering the tables is done via the "ALTER TABLE" clause. Add a new column – "middle_name" to the "employees" table. 
*/
USE `gamebar`;
ALTER TABLE `employees`
ADD COLUMN `middle_name` VARCHAR(100);

/*
4. Adding Constraints
Create the connection via foreign key between the "products" and "categories" tables that you've created earlier. Make "category_id" foreign key linked to "id" in the "categories" table. 
*/
ALTER TABLE `products`
ADD CONSTRAINT `index_category_id`
FOREIGN KEY(`category_id`)
REFERENCES `categories`(`id`);

/*
5. Modifying Columns
Change the property "VARCHAR(50)" to "VARCHAR(100)" to the "middle_name" column in "employees" table.
*/
ALTER TABLE `employees`
MODIFY COLUMN `middle_name` VARCHAR(100);