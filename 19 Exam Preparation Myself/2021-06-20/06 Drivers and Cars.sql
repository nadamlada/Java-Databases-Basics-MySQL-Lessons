/*
6.	Drivers and Cars
Now, we need a more detailed information about drivers and their cars.
Select all drivers and cars that they drive. Extract the driver’s first and last name from the drivers table and the make, the model and the mileage from the cars table. Order the result by the mileage in descending order, then by the first name alphabetically. 
Skip all cars that have NULL as a value for the mileage.

Required Columns
•	first_name
•	last_name 
•	make
•	model
•	mileage

Example
first_name	last_name	make	model	mileage
Edna	Heatley	Pontiac	Trans Sport	967608
Delaney	Stove	Pontiac	Fiero	959778
Cristi	Ravenshear	Maserati	GranTurismo	954606
…	…	…	…	…
Ailina	Sebyer	Mercedes-Benz	G-Class	6482
Gerhard	Alderson	Mercedes-Benz	G-Class	6482
*/

SELECT 
    `d`.`first_name`,
    `d`.`last_name`,
    `c`.`make`,
    `c`.`model`,
    `c`.`mileage`
FROM
    `drivers` AS `d`
        LEFT JOIN
    `cars_drivers` AS `cd` ON `cd`.`driver_id` = `d`.`id`
        LEFT JOIN
    `cars` AS `c` ON `c`.`id` = `cd`.`car_id`
WHERE
    `c`.`mileage` IS NOT NULL
ORDER BY `c`.`mileage` DESC , `d`.`first_name`;  