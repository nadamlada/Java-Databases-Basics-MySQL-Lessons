/*
17. Distinct Job Titles 
Write a SQL query to find all distinct job titles. Sort the result by job title alphabetically. Submit your query statements as Prepare DB & run queries. 
Example 
job_title 
Accountant 
Accounts Manager 
Accounts Payable Specialist 
… 
*/

SELECT DISTINCT
    `job_title`
FROM
    `employees`
ORDER BY `job_title`;