/*
3.	Update
After a good work in recent months, management has decided to raise the salaries of all young team leaders.
Update all young employees (only team leaders) with age under 40(exclusive) and increase their salary with 1000. 
Skip the employees with salary over 5000(inclusive). Their salaries are already high.
*/

UPDATE `employees` AS `e`
JOIN `teams` AS `t` ON `e`.`id` = `t`.`leader_id`
SET `salary` = `salary` + 1000
WHERE `e`.`age` < 40
AND `e`.`salary` < 5000;