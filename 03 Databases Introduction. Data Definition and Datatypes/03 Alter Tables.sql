/*
3. Alter Tables
Altering the tables is done via the "ALTER TABLE" clause. Add a new column – "middle_name" to the "employees" table. 
*/

USE `gamebar`;
ALTER TABLE `employees`
ADD COLUMN `middle_name` VARCHAR(100);