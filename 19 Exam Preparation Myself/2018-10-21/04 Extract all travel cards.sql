/*
4.Extract all travel cards
Extract from the database, all travel cards. Sort the results by card number ascending.
Required Columns
•	card_number
•	job_during_journey

Example
card_number	job_during_journey
0032031181	Engineer
0037637193	Engineer
...	...
*/

SELECT 
    `card_number`, `job_during_journey`
FROM
    `travel_cards`
ORDER BY `card_number` ASC;