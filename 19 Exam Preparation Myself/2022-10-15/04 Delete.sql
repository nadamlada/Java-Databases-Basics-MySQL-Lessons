/*
04.	Delete
Delete all waiters, who don't have any orders.
*/

DELETE `w`
FROM `waiters` AS `w`
        LEFT JOIN
    `orders` AS `o` ON `o`.`waiter_id` = `w`.`id`
WHERE `o`.`waiter_id` IS NULL;