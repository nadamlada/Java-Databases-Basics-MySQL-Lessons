/*
09.	Rating system
From the database extract the title, rating, subtitles, and the budget of movies. If the rating is equal or less than 4 the user must see “poor”, above 4 and less or equal to 7 “good” and above that it should display “excellent”. If the movie has subtitles the user should see “english”, otherwise “-“.
Order the results descending by budget. 
Required Columns
•	title
•	rating (less or equal to 4 – “poor”, above 4 and less or equal to 7 – “good”, above 7 – “excellent”)
•	subtitles (if it has subtitles it– “english”, otherwise – “-“)
•	budget

Example	
title	rating	subtitles	budget
Metsän tarina	good	english	499981.78
Family Secrets (Familjehemligheter)	poor	-	497338.13
Place in the Sun, A (En plats i solen)	excellent	english	496586.35
. . .	. . .	. . .	. . .
Saban, Son of Saban	good	-	21027.33
*/

 SELECT 
    `m`.`title`,
    CASE
        WHEN `mm`.`rating` <= 4 THEN 'poor'
        WHEN `mm`.`rating` <= 7 THEN 'good'
        WHEN `mm`.`rating` > 7 THEN 'excellent'
    END AS 'rating',
    IF(`mm`.`has_subtitles` = 0,
        '-',
        'english') AS 'subtitles',
    `mm`.`budget`
FROM
    `movies` AS `m`
        JOIN
    `movies_additional_info` AS `mm` USING (`id`)
ORDER BY `mm`.`budget` DESC;