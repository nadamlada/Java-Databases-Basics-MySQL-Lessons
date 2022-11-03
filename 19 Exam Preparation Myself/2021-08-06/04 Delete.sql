/*
4.	Delete
After a lot of manipulations on our base, now we must clean up.
Delete all games from table games, which do not have a category and release date. 
*/

DELETE `g` FROM `games` AS `g`
        LEFT JOIN
    `games_categories` AS `gc` ON `gc`.`game_id` = `g`.`id` 
WHERE
    `gc`.`category_id` IS NULL
    AND `g`.`release_date` IS NULL;