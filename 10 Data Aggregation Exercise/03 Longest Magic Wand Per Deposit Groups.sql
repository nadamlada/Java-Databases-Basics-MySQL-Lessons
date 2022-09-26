/*
3. Longest Magic Wand Per Deposit Groups
For wizards in each deposit group show the longest magic wand. Sort result by longest magic wand for each deposit group in increasing order, then by deposit_group alphabetically. Rename the new column appropriately.
Example:
deposit_group	longest_magic_wand
Human Pride	30
…	…
*/

SELECT 
    `deposit_group`,
    MAX(`magic_wand_size`) AS 'longest_magic_wand'
FROM
    `wizzard_deposits`
GROUP BY `deposit_group`
ORDER BY `longest_magic_wand` ASC, `deposit_group` ASC;