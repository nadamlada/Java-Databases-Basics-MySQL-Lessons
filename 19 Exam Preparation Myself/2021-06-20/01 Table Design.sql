/*
0: Database Overview
You have been given an Entity / Relationship Diagram of the SoftUni Taxi Company:
 
The SoftUni Taxi Company (stc) needs to hold information about cars, courses, drivers, clients, addresses and categories.
Your task is to create a database called stc (SoftUni Taxi Company). Then you will have to create several tables:
•	cars – contains information about the cars
o	Each car has a make column, a model column, a year column, a mileage column, a condition  column and a category column
•	courses – contains information about the courses
o	Each course has a from_address column, a start column, a car column, a client column and a bill  column
•	  drivers – contains information about the drivers 
o	  Each driver has a first and last name columns, an age column and a rating column
•	clients – contains information about the clients
o	  Each client has a full name column and a phone number column
•	addresses – contains information about the addresses
•	categories – contains information about the categories
o	  Contains the name of the category
•	cars_drivers – a many to many mapping tables between the cars and the drivers
o	Have composite primary key from the car_id column and the driver_id column

Section 1: Data Definition Language (DDL) – 40 pts
Make sure you implement the whole database correctly on your local machine so that you can work with it.
The instructions you will be given will be the minimal required for you to implement the database.

1.	Table Design
You have been tasked to create the tables in the database by the following models:

addresses
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 100 characters. Unicode is NOT needed.	NULL is NOT permitted.

categories
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 10 characters. Unicode is NOT needed.	NULL is NOT permitted.

clients
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
full_name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
phone_number	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.

drivers
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
first_name	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
last_name	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
age	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.
rating	Floating point number	DEFAULT value is 5.5
NULL is permitted.

cars
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
make	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.
model	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is permitted.
year	Integer, from 1 to 2,147,483,647.	DEFAULT value is 0 
NULL is NOT permitted.
mileage	Integer, from 1 to 2,147,483,647.	DEFAULT value is 0 
NULL is permitted.
condition	character that shows the condition of the car.  One character.	NULL is NOT permitted.
category_id	Integer, from 1 to 2,147,483,647.	Relationship with table categories.
NULL is NOT permitted.

courses
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
from_address_id	Integer, from 1 to 2,147,483,647.	Relationship with table addresses.
NULL is NOT permitted.
start	The date and time when the course starts	NULL is NOT permitted.
bill	DECIMAL, up to 10 digits, 2 of which after the decimal point.	DEFAULT value is 10
car_id	Integer, from 1 to 2,147,483,647.	Relationship with table cars.
NULL is NOT permitted.
client_id	Integer, from 1 to 2,147,483,647.	Relationship with table clients.
NULL is NOT permitted.

cars_drivers
Column Name	Data Type	Constraints
car_id	Integer, from 1 to 2,147,483,647.	Relationship with table cars.
NULL is NOT permitted.
driver_id	Integer, from 1 to 2,147,483,647.	Relationship with table drivers.
NULL is NOT permitted.

o		Have composite primary key from the car_id column and the driver_id column

Submit your solutions in Judge on the first task. Submit all SQL table creation statements.
You will also be given a data.sql file. It will contain a dataset with data which you will need to store in your local database. This data will be given to you, so you do not have to imagine it and lose precious time in the process.
The data is in the form of INSERT statement queries.
*/

CREATE DATABASE `stc`;
USE `stc`;

CREATE TABLE `addresses` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `clients` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `full_name` VARCHAR(50) NOT NULL,
    `phone_number` VARCHAR(20) NOT NULL
);
    
CREATE TABLE `drivers` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `age` INT NOT NULL,
    `rating` FLOAT DEFAULT 5.5
);

    CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(10) NOT NULL
);
    
CREATE TABLE `cars` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `make` VARCHAR(20) NOT NULL,
    `model` VARCHAR(20),
    `year` INT DEFAULT 0 NOT NULL,
    `mileage` INT DEFAULT 0,
    `condition` CHAR(1) NOT NULL,
    `category_id` INT NOT NULL,
    CONSTRAINT `fk_cars_categories` FOREIGN KEY (`category_id`)
        REFERENCES `categories` (`id`)
);
    
CREATE TABLE `cars_drivers` (
    `car_id` INT,
    `driver_id` INT,
    CONSTRAINT `fk_cars_drivers_cars` FOREIGN KEY (`car_id`)
        REFERENCES `cars` (`id`),
    CONSTRAINT `fk_cars_drivers_drvers` FOREIGN KEY (`driver_id`)
        REFERENCES `drivers` (`id`),
    CONSTRAINT `pk_cars_drivers_mapping` PRIMARY KEY (`car_id` , `driver_id`)
);

CREATE TABLE `courses` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `from_address_id` INT NOT NULL,
    CONSTRAINT `fk_courses_addresses` FOREIGN KEY (`from_address_id`)
        REFERENCES `addresses` (`id`),
    `start` DATETIME NOT NULL,
    `car_id` INT NOT NULL,
    CONSTRAINT `fk_courses_cars` FOREIGN KEY (`car_id`)
        REFERENCES `cars` (`id`),
    `client_id` INT NOT NULL,
    CONSTRAINT `fk_courses_clients` FOREIGN KEY (`client_id`)
        REFERENCES `clients` (`id`),
    `bill` DECIMAL(10 , 2 ) DEFAULT 10
);