/*
8.	Games of 2022
Now, we need to find all interesting upcoming games.
Extract from the database all games that are being released in the year 2022. Also, the month must be even. We need only the first game sequel (ends with '…2'). We need the information of the game name, the game release date, a short summary (only the first 10 characters + '…') and the name of the team.
At last, a column ‘Quarters’ depends on the month of the release date:
•	January, February, and March (Q1)
•	April, May, and June (Q2)
•	July, August, and September (Q3)
•	October, November, and December (Q4)

Order by Quarters.

Required Columns
•	name (of the game)
o	 only the first sequel
	 Ends with '...2'
	 Voyatouch 2 -> Valid
	 Voyatouch 3 -> Invalid
•	release_date
o	 only even months
•	summary
o	 the first 10 characters + '...'
•	quarter
o	 Depends on the month
•	team_name (name of the team)

Example
name	release_date	summary	quarter	team_name
Y-Solowarm 2	2022-02-28	In hac hab...	Q1	Jenkins-Kiehn
Mat Lam Tam 2	2022-08-21	Proin leo ...	Q3	Roob, Mann and Goldner
Voyatouch 2	2022-12-26	In sagitti...	Q4	Weissnat-Wolf
*/

SELECT 
    `g`.`name`,
    `g`.`release_date`,
    CONCAT(SUBSTR(`g`.`description`, 1, 10), '...') AS 'summary',
    (CASE
        WHEN (MONTH(`g`.`release_date`) IN (1 , 2, 3)) THEN 'Q1'
        WHEN (MONTH(`g`.`release_date`) IN (4 , 5, 6)) THEN 'Q2'
        WHEN (MONTH(`g`.`release_date`) IN (7 , 8, 9)) THEN 'Q3'
        ELSE 'Q4'
    END) AS 'quarter',
    `t`.name
FROM
    `games` AS `g`
        JOIN
    `teams` AS `t` ON `t`.`id` = `g`.`team_id`
WHERE
    YEAR(`g`.`release_date`) = '2022'
        AND MONTH(`g`.`release_date`) % 2 = 0
        AND `g`.`name` LIKE '%2'
ORDER BY `quarter`;