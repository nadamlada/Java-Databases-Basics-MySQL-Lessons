/*
3.	Update
Update all employees that hire after 2003(exclusive) year and not work in store Cardguard and Veribet. 
Set their manager to be Carolyn Q Dyett (with id 3) and decrease salary with 500.
*/

UPDATE `employees` AS `e`
        JOIN
    `stores` AS `s` ON `s`.`id` = `e`.`store_id` 
SET 
    `e`.`manager_id` = '3',
	`e`.`salary` = `e`.`salary` - 500
WHERE
    YEAR(`e`.`hire_date`) > 2003
        AND `s`.`name` NOT LIKE 'Cardguard'
        AND `s`.`name` NOT LIKE 'Veribet';