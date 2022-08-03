/*
09.	Branch cards
Extract from the database, all branches with the count of their issued cards. Order the results by the count of cards, then by branch name.
Required Columns
•	name (branch)
•	count_of_cards

Example
name	count_of_cards
Becker Branch	93
Mifflin Branch	82
Mendota Branch	67
Moulton Branch	58
*/

SELECT 
    `br`.`name` AS 'name', COUNT(`c`.`id`) AS 'count_of_cards'
FROM
    `branches` AS `br`
        LEFT JOIN
    `employees` AS `e` ON `e`.`branch_id` = `br`.`id`
        LEFT JOIN
    `employees_clients` AS `ec` ON `ec`.`employee_id` = `e`.`id`
        LEFT JOIN
    `bank_accounts` AS `ba` ON `ba`.`client_id` = `ec`.`client_id`
        LEFT JOIN
    `cards` AS `c` ON `c`.`bank_account_id` = `ba`.`id`
GROUP BY `br`.`id`
ORDER BY `count_of_cards` DESC , `name`;