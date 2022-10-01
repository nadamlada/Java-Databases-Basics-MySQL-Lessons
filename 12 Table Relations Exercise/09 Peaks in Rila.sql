/*
9.	Peaks in Rila
Display all peaks for "Rila" mountain_range. Include:
•	mountain_range
•	peak_name
•	peak_elevation
Peaks should be sorted by peak_elevation descending.

Example
mountain_range	peak_name	peak_elevation
Rila	Musala	2925
…	…	…

Submit your queries by using "MySQL prepare DB & run queries" strategy.
*/

SELECT 
    `mountain_range`, `peak_name`, `elevation`
FROM
    `mountains` AS m
        JOIN
    `peaks` AS p ON p.`mountain_id` = m.`id`
WHERE
    m.`mountain_range` = 'Rila'
ORDER BY p.`elevation` DESC;