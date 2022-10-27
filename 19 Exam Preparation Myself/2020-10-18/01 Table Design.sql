/*
0: Database Overview
You have been given an Entity / Relationship Diagram of the SoftUni Stores System:
 
The SoftUniStoresSystem needs to hold information about stores, products, employees, addresses, towns, pictures and categories.

Your task is to create a database called softuni_stores_system. Then you will have to create several tables.
•	stores – contains information about the stores.
o	Each store has a name, rating, has parking and relation with addresses.

•	products – contains information about the products.
o	Each product has a name, best before, price, description and has 
relations with categories and pictures.

•	products_stores – a many to many mapping table between the products and the stores.
o	Has a composite primary key from product_id and store_id 

•	employees – contains information about the employees.
o	Each employee has first name, middle name, last name, salary and have relations with stores and with self. 

•	addresses – contains information about the addresses of stores.
o	Each address has name and relation with towns.

•	towns - contains information about the towns.
o	Each town has a name.

•	categories – contains information about the categories.
o	Each category has a name.

•	pictures – contains information about the pictures.
o	Each picture has a name and date and time when is added on.

Section 1: Data Definition Language (DDL) – 40 pts
Make sure you implement the whole database correctly on your local machine, so that you could work with it.
The instructions you’ll be given will be the minimal required for you to implement the database.

1.	Table Design
You have been tasked to create the tables in the database by the following models:

pictures
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
url	A string containing a maximum of 100 characters. Unicode is NOT needed.	NULL is NOT permitted.
added_on	A date and time of adding picture.	NULL is NOT permitted.

categories
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 40 characters. Unicode is NOT needed.	NULL is NOT permitted.
The name is unique.

products
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 40 characters. Unicode is NOT needed.	NULL is NOT permitted.
The name is unique.
best_before	A date that product is best before 	
price	Decimal number, up to 10 digits, 2 of which after the decimal point.	NULL is NOT permitted.
description	 A very long String field 	
category_id	Integer, from 1 to 2,147,483,647.	Relationship with table categories.
NULL is NOT permitted.
picture_id	Integer, from 1 to 2,147,483,647.	Relationship with table pictures.
NULL is NOT permitted.

towns
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.
The name is unique.

addresses
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
The name is unique.
town_id	Integer, from 1 to 2,147,483,647.	Relationship with table towns.
NULL is NOT permitted.

stores
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.
The name is unique.
rating 	A floating point number 	NULL is NOT permitted.
has_parking	Can be true or false	Default is FALSE
address_id	Integer, from 1 to 2,147,483,647.	Relationship with table addresses.
NULL is NOT permitted.

products_stores
Column Name	Data Type	Constraints
product_id	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.
store_id	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.

•	products_stores table has a composite primary key from product_id and store_id 

employees
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
first_name	A string containing a maximum of 15 characters. Unicode is NOT needed.	NULL is NOT permitted.
middle_name	A single one character	
last_name	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.
salary	Decimal number, up to 19 digits, 2 of which after the decimal point.	DEFAULT 0 
hire_date	A date that employee was hired	NULL is NOT permitted.
manager_id	Integer, from 1 to 2,147,483,647.	
store_id	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.

Submit your solutions in Judge on the first task. Submit all SQL table creation statements.
You will also be given a data.sql file. It will contain a dataset with random data which you will need to store in your local database. This data will be given to you so you don’t have to imagine it and lose precious time in the process. The data is in the form of INSERT statement queries.
*/

CREATE SCHEMA `softuni_stores_system`;
USE `softuni_stores_system`;

CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE `pictures` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `url` VARCHAR(100) NOT NULL,
    `added_on` DATETIME NOT NULL
);

CREATE TABLE `towns` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE `addresses` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE NOT NULL,
    `town_id` INT NOT NULL,
    CONSTRAINT `fk_addresses_towns` FOREIGN KEY (`town_id`)
		REFERENCES `towns`(`id`)
);

CREATE TABLE `stores` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) UNIQUE NOT NULL,
    `rating` FLOAT NOT NULL,
    `has_parking` TINYINT(1) DEFAULT 0,
    `address_id` INT NOT NULL,
     CONSTRAINT `fk_stores_addresses` FOREIGN KEY (`address_id`)
		REFERENCES `addresses`(`id`)
);

CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(15) NOT NULL,
    `middle_name` CHAR(1),
    `last_name` VARCHAR(20) NOT NULL,
    `salary` DECIMAL(19 , 2 ) DEFAULT 0 NOT NULL,
    `hire_date` DATE NOT NULL,
    `manager_id` INT,
    `store_id` INT NOT NULL,
    CONSTRAINT `fk_employees_stores` FOREIGN KEY (`store_id`)
        REFERENCES `stores` (`id`),
	CONSTRAINT `fk_employees_employees` FOREIGN KEY (`manager_id`)
		REFERENCES `employees`(`id`)
);

CREATE TABLE `products` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) UNIQUE NOT NULL,
    `best_before` DATE,
    `price` DECIMAL(10 , 2 ) NOT NULL,
    `description` TEXT,
    `category_id` INT NOT NULL,
    `picture_id` INT NOT NULL,
    CONSTRAINT `fk_products_pictures` FOREIGN KEY (`picture_id`)
        REFERENCES `pictures` (`id`),
    CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`)
        REFERENCES `categories` (`id`)
);

CREATE TABLE `products_stores` (
    `product_id` INT NOT NULL,
    `store_id` INT NOT NULL,
      CONSTRAINT `products_stores_stores` FOREIGN KEY (`store_id`)
		REFERENCES `stores`(`id`),
	CONSTRAINT `products_stores_products` FOREIGN KEY (`product_id`)
		REFERENCES `products`(`id`),
	CONSTRAINT `` PRIMARY KEY (`product_id`, `store_id`)
);