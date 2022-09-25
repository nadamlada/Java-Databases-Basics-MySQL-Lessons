/*
14.	 Get Users with IP Address Like Pattern
Find the user_name and the ip_address for each user, sorted by user_name alphabetically. Display only the rows, where the ip_address matches the pattern: "___.1%.%.___". Submit your query statements as Prepare DB & run queries.
Example
user_name	ip_address
bindbawdy	192.157.20.222
evolvingimportant	223.175.227.173
inguinalself	255.111.250.207
*/

SELECT 
    `user_name`, `ip_address`
FROM
    `users`
WHERE
    `ip_address` LIKE '___.1%.%.___'
ORDER BY `user_name` ASC;