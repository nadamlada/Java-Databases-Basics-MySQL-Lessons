/*
06.	Extract all military journeys
Extract from the database, all Military journeys. Sort the results ascending by journey start.

Required Columns
•	id
•	journey_start
•	journey_end
Example
id	journey_start	journey_end
7	2019-01-04 23:44:40	2049-12-09 04:00:54
3	2019-02-21 22:06:34	2049-01-03 11:00:22
...	...	... 
*/

SELECT
	`id`,
    `journey_start`,
    `journey_end`
FROM
	`journeys`
WHERE `purpose` LIKE 'Military'
ORDER BY `journey_start`;