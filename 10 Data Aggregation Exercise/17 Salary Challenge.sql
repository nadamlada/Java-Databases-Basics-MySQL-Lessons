/*
17.	 Salary Challenge**
Write a query that returns:
•	first_name
•	last_name
•	department_id
for all employees who have salary higher than the average salary of their respective departments. Select only the first 10 rows. Order by department_id, employee_id.
Example:
first_name	last_name	department_id
Roberto	Tamburello	1
Terri	Duffy	1
Rob	Walters	2
…	…	...
*/

SELECT 
    e1.first_name, e1.last_name, e1.department_id
FROM
    employees AS e1
        JOIN
    (SELECT 
        e2.department_id, AVG(e2.salary) AS salary
    FROM
        employees AS e2
    GROUP BY e2.department_id) AS dep_avg ON e1.department_id = dep_avg.department_id
WHERE
    e1.salary > dep_avg.salary
ORDER BY e1.department_id , e1.employee_id
LIMIT 10; 