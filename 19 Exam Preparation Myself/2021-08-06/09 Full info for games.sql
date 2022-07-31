/*
9.	Full info for games

Our managers want to monitor all games that don’t have a release date nor a category. They want us to create a query, which shows the main information about the games. The information that they need is the name of the game, the name of the team, the name of the address and if the budget is less than 50000. If it is, we need to display 'Normal budget'. If it doesn’t - 'Insufficient budget'. 
Finally, we should order the result by the name of the game.

Required Columns
•	name (of the game)
•	budget_level
•	team_name
•	address_name 

Example 
name	budget_level	team_name	address_name 
Bitwolf 2	Normal budget	Flatley Group	49099 Manitowish Court
Lotlux	Insufficient budget	Boyer, Stamm and Schinner	263 Glendale Lane
Mat Lam Tam 3	Normal budget	McLaughlin	88229 Norway Maple Court
Regrant	Normal budget	O'Kon-Mosciski	3569 Canary Lane
Stringtough 2	Insufficient budget	Hoeger Group	49099 Manitowish Court
Tin 2	Insufficient budget	Dibbert	5 Sunbrook Point
*/

SELECT 
    `g`.`name`,
    IF(`g`.`budget` < 50000,
        'Normal budget',
        'Insufficient budget') AS 'budget_level',
    `t`.`name` AS 'team_name',
    `a`.`name` AS 'address_name'
FROM
    `games` AS `g`
        LEFT JOIN
    `games_categories` AS `gc` ON `gc`.`game_id` = `g`.`id`
        LEFT JOIN
    `teams` AS `t` ON `t`.`id` = `g`.`team_id`
        LEFT JOIN
    `offices` AS `o` ON `o`.`id` = `t`.`office_id`
        LEFT JOIN
    `addresses` AS `a` ON `a`.`id` = `o`.`address_id`
WHERE
    `g`.`release_date` IS NULL
        AND `gc`.`category_id` IS NULL
ORDER BY `g`.`name`;