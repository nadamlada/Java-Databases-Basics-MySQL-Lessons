/*
12.	Car Rental Database
Using SQL queries create car_rental database with the following entities:
•	categories (id, category, daily_rate, weekly_rate, monthly_rate, weekend_rate)
•	cars (id, plate_number, make, model, car_year, category_id, doors, picture, car_condition, available)
•	employees (id, first_name, last_name, title, notes)
•	customers (id, driver_licence_number, full_name, address, city, zip_code, notes)
•	rental_orders (id, employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes)
Set most appropriate data types for each column. Set primary key to each table. Populate each table with 3 records. Make sure the columns that are present in 2 tables would be of the same data type. Consider which fields are always required and which are optional. Submit your CREATE TABLE and INSERT statements as Run queries & check DB.
*/

CREATE DATABASE `data_new`;
USE `data_new`;

CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category` VARCHAR(30),
    `daily_rate` DOUBLE,
    `weekly_rate` DOUBLE,
    `monthly_rate` DOUBLE,
    `weekend_rate` DOUBLE
);

INSERT INTO `categories` (`category`)
VALUES
("action"),
("drama"),
("xxx");

CREATE TABLE `cars` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `plate_number` VARCHAR(10),
    `make` VARCHAR(20),
    `model` VARCHAR(30),
    `car_year` INT,
    `category_id` INT,
    `doors` INT,
    `picture` BLOB,
    `car_condition` TEXT,
    `available` BOOLEAN
);

INSERT INTO `cars` (`plate_number`, `model`)
VALUES
("FF55522AA", "red"),
("NN454554HH", "green"),
("LO655544JJ", "blue");

CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(30),
    `last_name` VARCHAR(30),
    `title` VARCHAR(30),
    `notes` TEXT
);

INSERT INTO `employees` (`first_name`, `title`)
VALUES
("Pencho", "title1"),
("Gosho", "title2"),
("Prokop", "title3");

CREATE TABLE `customers` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `driver_licence_number` INT,
    `full_name` VARCHAR(60),
    `address` VARCHAR(100),
    `city` VARCHAR(20),
    `zip_code` INT,
    `notes` TEXT
);

INSERT INTO `customers` (`city`, `zip_code`)
VALUES
("Sofia", "1000"),
("Paris", "5555"),
("Smolyan", "4545");

CREATE TABLE `rental_orders` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `employee_id` INT,
    `customer_id` INT,
    `car_id` INT,
    `car_condition` TEXT,
    `tank_level` INT,
    `kilometrage_start` INT,
    `kilometrage_end` INT,
    `total_kilometrage` INT,
    `start_date` DATE,
    `end_date` DATE,
    `total_days` INT,
    `rate_applied` DOUBLE,
    `tax_rate` DOUBLE,
    `order_status` BOOLEAN,
    `notes` TEXT
);

INSERT INTO `rental_orders` (`employee_id`)
VALUES
(12),
(2),
(25);