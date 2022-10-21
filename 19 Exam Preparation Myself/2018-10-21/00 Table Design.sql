/*
1.	Section: Database Overview
You have given an Entity / Relationship Diagram of the CJMS Database:

 The CJMS Database holds information about colonists, their travel cards, information about the journeys, types of space vessels and destination planets. Your task is to create a database called colonial_journey_management_system_db. Then you will have to create several tables.
•	planets – contains information about planets.
•	spaceports – contains information about space ports.
•	spaceships – contains information about space ships.
•	colonists – contains information about colonists.
•	journeys – contains information about journeys.
•	travel_ cards – contains information about travel cards.

Make sure you implement the whole database correctly on your local machine, so that you could work with it.
The instructions you are given will be the minimal needed for you to implement the database.

2.	Section: Data Definition Language (DDL) – 40pts
You have been tasked to create the tables in the database by the following models:
planets
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.


spaceports
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.

planet_id	Integer, from 1 to 2,147,483,647.	Relationship with table planets.

spaceships
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
name	A string containing a maximum of 50 characters. Unicode is NOT needed.	NULL is NOT permitted.

manufacturer	A string containing a maximum of 30 characters. Unicode is NOT needed.	NULL is NOT permitted.
light_speed_rate	Integer, from 0 to 2,147,483,647.	Has a default value of 0.

colonists
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
first_name	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.

last_name	A string containing a maximum of 20 characters. Unicode is NOT needed.	NULL is NOT permitted.
ucn	A string containing exactly 10 characters. Unicode is NOT needed.	NULL is NOT permitted.
UNIQUE values.
birth_date	Date without time.	NULL is NOT permitted.

journeys
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
journey_start	Date with time.	NULL is NOT permitted.
journey_end	Date with time.	NULL is NOT permitted.
purpose	A string containing a maximum of 11 characters. Unicode is NOT needed.	Should only contain one of the following purposes: “Medical”, “Technical”, “Educational”, “Military”
destination_spaceport_id	Integer, from 1 to 2,147,483,647.	Relationship with table spaceports.
spaceship_id	Integer, from 1 to 2,147,483,647.	Relationship with table spaceships.

travel_cards
Column Name	Data Type	Constraints
id	Integer, from 1 to 2,147,483,647.	Primary Key
AUTO_INCREMENT
card_number	A string containing exactly 10 characters. Unicode is NOT needed.	NULL is NOT permitted.
UNIQUE values.
job_during_journey	A string containing a maximum of 6 characters. Unicode is NOT needed.	Should only contain one of the following jobs: “Pilot”, “Engineer”, “Trooper”, “Cleaner”, “Cook”
colonist_id	Integer, from 1 to 2,147,483,647.	Relationship with table colonists.
journey_id	Integer, from 1 to 2,147,483,647.	Relationship with table journeys.

Submit your solutions in Judge for task 00. Table Design. Submit all SQL table creation statements.
You will also be given a data.sql file. It will contain a dataset with random data which you will need to store in your local database. This data will be given to you so you will not have to think of data and lose essential time in the process. The data is in the form of INSERT statement queries. 
*/

DROP DATABASE`colonial_journey_management_system_db`;
CREATE DATABASE `colonial_journey_management_system_db`;
USE `colonial_journey_management_system_db`;

CREATE TABLE `planets` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(30) NOT NULL
);

CREATE TABLE `spaceports` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `planet_id` INT NOT NULL,
    CONSTRAINT `fk_spaceports_planets` FOREIGN KEY (`planet_id`)
        REFERENCES `planets` (`id`)
);

CREATE TABLE `colonists` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(20) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    `ucn` CHAR(10) NOT NULL UNIQUE,
    `birth_date` DATE NOT NULL
);

CREATE TABLE `spaceships` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `manufacturer` VARCHAR(30) NOT NULL,
    `light_speed_rate` INT DEFAULT 0
);

CREATE TABLE `journeys` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `journey_start` DATETIME NOT NULL,
    `journey_end` DATETIME NOT NULL,
    `purpose` ENUM('Medical', 'Technical', 'Educational','Military'),
    `destination_spaceport_id` INT,
    `spaceship_id` INT,
    CONSTRAINT `fk_journeys_spaceships` FOREIGN KEY (`spaceship_id`)
        REFERENCES `spaceships` (`id`),
    CONSTRAINT `fk_journeys_spaceports` FOREIGN KEY (`destination_spaceport_id`)
        REFERENCES `spaceports` (`id`)
);

CREATE TABLE `travel_cards` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `card_number` CHAR(10) NOT NULL UNIQUE,
    `job_during_journey` ENUM('Pilot', 'Engineer', 'Trooper', 'Cleaner', 'Cook' ),
    `colonist_id` INT,
    `journey_id` INT,
    CONSTRAINT `fk_travel_cards_colonists` FOREIGN KEY (`colonist_id`)
        REFERENCES `colonists` (`id`),
    CONSTRAINT `fk_travel_cards_journeys` FOREIGN KEY (`journey_id`)
        REFERENCES `journeys` (`id`)
);