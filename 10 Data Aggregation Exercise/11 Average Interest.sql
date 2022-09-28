/*
11.	Average Interest 
Mr. Bodrog is highly interested in profitability. He wants to know the average interest of all deposits groups split by whether the deposit has expired or not. But that's not all. He wants you to select deposits with start date after 01/01/1985. Order the data descending by Deposit Group and ascending by Expiration Flag.
Example:
deposit_group	is_deposit_expired	average_interest
Venomous Tongue	0	16.698947
Venomous Tongue	1	13.147500
Troll Chest	0	21.623571
*/

SELECT 
    `deposit_group`,
    `is_deposit_expired`,
    AVG(`deposit_interest`) AS 'average_interest'
FROM
    `wizzard_deposits`
WHERE
    `deposit_start_date` > '1985-01-01'
GROUP BY `deposit_group` , `is_deposit_expired`
ORDER BY `deposit_group` DESC , `is_deposit_expired`;