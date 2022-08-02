/*
05.	Clients
Extract from the database, all of the clients. 
Order the results ascending by client id.
Required Columns
•	id (clients)
•	full_name

Example
id	full_name
1	Hunter Wesgate
...	...
*/

SELECT 
    `id`, `full_name`
FROM
    `clients`
ORDER BY `id`;