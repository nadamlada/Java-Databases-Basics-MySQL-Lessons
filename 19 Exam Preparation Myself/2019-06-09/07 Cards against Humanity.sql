/*
07.	Cards against Humanity
Extract from the database, all of the cards, and the clients that own them, so that they end up in the following format:
{card_number} : {full_name}
Order the results descending by card id.
Required Columns
•	id (cards)
•	card_token

Example
id	card_token
500	SM80 M775 4918 653X : Erin Cullingworth
...	...
*/

SELECT 
    `ca`.`id`,
    CONCAT(`ca`.`card_number`,
            ' : ',
            `cl`.`full_name`) AS 'card_token'
FROM
    `clients` AS `cl`
        JOIN
    `bank_accounts` AS `b` ON `b`.`client_id` = `cl`.`id`
        JOIN
    `cards` AS `ca` ON `ca`.`bank_account_id` = `b`.`id`
ORDER BY `ca`.`id` DESC;