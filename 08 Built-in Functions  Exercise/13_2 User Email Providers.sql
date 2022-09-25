/*
13.	 User Email Providers
Find information about the email providers of all users. Display the user_name and the email provider. Sort the results by email provider alphabetically, then by username. Submit your query statements as Prepare DB & run queries.
Example
user_name	email provider
Pesho	abv.bg
monoxidecos	astonrasuna.com
bashsassafras	balibless.com
…	…
*/

SELECT 
    `user_name`,
    SUBSTRING(`email`,
        LOCATE('@', `email`) + 1) AS 'email provider'
FROM
    `users`
ORDER BY `email provider` , `user_name`;