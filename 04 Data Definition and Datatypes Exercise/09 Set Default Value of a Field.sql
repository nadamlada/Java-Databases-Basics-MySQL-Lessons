/*
9.	Set Default Value of a Field
Using SQL queries modify table users. Make the default value of last_login_time field to be the current time. Submit your query in Judge as Run skeleton, run queries & check DB.
*/

USE `data`;

/*
ALTER COLUMN -- set or remove default value of column
CHANGE COLUMN -- rename, change type, move, resize
MODIFY COLUMN -- like change without remane
*/

ALTER TABLE `users`
MODIFY COLUMN `last_login_time`
DATETIME DEFAULT NOW();