/*
08.	Count Likes and Comments
Extract from the database, photos id with their likes and comments. Order them by count of likes descending, then by comments count descending and lastly by photo id ascending.

Required Columns
•	photo_id
•	likes_count
•	comments_count

Example
photo_id	likes_count	comments_count
1	4	2
58	4	1
69	4	0
…	…	…
*/

SELECT 
    `p`.`id` AS 'photo_id',
    COUNT(DISTINCT `l`.`id`) AS 'likes_count',
    COUNT(DISTINCT `c`.`id`) AS 'comments_count'
FROM
    `photos` AS `p`
        LEFT JOIN
    `comments` AS `c` ON `c`.`photo_id` = `p`.`id`
        LEFT JOIN
    `likes` AS `l` ON `l`.`photo_id` = `p`.`id`
GROUP BY `p`.`id`
ORDER BY `likes_count` DESC , `comments_count` DESC , `photo_id`;/*
08.	Count Likes and Comments
Extract from the database, photos id with their likes and comments. Order them by count of likes descending, then by comments count descending and lastly by photo id ascending.

Required Columns
•	photo_id
•	likes_count
•	comments_count

Example
photo_id	likes_count	comments_count
1	4	2
58	4	1
69	4	0
…	…	…
*/

SELECT 
    `p`.`id` AS 'photo_id',
    COUNT(DISTINCT `l`.`id`) AS 'likes_count',
    COUNT(DISTINCT `c`.`id`) AS 'comments_count'
FROM
    `photos` AS `p`
        LEFT JOIN
    `comments` AS `c` ON `c`.`photo_id` = `p`.`id`
        LEFT JOIN
    `likes` AS `l` ON `l`.`photo_id` = `p`.`id`
GROUP BY `p`.`id`
ORDER BY `likes_count` DESC , `comments_count` DESC , `photo_id`;