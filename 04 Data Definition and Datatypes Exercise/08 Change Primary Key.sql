/*
8.	Change Primary Key
Using SQL queries modify table users from the previous task. First remove current primary key then create new primary key that would be combination of fields id and username. The initial primary key name on id is pk_users. Submit your query in Judge as Run skeleton, run queries & check DB
*/

USE `data`;
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD PRIMARY KEY pk_users (`id`, `username`);