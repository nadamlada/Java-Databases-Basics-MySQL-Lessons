/*
0: Database Overview
You have been given an Entity / Relationship Diagram of the Database:
 
The online_stores’s Database needs to hold information about products, customers, orders, categories, brands, reviews.
Your task is to create a database called online_store. Then you will have to create several tables.
•	brands – contains information about the brands.
•	categories – contains information about the categories.
•	reviews – contains information about the reviews.
•	products – contains information about the products.
o	Each product has a brand, review and category.
•	customers – contains information about the customers.
•	orders – contains information about the orders.
o	Each order has a customer. 
•	orders_products – a many to many mapping table between the orders and the products.
Section 1: Data Definition Language (DDL) – 40 pts
Make sure you implement the whole database correctly on your local machine, so that you could work with it.
The instructions you'll be given will be the minimal needed for you to implement the database.

01.	Table Design
You have been tasked to create the tables in the database by the following models:

brands
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 40 characters. Unicode is NOT needed.	NULL is NOT permitted.
UNIQUE values.

categories
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 40 characters. Unicode is NOT needed.	NULL is NOT permitted.
UNIQUE values.

reviews
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
content	A very long string field	
rating	DECIMAL, up to 10 digits, 2 of which after the decimal point.	NULL is NOT permitted.
picture_url	A string containing a maximum of 80 characters. Unicode is NOT needed.	NULL is NOT permitted.
published_at	The publishing datetime of the review.	NULL is NOT permitted.

products
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 40 characters. Unicode is NOT needed.	NULL is NOT permitted.
price	DECIMAL, up to 19 digits, 2 of which after the decimal point.	NULL is NOT permitted.
quantity_in_stock	Integer, from 1 to 2,147,483,647.	
description	A very long string field	
brand_id	Integer, from 1 to 2,147,483,647.	Relationship with table brands.
NULL is NOT permitted.
category_id	Integer, from 1 to 2,147,483,647.	Relationship with table categories.
NULL is NOT permitted.
review_id	Integer, from 1 to 2,147,483,647.	Relationship with table reviews.
customers
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
first_name	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.
last_name	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.
phone	A string containing a maximum of 30 characters. Unicode is NOT needed	NULL is NOT permitted.
UNIQUE values.
address	A string containing a maximum of 60 characters. Unicode is NOT needed.	NULL is NOT permitted.
discount_card	Can be true or false	NULL is NOT permitted.
Default is FALSE

orders
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
order_datetime	The publishing datetime of the order.	NULL is NOT permitted.
customer_id	Integer, from 1 to 2,147,483,647.	Relationship with table customers.
NULL is NOT permitted.

orders_products
Column Name	Data Type	Constraints
order_id	Integer, from 1 to 2,147,483,647.	Relationship with table orders.
product_id	Integer, from 1 to 2,147,483,647.	Relationship with table products.

Submit your solutions in Judge on the first task. Submit all SQL table creation statements.
You will also be given a data.sql file. It will contain a dataset with random data which you will need to store in your local database. This data will be given to you so you will not have to think of data and lose essential time in the process. The data is in the form of INSERT statement queries. 
*/

CREATE DATABASE `online_store`;
USE `online_store`;

CREATE TABLE `customers`(
	`id` INT PRImARY KEY AUTO_INCREMENT,
	`first_name` VARCHAR(20) NOT NULL,
	`last_name` VARCHAR(20) NOT NULL,
	`phone` VARCHAR(30) UNIQUE NOT NULL,
	`address` VARCHAR(60) NOT NULL,
	`discount_card` BIT(1) DEFAULT 0 NOT NULL
);

CREATE TABLE `orders` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `order_datetime` DATETIME NOT NULL,
    `customer_id` INT NOT NULL,
    CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`)
        REFERENCES `customers` (`id`)
);

CREATE TABLE `brands` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE `reviews` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `content` TEXT,
    `rating` DECIMAL(10 , 2 ) NOT NULL,
    `picture_url` VARCHAR(80) NOT NULL,
    `published_at` DATETIME NOT NULL
);

CREATE TABLE `products`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(40) NOT NULL,
	`price` DECIMAL (19, 2) NOT NULL,
	`quantity_in_stock` INT,
	`description` TEXT,
	`brand_id` INT NOT NULL,
    CONSTRAINT `fk_products_brands` FOREIGN KEY (`brand_id`)
		REFERENCES `brands` (`id`),
	`category_id` INT NOT NULL,
    CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`)
		REFERENCES `categories`(`id`),
	`review_id` INT,
    CONSTRAINT `fk_products_reviews` FOREIGN KEY (`review_id`)
		REFERENCES `reviews`(`id`)
);

CREATE TABLE `orders_products` (
    `order_id` INT,
    CONSTRAINT `fk_orders_products_orders` FOREIGN KEY (`order_id`)
        REFERENCES `orders` (`id`),
    `product_id` INT,
    CONSTRAINT `fk_orders_products_products` FOREIGN KEY (`product_id`)
        REFERENCES `products` (`id`)
);