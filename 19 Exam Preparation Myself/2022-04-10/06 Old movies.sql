/*
06.	Old movies
Write a query that returns: title, runtime, budget and release_date from table movies_additional_info. Filter movies which have been released from 1996 to 1999 year (inclusive).
Order the results ascending by runtime then by id and show only the first 20 results.
Required Columns
•	id
•	title
•	runtime
•	budget
•	release_date
Example
id	title	runtime	budget	release_date
251	Maniac	60	110495.27	1999-10-28
298	Ronin	60	447741.91	1997-07-25
103	Opfergang	62	481899.08	1999-09-02
…	…	…	…	…
*/

SELECT 
    `m`.`id`, `m`.`title`, `runtime`, `budget`, `release_date`
FROM
    `movies` AS `m`
        LEFT JOIN
    `movies_additional_info` AS `mm` ON `mm`.`id` = `m`.`id`
WHERE
    `mm`.`release_date` >= ('1996-01-01')
        AND `mm`.`release_date` <= ('1999-12-31')
ORDER BY `mm`.`runtime` , `mm`.`id`
LIMIT 20;