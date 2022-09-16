/*
15.	Basic Select All Fields and Order Them
Modify queries from previous problem by sorting:
•	towns - alphabetically by name
•	departments - alphabetically by name
•	employees - descending by salary
Submit your query statements as Prepare DB & Run queries.
*/

USE `soft_uni`;
SELECT * FROM `towns`
ORDER BY `name`;

SELECT * FROM `departments`
ORDER BY `name`;

SELECT * FROM `employees`
-- sort in descening order
ORDER BY `salary` DESC;