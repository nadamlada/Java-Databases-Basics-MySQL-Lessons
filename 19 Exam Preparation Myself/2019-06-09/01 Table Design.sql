/*
0.	Section 0: Database Overview
You have been given an Entity / Relationship Diagram of the Database:
 
The Bank's Database needs to hold information about branches, employees, clients, bank accounts, cards.
Your task is to create a database called ruk_database. Then you will have to create several tables.
•	branches – contains information about the branches.
•	employees – contains information about the employees.
o	Each employee has a branch. 
•	clients – contains information about the clients.
•	employees_clients – a many to many mapping table between the employees and the clients.
•	bank_accounts – contains information about the bank accounts.
o	Each bank_account has a client. 

•	cards – contains information about the cards.
o	Each card has a client.
o	Each card has a bank_account.

1.	Section 1: Data Definition Language (DDL) – 40 pts
Make sure you implement the whole database correctly on your local machine, so that you could work with it.
The instructions you'll be given will be the minimal needed for you to implement the database.

01.	Table Design
You have been tasked to create the tables in the database by the following models:
branches
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
UNIQUE values.

employees
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
first_name	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.
last_name	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.
salary	DECIMAL, up to 10 digits, 2 of which after the decimal point.	NULL is NOT permitted.
started_on	A DATE field. Format - (YYYY-MM-DD).	NULL is NOT permitted.
branch_id	Integer, from 1 to 2,147,483,647.	Relationship with table branches.
NULL is NOT permitted.

clients
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
full_name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
age	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.

employees_clients
Column Name	Data Type	Constraints
employee_id	Integer, from 1 to 2,147,483,647.	Relationship with table employees.
client_id	Integer, from 1 to 2,147,483,647.	Relationship with table clients.

bank_accounts
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
account_number	A string containing a maximum of 10 characters. Unicode is NOT needed.	NULL is NOT permitted.
balance	DECIMAL, up to 10 digits, 2 of which after the decimal point.	NULL is NOT permitted.
client_id	Integer, from 1 to 2,147,483,647.	Relationship with table clients.
NULL is NOT permitted.
UNIQUE values.

cards
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
card_number	A string containing a maximum of 19 characters. Unicode is NOT needed.	NULL is NOT permitted.
card_status	A string containing a maximum of 7 characters. Unicode is NOT needed.	NULL is NOT permitted.
bank_account_id	Integer, from 1 to 2,147,483,647.	Relationship with table bank_accounts.
NULL is NOT permitted.

Submit your solutions in Judge on the first task. Submit all SQL table creation statements.
You will also be given a data.sql file. It will contain a dataset with random data which you will need to store in your local database. This data will be given to you so you will not have to think of data and lose essential time in the process. The data is in the form of INSERT statement queries. 
*/

CREATE SCHEMA `ruk_database`;
USE `ruk_database`;

CREATE TABLE `branches` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL
);

CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(20) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    `salary` DECIMAL(10 , 2 ) NOT NULL,
    `started_on` DATE NOT NULL,
    `branch_id` INT NOT NULL,
    CONSTRAINT `fk_employees_branches` FOREIGN KEY (`branch_id`)
        REFERENCES `branches` (`id`)
);

CREATE TABLE `cards` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `card_number` VARCHAR(19) NOT NULL,
    `card_status` VARCHAR(7) NOT NULL,
    `bank_account_id` INT NOT NULL
);


CREATE TABLE `clients` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
    ``
    ``
    );
CREATE TABLE `employees_clients` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
    ``
    ``
    );
CREATE TABLE `bank_accounts` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
    ``
    ``
    );

CREATE TABLE `` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
    ``
    ``
    );
CREATE TABLE `` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
    ``
    ``
    );
CREATE TABLE `` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
    ``
    ``
    );
CREATE TABLE `` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
    ``
    ``
    );
CREATE TABLE `` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
    ``
    ``
    );
