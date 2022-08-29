/*
0: Database Overview
You have been given an Entity / Relationship Diagram of the Database:
 
The restaurant_db Database needs to hold information about orders, products, clients, waiters and tables.

Your task is to create a database called restaurant_db. Then you will have to create several tables.
•	products – contains information about the products.
•	clients – contains information about the clients.
•	tables – contains information about the tables.
•	waiters – contains information about the waiters.
•	orders – contains information about the orders.
o	Each order has a table, waiter and clients. 
•	orders_products – a many to many mapping table between the orders and the products.
•	orders_clients – a many to many mapping table between the orders and the clients.

Section 1: Data Definition Language (DDL) – 40 pts
Make sure you implement the whole database correctly on your local machine, so that you could work with it.
The instructions you'll be given will be the minimal needed for you to implement the database.
01.	Table Design
You have been tasked to create the tables in the database by the following models:
products
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
UNIQUE values.
type	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
price	DECIMAL, up to 10 digits, 2 of which after the decimal point.	NULL is NOT permitted.

clients
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
first_name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
last_name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
birthdate	The birth date of the client.	NULL is NOT permitted.
card 	A string containing a maximum of 50 characters. Unicode is NOT needed.	
review	A very long string field	

tables
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
floor	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.
reserved	Can be true or false	
capacity	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.

waiters
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
first_name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
last_name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
email	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
phone	A string containing a maximum of 50 characters. Unicode is NOT needed.	
salary	DECIMAL, up to 10 digits, 2 of which after the decimal point.	
orders
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
table_id	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.
waiter_id	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.
order_time	Time that the order has been created.	NULL is NOT permitted.
payed_status	Can be true or false.	

orders_clients
Column Name	Data Type	Constraints
order_id	Integer, from 1 to 2,147,483,647.	Relationship with table orders.
client_id	Integer, from 1 to 2,147,483,647.	Relationship with table clients.

orders_products
Column Name	Data Type	Constraints
order_id	Integer, from 1 to 2,147,483,647.	Relationship with table orders.
product_id	Integer, from 1 to 2,147,483,647.	Relationship with table products.

Submit your solutions in Judge on the first task. Submit all SQL table creation statements.
You will also be given a data.sql file. It will contain a dataset with random data which you will need to store in your local database. This data will be given to you so you will not have to think of data and lose essential time in the process. The data is in the form of INSERT statement queries. 
*/

DROP DATABASE `restaurant_db`;
CREATE DATABASE `restaurant_db`;
USE `restaurant_db`;

 CREATE TABLE `clients` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `birthdate` DATE NOT NULL,
    `card` VARCHAR(50),
    `review` TEXT
);
 
CREATE TABLE `products` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL UNIQUE,
    `type` VARCHAR(30) NOT NULL,
    `price` DECIMAL(10 , 2 ) NOT NULL
);

CREATE TABLE `waiters` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `phone` VARCHAR(50),
    `salary` DECIMAL(10 , 2 )
);
CREATE TABLE `tables` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `floor` INT NOT NULL,
    `reserved` TINYINT(1),
    `capacity` INT NOT NULL
);
CREATE TABLE `orders` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `table_id` INT NOT NULL,
    `waiter_id` INT NOT NULL,
    `order_time` TIME NOT NULL,
    `payed_status` TINYINT(1),
    CONSTRAINT `fk_orders_tables` FOREIGN KEY (`table_id`)
        REFERENCES `tables` (`id`),
    CONSTRAINT `fk_orders_waiters` FOREIGN KEY (`waiter_id`)
        REFERENCES `waiters` (`id`)
);
 
CREATE TABLE `orders_products` (
    `order_id` INT,
    `product_id` INT,
    CONSTRAINT `fk_orders_products_orders` FOREIGN KEY (`order_id`)
        REFERENCES `orders` (`id`),
    CONSTRAINT `fk_orders_products_products` FOREIGN KEY (`product_id`)
        REFERENCES `products` (`id`)
);

CREATE TABLE `orders_clients` (
    `order_id` INT,
    `client_id` INT,
    CONSTRAINT `fk_orders_clients_orders` FOREIGN KEY (`order_id`)
        REFERENCES `orders` (`id`),
    CONSTRAINT `fk_orders_clients_clients` FOREIGN KEY (`client_id`)
        REFERENCES `clients` (`id`)
);
