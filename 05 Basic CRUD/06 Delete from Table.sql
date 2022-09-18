/*
Problem 6: Delete from Table
Write a query to delete all employees from the "employees" table who are in department 2 or 1. Then select all from table `employees` and order the information by id.
Example
id	First_name	Last_name	Job_title	Department_id	salary
3	Smith	Johnson	Porter	4	1100
6	Ivan	Petrov	Waiter	3	990
7	Jack	Jackson	Executive Chef	3	1800
9	Nikolay	Ivanov	Housekeeping	4	1600
*/

USE `hotel`;
DELETE FROM `employees` 
WHERE
    `department_id` = 1
    OR `department_id` = 2;

/*
DELETE FROM `employees` 
WHERE
    `department_id` IN (1 , 2);
*/

SELECT 
    *
FROM
    `employees`
ORDER BY `id`;
