/*
3.	Employees Without Managers
Write a query to get information about employee_id, first_name, last_name, department_id and salary for all employees who don't have a manager. Submit your queries using the "MySQL prepare DB and Run Queries" strategy.

Example

employee_id	first_name	last_name	department_id	salary
109	Ken	Sanchez	16	125 500
291	Svetlin	Nakov	6	48 000
292	Martin	Kulov	6	48 000
293	George	Denchev	6	48 000
*/

SELECT 
    `employee_id`,
    `first_name`,
    `last_name`,
    `department_id`,
    `salary`
FROM
    `employees`
WHERE
    `manager_id` IS NULL;