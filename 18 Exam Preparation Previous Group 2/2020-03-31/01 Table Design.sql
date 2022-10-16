CREATE DATABASE `Influencers`;
USE `Influencers`;

/*
01.	Table Design
You have been tasked to create the tables in the database by the following models:

users
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
username	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
UNIQUE values.
password	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
email	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.
gender	Exactly 1 character – M or F	NULL is NOT permitted.
age	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.
job_title	A string containing a maximum of 40 characters. Unicode is NOT needed.	NULL is NOT permitted.
ip	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.

addresses
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
address	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
town	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
country	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
user_id	Integer, from 1 to 2,147,483,647.	Relationship with table users.
NULL is NOT permitted.

photos
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
description	Very big String.	NULL is NOT permitted.
date	The exact date and time.	NULL is NOT permitted.
views	Integer, from 1 to 2,147,483,647.	DEFAULT value is 0.
NULL is NOT permitted.

comments
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
comment	A String containing a maximum of 255 characters. Unicode is NOT needed.	NULL is NOT permitted.
date	The exact date and time.	NULL is NOT permitted.
photo_id	Integer, from 1 to 2,147,483,647.	Relationship with table photos.
NULL is NOT permitted.

users_photos
Column Name	Data Type	Constraints
user_id	Integer, from 1 to 2,147,483,647.	Relationship with table users. NULL is NOT permitted.
photo_id	Integer, from 1 to 2,147,483,647.	Relationship with table photos. NULL is NOT permitted.

likes
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
photo_id	Integer, from 1 to 2,147,483,647.	Relationship with table photos.
user_id	Integer, from 1 to 2,147,483,647.	Relationship with table users.

Submit your solutions in Judge on the first task. Submit all SQL table creation statements.
You will also be given a data.sql file. It will contain a dataset with random data which you will need to store in your local database. This data will be given to you, so you don’t have to imagine it and lose precious time in the process. The data is in the form of INSERT statement queries.
*/

CREATE TABLE `users` (
    `id` INT PRIMARY KEY,
    `username` VARCHAR(30) UNIQUE NOT NULL,
    `password` VARCHAR(30) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `gender` CHAR(1) NOT NULL,
    `age` INT NOT NULL,
    `job_title` VARCHAR(40) NOT NULL,
    `ip` VARCHAR(30) NOT NULL
);

CREATE TABLE `addresses` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `address` VARCHAR(30) NOT NULL,
    `town` VARCHAR(30) NOT NULL,
    `country` VARCHAR(30) NOT NULL,
    `user_id` INT NOT NULL,
    CONSTRAINT `fk_addressess_users` FOREIGN KEY (`user_id`)
        REFERENCES `users` (`id`)
);

CREATE TABLE `photos` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `description` TEXT NOT NULL,
    `date` DATETIME NOT NULL,
    `views` INT DEFAULT 0 NOT NULL
);

CREATE TABLE `comments` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `comment` VARCHAR(255) NOT NULL,
    `date` DATETIME NOT NULL,
    `photo_id` INT NOT NULL,
    CONSTRAINT `fk_comments_photos` FOREIGN KEY (`photo_id`)
        REFERENCES `photos` (`id`)
);

CREATE TABLE `likes` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `photo_id` INT,
    `user_id` INT,
    CONSTRAINT `fk_likes_photos` FOREIGN KEY (`photo_id`)
        REFERENCES `photos` (`id`),
    CONSTRAINT `fk_likes_users` FOREIGN KEY (`user_id`)
        REFERENCES `users` (`id`)
);

CREATE TABLE `users_photos` (
    `user_id` INT NOT NULL,
    `photo_id` INT NOT NULL,
    CONSTRAINT `mapping_users_photos_users` FOREIGN KEY (`user_id`)
        REFERENCES `users` (`id`),
    CONSTRAINT `mapping_users_photos_photo` FOREIGN KEY (`photo_id`)
        REFERENCES `photos` (`id`)
    -- PRIMARY KEY (`user_id` , `photo_id`)
);
