/*
18.	Departments Total Salaries
Create a query which shows the total sum of salaries for each department. Order by department_id.
Your query should return:	
•	department_id
Example:
department_id	total_salary
1	241000.00
…	…
*/

SELECT 
    `department_id`, SUM(`salary`) AS 'total_salary'
FROM
    `employees`
GROUP BY `department_id`
ORDER BY `department_id`;