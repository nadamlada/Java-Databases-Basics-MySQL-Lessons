/*
7.	Number of courses for each car
Extract from the database all the cars and the count of their courses. Also display the average bill of each course by the car, rounded to the second digit.
Order the results descending by the count of courses, then by the car’s id. 
Skip the cars with exactly 2 courses.
Required Columns
•	car_id
•	make
•	mileage
•	count_of_courses
•	avg_bill

Example
car_id	make	mileage	count_of_courses	avg_bill
13	Mercedes-Benz	846549	4	26.95
80	Lincoln	711184	4	22.39
1	Land Rover	550259	3	14.71
	…	…	…	…
89	Pontiac	890015	0	NULL
90	Mercedes-Benz	6482	0	NULL
95	Land Rover	176967	0	NULL
*/

SELECT 
    `ca`.`id` AS 'car_id',
    `ca`.`make`,
    `ca`.`mileage`,
    COUNT(`co`.`id`) AS 'count_of_courses',
    ROUND(AVG(`co`.`bill`), 2) AS 'avg_bill'
FROM
    `cars` AS `ca`
        LEFT JOIN
    `courses` AS `co` ON `co`.`car_id` = `ca`.`id`
GROUP BY `ca`.`id`
HAVING `count_of_courses` <> 2
ORDER BY `count_of_courses` DESC , `car_id`;