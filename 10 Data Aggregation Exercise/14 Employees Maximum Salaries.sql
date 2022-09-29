/*
14. Employees Maximum Salaries
Find the max salary for each department. Filter those which have max salaries not in the range 30000 and 70000. Sort result by department_id in increasing order.
Example:
department_id	max_salary
2	29800.00
…	…
*/

SELECT 
    `department_id`, MAX(`salary`) AS 'max_salary'
FROM
    `employees`
GROUP BY `department_id`
HAVING NOT `max_salary` BETWEEN 30000 AND 70000
ORDER BY `department_id`;