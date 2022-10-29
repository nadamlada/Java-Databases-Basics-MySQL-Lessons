/*
9.	Find all information of stores
The managers always want to know how the business goes. Now, they want from us to show all store names, but for security, the name must be in the reversed order.
Select the name of stores (in reverse order). 
After that, the full_address in format: {town name in upper case}-{address name}.
The next info is the count of employees, that work in the store.
Filter only the stores that have a one or more employees.
Order the results by the full_address in ascending order.

Required Columns
•	reversed_name (store name) 
•	full_address (full_address)
•	employees_count

Example
reversed_name	full_address	employees_count
dlohgnortS	BLAGOEVGRAD-32759 Dwight Plaza	3
mabouD	BLAGOEVGRAD-35952 Stoughton Circle	1
focsnarT	BURGAS-07 Armistice Parkway	2
…	…	…
draugdraC	VIDIN-61346 Melody Lane	3
*/

SELECT 
    REVERSE(`s`.`name`) AS 'reversed_name',
    CONCAT(UPPER(`t`.`name`), '-', `a`.`name`) AS 'full_address',
    COUNT(`e`.`id`) AS 'employees_count'
FROM
    `employees` AS `e`
        JOIN
    `stores` AS `s` ON `s`.`id` = `e`.`store_id`
        JOIN
    `addresses` AS `a` ON `a`.`id` = `s`.`address_id`
        JOIN
    `towns` AS `t` ON `t`.`id` = `a`.`town_id`
GROUP BY `s`.`id`
HAVING `employees_count` >= 1
ORDER BY `full_address`;