/*
3.	Update
Update all coaches, who train one or more players and their first_name starts with ‘A’. Increase their level with 1.
*/

UPDATE `coaches` AS `c`
SET 
    `c`.`coach_level` = `c`.`coach_level` + 1
WHERE
    `c`.`first_name` LIKE ('A%')
        AND (SELECT 
            COUNT(*)
        FROM
            `players_coaches` AS `pc`
        WHERE
           `pc`.`coach_id` = `c`.`id`) >= 1;
