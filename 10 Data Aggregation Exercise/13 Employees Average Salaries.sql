/*
13.	Employees Average Salaries
Select all high paid employees who earn more than 30000 into a new table. Then deselect all high paid employees who have manager_id = 42 from the new table. Then increase the salaries of all high paid employees with department_id = 1 with 5000 in the new table. Finally, select the average salaries in each department from the new table. Sort result by department_id in increasing order.
Example:
department_id	avg_salary
1	45166.66666667
…	…
*/

SELECT `department_id`,
    IF(`department_id` = 1,
        AVG(`salary` + 5000),
        AVG(`salary`)) AS 'avg_salary' FROM
    `employees`
WHERE
    `salary` > 30000 AND `manager_id` != 42 
GROUP BY `department_id`
ORDER BY `department_id`;