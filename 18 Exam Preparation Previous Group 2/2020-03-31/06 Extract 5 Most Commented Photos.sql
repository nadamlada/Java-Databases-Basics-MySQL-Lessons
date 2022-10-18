/*
06.	Extract 5 Most Commented Photos
Extract from the database, 5 most commented photos with their count of comments. Sort the results by commentsCount, descending, then by id in ascending order.

Required Columns
•	id
•	date_and_time
•	description
•	commentsCount

Example
id	date_and_time	description	commentsCount
23	2019-10-13 14:13:42	Duis bibendum, felis sed interdum venenatis, turpis enim blandit …	4
25	2019-07-20 13:08:03	In congue. Etiam justo. Etiam pretium…	4
14	2020-02-16 13:49:08	Praesent blandit. Nam nulla. Integer pede justo…	3
…	…	…	…
*/

SELECT 
    `p`.`id`,
    `p`.`date` AS 'date_and_time',
    `p`.`description`,
    COUNT(`c`.`id`) AS 'commentsCount'
FROM
    `photos` AS `p`
        JOIN
    `comments` AS `c` ON `c`.`photo_id` = `p`.`id`
GROUP BY `p`.`id`
ORDER BY `commentsCount` DESC , `p`.`id`
LIMIT 5;