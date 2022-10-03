/*
4.	Higher Salary

Write a query to count the number of employees who receive salary higher than the average. Submit your queries using the "MySQL prepare DB and Run Queries" strategy.

Example
count
88
*/

SELECT 
    COUNT(*)
FROM
    `employees` AS `e`
WHERE
    `e`.`salary` > (SELECT 
            AVG(`e1`.`salary`)
        FROM
            `employees` AS `e1`);