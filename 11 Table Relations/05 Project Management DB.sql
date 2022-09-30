/*
5.	 Project Management DB*
Write a query to create a project management db according to the following E/R Diagram:
*/

CREATE DATABASE `newdata`;
USE `newdata`;

CREATE TABLE `clients` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `client_name` VARCHAR(100)
);

CREATE TABLE `projects` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`client_id` INT,
    `project_leader_id` INT
);

CREATE TABLE `employees` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(30),
    `last_name` VARCHAR(30),
    `project_id` INT
);

ALTER TABLE `projects`
ADD CONSTRAINT `fk_projects_clients`
FOREIGN KEY (`client_id`)
REFERENCES `clients`(`id`),
ADD CONSTRAINT `fk_projects_employees`
FOREIGN KEY(`project_leader_id`)
REFERENCES `employees`(`id`);

ALTER TABLE `employees`
ADD CONSTRAINT `fk_employees_projects`
FOREIGN KEY (`project_id`)
REFERENCES `projects`(`id`);