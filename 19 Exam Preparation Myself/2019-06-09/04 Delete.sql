/*
04.	Delete
R.U.K. Bank is a sophisticated network. As such, it cannot allow procrastination and lazy behavior. 
Delete all employees which do not have any clients. 
*/

DELETE `e` FROM `employees` AS `e`
       LEFT JOIN
    `employees_clients` AS `ec` ON `ec`.`employee_id` = `e`.`id` 
WHERE
    `ec`.`client_id` IS NULL;