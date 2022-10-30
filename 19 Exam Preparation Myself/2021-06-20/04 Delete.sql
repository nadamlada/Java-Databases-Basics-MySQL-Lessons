/*
4.	Delete
Some of the clients have not used the services of our company recently, so we need to remove them 
from the database.	
Delete all clients from clients table, that do not have any courses and the count of the characters in the full_name is more than 3 characters. 
*/

DELETE `cl`
FROM
    `courses` AS `co`
        RIGHT JOIN
    `clients` AS `cl` ON `cl`.`id` = `co`.`client_id`
WHERE `co`.`client_id` IS NULL
AND CHAR_LENGTH(`cl`.`full_name`) > 3;