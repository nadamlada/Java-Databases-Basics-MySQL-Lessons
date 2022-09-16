/*
2.	Alter Minions Table
Before continuing with the next assignments, rename the town_id to id using Workbench's GUI.
Do not submit this query on the Judge System.
Change the structure of the Minions table to have new column town_id that would be of the same type as the id column of towns table. Add new constraint that makes town_id foreign key and references to id column of towns table. Submit your create table query in Judge as MySQL run skeleton, run queries & check DB
*/

USE `minions`;
ALTER TABLE `minions`
ADD COLUMN `town_id` INT NOT NULL,
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY (`town_id`)
REFERENCES `towns` (`id`); 