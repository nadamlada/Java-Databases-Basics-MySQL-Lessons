/*
7.	Detail info for all teams
Extract from the database all of the teams and the count of the players that they have.
Order the results descending by count of players, then by fan_base descending. 
Required Columns
•	team_name
•	established
•	fan_base
•	count_of_players

Example
team_name	established	fan_base	players_count
Ailane	1963-08-20	6711237100133852778 	10
Ntags	1981-06-05	3508984270641351110	9
Skyble	1953-11-14	5381600486852672412	8
…	…	…	…
Miboo	1971-08-02	30087062078800256	0
*/

SELECT 
    `t`.`name` AS 'team_name',
    `t`.`established` AS 'established',
    `t`.`fan_base` AS 'fan_base',
    (SELECT 
            COUNT(*)
        FROM
            `players` AS `p`
        WHERE
            `p`.`team_id` = `t`.`id`) AS 'players_count'
FROM
    `teams` AS `t`
ORDER BY `players_count` DESC , `t`.`fan_base` DESC;