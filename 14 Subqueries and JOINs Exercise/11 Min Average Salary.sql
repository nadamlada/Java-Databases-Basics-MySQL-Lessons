/*
11.	Min Average Salary
Write a query that returns the value of the lowest average salary of all departments.

Example:
min_average_salary
10866.6666
*/

SELECT 
    AVG(`e`.`salary`) AS 'min_average_salary'
FROM
    `employees` AS `e`
GROUP BY `e`.`department_id`
ORDER BY `min_average_salary`
LIMIT 1;