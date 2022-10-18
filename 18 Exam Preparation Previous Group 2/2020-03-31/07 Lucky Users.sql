/*
07.	Lucky Users
When the user has the same id as its photo, it is considered Lucky User. Extract from the database all lucky users. 
Extract id_username (concat id + " " + username) and email of all lucky users. Order the results ascending by user id.
Required Columns
•	id_username
•	email

Example
id_username	email
12 aroccob	dpendrichb@hhs.gov
…	…
*/

SELECT 
    CONCAT(`u`.`id`, ' ', `u`.`username`) AS 'id_username',
    `u`.`email`
FROM
    `users` AS `u`
        LEFT JOIN
    `users_photos` AS `up` ON `up`.`user_id` = `u`.`id`
WHERE
    `up`.`user_id` = `up`.`photo_id`
ORDER BY `up`.`user_id`;