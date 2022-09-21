/*
05. Find Email Address of Each Employee 
Write a SQL query to find the email address of each employee. (by his first and last name). Consider that the email domain is softuni.bg. Emails should look like "John.Doe@softuni.bg". The produced column should be named "full_ email_address".  Submit your query statements as Prepare DB & run queries. 
Example 
full_email_address 
Guy.Gilbert@softuni.bg 
Kevin.Brown@softuni.bg 
Roberto.Tamburello@softuni.bg 
… 
*/

SELECT 
    CONCAT(`first_name`,
            '.',
            `last_name`,
            '@softuni.bg') AS `full_ email_address`
FROM
    `employees`;
