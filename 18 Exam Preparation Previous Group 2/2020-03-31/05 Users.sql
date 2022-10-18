/*
05.	Users
Extract from the Insta Database (instd), info about all the users. 
Order the results by age descending then by username ascending.
Required Columns
•	username
•	gender
•	age

Example
username		gender	age
chartfordz	M	100
mcaygill1d	F	100
mgethingq	M	99
…	…	…
*/

SELECT 
    `username`, `gender`, `age`
FROM
    `users`
ORDER BY `age` DESC , `username`;