/*
9.	Full information of courses

The headquarters want us to make a query that shows the complete information about all courses in the database. The information that they need is the address, if the course is made in the Day (between 6 and 20(inclusive both)) or in the Night (between 21 and 5(inclusive both)), the bill of the course, the full name of the client, the car maker, the model and the name of the category.
Order the results by course id.

Required Columns
•	name (address)
•	day_time
•	bill
•	full_name (client)
•	make
•	model
•	category_name (category)

Example
name	day_time	bill	full_name	make	model	category_name
2 Del Mar Park	Night	46.92	Randie Cridge	Mitsubishi	Galant	Hatchback
24402 Warner Place	Day	14.47	Henrik Sivyer	Lincoln	MKT	Hatchback
80678 Green Ridge Court	Day	44.01	Randie Cridge	Isuzu	Rodeo Sport	Cabrio
…	…	…	…	…	…	…
34 Briar Crest Crossing	Night	14.86	Georges Lanston	Isuzu	Rodeo Sport	Cabrio
86462 Buena Vista Point	Day	16.06	Jefferson Montacute	Buick	Hearse	Coupe
*/

SELECT 
    `a`.`name`,
    -- IF(HOUR(co.`start`) BETWEEN 6 AND 20, 'Day', 'Night') AS 'day_time'
    (CASE
        WHEN (HOUR(`co`.`start`) >= 21) THEN 'Night'
        WHEN (HOUR(`co`.`start`) <= 5) THEN 'Night'
        ELSE 'Day'
    END) AS 'day_time',
    `co`.`bill`,
    `cl`.`full_name`,
    `car`.`make`,
    `car`.`model`,
    `cat`.`name` AS 'category_name'
FROM
    `clients` AS `cl`
        JOIN
    `courses` AS `co` ON `co`.`client_id` = `cl`.`id`
        JOIN
    `addresses` AS `a` ON `a`.`id` = `co`.`from_address_id`
        JOIN
    `cars` AS `car` ON `car`.`id` = `co`.`car_id`
        JOIN
    `categories` AS `cat` ON `cat`.`id` = `car`.`category_id`
ORDER BY `co`.`id`;