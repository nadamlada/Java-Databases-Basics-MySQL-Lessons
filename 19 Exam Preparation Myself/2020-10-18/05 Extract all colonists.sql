/*
05 Extract all colonists
Extract from the database, all colonists. Sort the results by first name, them by last name, and finally by id in ascending order.

Required Columns
•	id
•	full_name(first_name + last_name separated by a single space)
•	ucn

Example
id	full_name	ucn
35	Aigneis McConville	9225403496
92	Althea Kelinge	9998159318
...	...	...
*/

SELECT 
    `id`,
    CONCAT(`first_name`, ' ', `last_name`) AS 'full_name',
    `ucn`
FROM
    `colonists`
ORDER BY `first_name` , `last_name` , `id`;
