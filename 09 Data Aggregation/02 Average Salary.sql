/*
2.	Average Salary
Write a query to calculate the average salary in each department. Order the information by department_id. Round the salary result to two digits after the decimal point. Submit your queries with the MySQL prepare DB & run queries strategy.
Example
department_id	Average Salary
1	2050
2	1090
3	736.67
*/

SELECT 
    `department_id`, ROUND(AVG(`salary`), 2)
FROM
    `employees`
GROUP BY `department_id`
ORDER BY `department_id`;