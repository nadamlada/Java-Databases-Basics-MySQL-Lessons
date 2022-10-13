-- SELECT @@sql_mode;
-- SET sql_mode = 'ONLY_FULL_GROUP_BY';
-- SET sql_mode = '';

/*
In a parallel reality, you have been selected to help the most famous football coaches to select the best players for their teams. Thanks to your knowledge of databases, you have been selected to create the structure of a brand new database, tailored to the requirements of your employers, and to fill it in with a huge amount of data collected for you by the most experienced football scouts. Once the base is ready, you will be able to respond without any problems to any information request from the coaches on the basis of certain criteria. As with other databases, it is most important first to become familiar with the structure you need to build, and then fill it with given data.
Section 0: Database Overview
You have been given an Entity / Relationship Diagram of the Football Scout Database:
 
The Football Scout Database (FSD) needs to hold information about players, skill, coaches, teams, stadiums, towns, countries.
Your task is to create a database called fsd (Football Scout Database). Then you will have to create several tables.
•	players – contains information about the players.
o	Each player has a skills data, team and coach.
•	coaches – contains information about the coaches.
o	One coach can train many players
•	players_coaches – a many to many mapping table between the players and the coaches.
o	Have composite primary key from player_id and coach_id 

•	skill data – contains information about the current player skills.
•	teams – contains information about the teams.
o	Each team has a stadium.
•	stadiums – contains information about the stadiums.
o	Each stadium has a city.
•	towns - contains information about the towns.
o	Each town has a country
•	countries – contains information about current country.
Section 1: Data Definition Language (DDL) – 40 pts
Make sure you implement the whole database correctly on your local machine, so that you could work with it.
The instructions you’ll be given will be the minimal required for you to implement the database.

1.	Table Design
You have been tasked to create the tables in the database by the following models:

players
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
first_name	A string containing a maximum of 10 characters. Unicode is NOT needed.	NULL is NOT permitted.
last_name	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.
age	Integer, from 1 to 2,147,483,647.	DEFAULT value is 0.
NULL is NOT permitted.
position	Exactly 1 character – A or M or D	NULL is NOT permitted.
salary	DECIMAL, up to 10 digits, 2 of which after the decimal point.	DEFAULT value is 0.
NULL is NOT permitted.
hire_date	The exact time and date of conclusion of the contract	NULL is permitted.
skills_data_id	Integer, from 1 to 2,147,483,647.	Relationship with table skill_datas.
NULL is NOT permitted.
team_id	Integer, from 1 to 2,147,483,647.	Relationship with table teams.
NULL is permitted.

players_coaches
Column Name	Data Type	Constraints
player_id	Integer, from 1 to 2,147,483,647.	Relationship with table players.
coach_id	Integer, from 1 to 2,147,483,647.	Relationship with table coaches.

coaches
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
first_name	A string containing a maximum of 10 characters. Unicode is NOT needed.	NULL is NOT permitted.
last_name	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.
salary	DECIMAL, up to 10 digits, 2 of which after the decimal point.	DEFAULT value is 0.
NULL is NOT permitted.
coach_level	Integer, from 1 to 2,147,483,647.	DEFAULT value is 0.
NULL is NOT permitted.

skills_data	
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
dribbling	Integer, from 1 to 2,147,483,647.	DEFAULT value is 0 
pace	Integer, from 1 to 2,147,483,647.	DEFAULT value is 0 
passing	Integer, from 1 to 2,147,483,647.	DEFAULT value is 0 
shooting	Integer, from 1 to 2,147,483,647.	DEFAULT value is 0 
speed	Integer, from 1 to 2,147,483,647.	DEFAULT value is 0 
strength	Integer, from 1 to 2,147,483,647.	DEFAULT value is 0 

teams
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 45 characters. Unicode is NOT needed.	NULL is NOT permitted.
established	The year and date the club was founded
	NULL is NOT permitted.
fan_base	Very big Integer, from 1 to 264-1.	NOT is NULL permitted,
DEFAULT value is 0
stadium_id	Integer, from 1 to 2,147,483,647.	Relationship with table stadiums.
NULL is NOT permitted.

stadiums
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 45 characters. Unicode is NOT needed.	NULL is NOT permitted.
capacity	Integer, from 1 to 2,147,483,647.	NULL is NOT permitted.
town_id	Integer, from 1 to 2,147,483,647.	Relationship with table towns.
NULL is NOT permitted.

towns
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 45 characters. Unicode is NOT needed.	NULL is NOT permitted.
country_id	Integer, from 1 to 2,147,483,647.	Relationship with table countries.
NULL is NOT permitted.

countries
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 45 characters. Unicode is NOT needed.	NULL is NOT permitted.
	
Submit your solutions in Judge on the first task. Submit all SQL table creation statements.
You will also be given a data.sql file. It will contain a dataset with random data which you will need to store in your local database. This data will be given to you so you don’t have to imagine it and lose precious time in the process. The data is in the form of INSERT statement queries.
*/

CREATE SCHEMA `fsd`;
USE `fsd`;

CREATE TABLE `countries`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL 
);

CREATE TABLE `towns` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `country_id` INT NOT NULL,
    CONSTRAINT `fk_towns_countries` FOREIGN KEY (`country_id`)
        REFERENCES `countries` (`id`)
);

CREATE TABLE `stadiums` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `capacity` INT NOT NULL,
    `town_id` INT NOT NULL,
    CONSTRAINT `fk_stadiums_towns` FOREIGN KEY (`town_id`)
        REFERENCES `towns` (`id`)
);

CREATE TABLE `teams` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `established` DATE NOT NULL,
    `fan_base` BIGINT DEFAULT 0 NOT NULL,
    `stadium_id` INT NOT NULL,
    CONSTRAINT `fk_teams_stadiums` FOREIGN KEY (`stadium_id`)
        REFERENCES `stadiums` (`id`)
);

CREATE TABLE `skills_data`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `dribbling` INT DEFAULT 0,
    `pace` INT DEFAULT 0,
    `passing` INT DEFAULT 0,
    `shooting` INT DEFAULT 0,
	`speed` INT DEFAULT 0,
    `strength` INT DEFAULT 0
);

CREATE TABLE `coaches` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(10) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    `salary` DECIMAL(10 , 2 ) DEFAULT 0 NOT NULL,
    `coach_level` INT DEFAULT 0 NOT NULL
);

CREATE TABLE `players` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(10) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    `age` INT DEFAULT 0 NOT NULL,
    `position` CHAR(1) NOT NULL,
    `salary` DECIMAL(10 , 2 ) DEFAULT 0 NOT NULL,
    `hire_date` DATETIME,
    `skills_data_id` INT NOT NULL,
    `team_id` INT,
    CONSTRAINT `fk_players_teams` FOREIGN KEY (`team_id`)
        REFERENCES `teams` (`id`),
    CONSTRAINT `fk_players_skills_data` FOREIGN KEY (`skills_data_id`)
        REFERENCES `skills_data` (`id`)
);

 CREATE TABLE `players_coaches` (
    `player_id` INT,
    `coach_id` INT,
    CONSTRAINT `mapping_players_coaches_players` FOREIGN KEY (`player_id`)
        REFERENCES `players` (`id`),
    CONSTRAINT `mapping_players_coaches_coaches` FOREIGN KEY (`coach_id`)
        REFERENCES `coaches` (`id`),
    CONSTRAINT `pk_mapping` PRIMARY KEY (`player_id` , `coach_id`)
);
