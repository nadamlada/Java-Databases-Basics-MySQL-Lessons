/*
07.	Movie casting
Some actors are free and can apply the casting for a new movie. You must search for them and prepare their documents.
Write a query that returns:  full name, email, age and height for all actors that are not participating in a movie.
To find their email you must take their last name reversed followed by the number of characters of their last name and then the casting email “@cast.com”
Order by height in ascending order.
Required Columns
•	full_name (first_name + " " + last_name)
•	email (last_name reversed + number of characters from the last_name + @cast.com)
•	age (2022 – the year of the birth)
•	height
Example
full_name	email	age	height
Hube Miranda	adnariM7@cast.com	35	155
Charlotte Eyres	seryE5@cast.com	55	156
…	…	…	…
Connie Mackneis	sienkcaM8@cast.com	27	184
*/

SELECT 
    CONCAT(`a`.`first_name`, ' ', `a`.`last_name`) AS 'full_name',
    CONCAT(REVERSE(`a`.`last_name`),
            CHAR_LENGTH(`a`.`last_name`),
            '@cast.com') AS 'email',
    2022 - YEAR(`a`.`birthdate`) AS 'age',
    `a`.`height`
FROM
    `actors` AS `a`
        LEFT JOIN
    `movies_actors` AS `ma` ON `ma`.`actor_id` = `a`.`id`
WHERE
    `ma`.`actor_id` IS NULL
ORDER BY `height`;