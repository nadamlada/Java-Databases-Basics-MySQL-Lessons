/*
5.	 Deposits Sum
Select all deposit groups and its total deposit sum. Sort result by total_sum in increasing order.
Example:
deposit_group	total_sum
Blue Phoenix	819598.73
…	…
*/

SELECT 
    `deposit_group`, SUM(`deposit_amount`) AS 'total_sum'
FROM
    `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `total_sum`;