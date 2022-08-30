/*
09.	Availability
There are a lot of people waiting to have a dinner in the restaurant. You can help the waiters by checking the available tables in restaurant_db.
Write a query that returns the table_id, capacity, count_clients  and availability of all tables from the 1st floor. Count_clients is the number of people from all orders that are sitting on that table. Availability is based on how many people are sitting and the capacity of the table. If the capacity is greater than count_clients than it should be "Free seats", if the capacity is equal to the count_clients it should be "Full", and if the capacity is lower than the count_clients it should be "Extra seats".
Order the results descending by table_id. 
Required Columns
•	table_id
•	capacity
•	count_clients (is the number of people from all orders that are sitting on that table)
•	availability (based on how many people are sitting and the capacity of the table)
Example
table_id	capacity	count_clients	availability
29	5	5	Full
18	6	6	Full
13	9	6	Free seats
…	…	…	…
2	10	19	Extra seats
*/

SELECT 
    `t`.`id` AS 'table_id',
    `t`.`capacity`,
    COUNT(`oc`.`order_id`) AS 'count_clients',
    CASE
        WHEN (`t`.`capacity` > COUNT(`oc`.`order_id`)) THEN 'Free seats'
        WHEN (`t`.`capacity` = COUNT(`oc`.`order_id`)) THEN 'Full'
        ELSE 'Extra seats'
    END AS 'availability'
FROM
    `tables` AS `t`
        JOIN
    `orders` AS `o` ON `o`.`table_id` = `t`.`id`
        JOIN
    `orders_clients` AS `oc` ON `oc`.`order_id` = `o`.`id`
WHERE
    `t`.`floor` = 1
GROUP BY `t`.`id`
ORDER BY `t`.`id` DESC;