/*
1.	 Records' Count
Import the database and send the total count of records to Mr. Bodrog. Make sure nothing got lost.
Example:
count
162
*/

SELECT
    COUNT(`id`) AS 'count'
FROM
    `wizzard_deposits`;