/*
11.	Movies Database
Using SQL queries create Movies database with the following entities:
•	directors (id, director_name, notes) 
o	director_name cannot be null
•	genres (id, genre_name, notes) 
o	genre_name cannot be null
•	categories (id, category_name, notes)  
o	category_name cannot be null
•	movies (id, title, director_id, copyright_year, length, genre_id, category_id, rating, notes)
o	title cannot be null
Set most appropriate data types for each column. Set primary key to each table. Populate each table with 5 records. Make sure the columns that are present in 2 tables would be of the same data type. Consider which fields are always required and which are optional. Submit your CREATE TABLE and INSERT statements as Run queries & check DB.
*/

CREATE DATABASE `movies`;
USE `movies`;

CREATE TABLE `directors` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

INSERT INTO `directors` (`director_name`)
VALUES
("Petrov"),
("Prokop"),
("Name3"),
("Name4"),
("Name5");

CREATE TABLE `genres` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(10) NOT NULL,
    `notes` TEXT
);

INSERT INTO `genres` (`genre_name`)
VALUES
("Genre1"),
("Genre2"),
("Genre3"),
("Genre4"),
("Genre5");

CREATE TABLE `categories` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(10) NOT NULL,
    `notes` TEXT
);

INSERT INTO `categories` (`category_name`)
VALUES
("Cat_name1"),
("Cat_name2"),
("Cat_name3"),
("Cat_name4"),
("Cat_name5");

CREATE TABLE `movies` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `director_id` VARCHAR(50),
    `copyright_year` YEAR,
    `length` TIME,
    `genre_id` VARCHAR(20),
    `category_id` VARCHAR(20),
    `rating` INT,
    `notes` TEXT
);

INSERT INTO `movies` (`title`)
VALUES
("Title1"),
("Title2"),
("Title3"),
("Title4"),
("Title5");