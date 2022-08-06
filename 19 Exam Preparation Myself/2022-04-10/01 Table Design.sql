/*
0. Database Overview
You have been given an Entity / Relationship Diagram of the Database:
 
The softuni_imdb’s Database needs to hold information about movies, countries, actors, genres and movies additional info.
Your task is to create a database called softuni_imdb. Then you will have to create several tables.
•	countries – contains information about the countries.
•	movies – contains information about the movies.
o	Each movie has actors, country and genres.
•	actors – contains information about the actors.
o	Each actor has a country.
•	genres – contains information about the genres.
•	movies additional info – contains information about the customers.
•	movies_actors – a many to many mapping table between the movies and the actors.
•	genres_movies – a many to many mapping table between the genres and the movies.
Section 1: Data Definition Language (DDL) – 40 pts
Make sure you implement the whole database correctly on your local machine, so that you could work with it.
The instructions you'll be given will be the minimal needed for you to implement the database.
01.	Table Design
You have been tasked to create the tables in the database by the following models:

countries
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
UNIQUE values.
continent	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
currency	A string containing a maximum of 5 characters. Unicode is NOT needed.	NULL is NOT permitted.

genres
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
UNIQUE values.

actors
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
first_name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
last_name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
birthdate	The birthdate date of the person.	NULL is NOT permitted.
height	Integer, from 1 to 2,147,483,647.	
awards	Integer, from 1 to 2,147,483,647.	
country_id	Integer, from 1 to 2,147,483,647.	Relationship with table countries.
NULL is NOT permitted.

movies_additional_info
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
rating	DECIMAL, up to 10 digits, 2 of which after the decimal point.	NULL is NOT permitted.
runtime	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.
picture_url	A string containing a maximum of 80 characters. Unicode is NOT needed.	NULL is NOT permitted.
budget	DECIMAL, up to 10 digits, 2 of which after the decimal point.	
release_date	The release date of the movie.	NULL is NOT permitted.
has_subtitles	Can be true or false	
description	A very long string field	

movies
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
title	A string containing a maximum of 70 characters. Unicode is NOT needed.	NULL is NOT permitted.
UNIQUE values.
country_id	Integer, from 1 to 2,147,483,647.	Relationship with table countries.
NULL is NOT permitted.
movie_info_id	Integer, from 1 to 2,147,483,647.	Relationship with table movies_additional_info.
NULL is NOT permitted.
UNIQUE values.

movies_actors
Column Name	Data Type	Constraints
movie_id	Integer, from 1 to 2,147,483,647.	Relationship with table movies.
actor_id	Integer, from 1 to 2,147,483,647.	Relationship with table actors.

genres_movies
Column Name	Data Type	Constraints
genre_id	Integer, from 1 to 2,147,483,647.	Relationship with table genres.
movie_id	Integer, from 1 to 2,147,483,647.	Relationship with table movies.

Submit your solutions in Judge on the first task. Submit all SQL table creation statements.
You will also be given a data.sql file. It will contain a dataset with random data which you will need to store in your local database. This data will be given to you so you will not have to think of data and lose essential time in the process. The data is in the form of INSERT statement queries. 

*/

 CREATE DATABASE `imdb`;
 USE `imdb`;

CREATE TABLE `genres` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE `movies_additional_info` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `rating` DECIMAL(10 , 2 ) NOT NULL,
    `runtime` INT NOT NULL,
    `picture_url` VARCHAR(80) NOT NULL,
    `budget` DECIMAL(10 , 2 ),
    `release_date` DATE NOT NULL,
    `has_subtitles` TINYINT(1),
    `description` TEXT
);

CREATE TABLE `countries` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) UNIQUE NOT NULL,
    `continent` VARCHAR(30) NOT NULL,
    `currency` VARCHAR(5) NOT NULL
);

CREATE TABLE `movies` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(70) UNIQUE NOT NULL,
    `country_id` INT NOT NULL,
    `movie_info_id` INT UNIQUE NOT NULL,
    CONSTRAINT `fk_movies_movies_additional_info` FOREIGN KEY (`movie_info_id`)
        REFERENCES `movies_additional_info` (`id`),
	CONSTRAINT `fk_movies_countries` FOREIGN KEY (`country_id`)
		REFERENCES `countries`(`id`)
);

CREATE TABLE `actors`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `birthdate` DATE NOT NULL,
    `height` INT,
    `awards` INT,
    `country_id` INT NOT NULL,
    CONSTRAINT `fk_actors_countries` FOREIGN KEY(`country_id`)
		REFERENCES `countries`(`id`)
);

CREATE TABLE `movies_actors` (
    `movie_id` INT,
    `actor_id` INT,
    CONSTRAINT `fk_movies_actors_movies` FOREIGN KEY (`movie_id`)
        REFERENCES `movies` (`id`),
    CONSTRAINT `fk_movies_actors_actors` FOREIGN KEY (`actor_id`)
        REFERENCES `actors` (`id`)
);

CREATE TABLE `genres_movies` (
    `genre_id` INT,
    `movie_id` INT,
    CONSTRAINT `fk_genres_movies_genres` FOREIGN KEY (`genre_id`)
        REFERENCES `genres` (`id`),
    CONSTRAINT `fk_genres_movies_movies` FOREIGN KEY (`movie_id`)
        REFERENCES `movies` (`id`)
);

