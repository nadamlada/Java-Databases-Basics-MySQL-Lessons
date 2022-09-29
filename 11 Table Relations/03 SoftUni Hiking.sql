/*
3.	SoftUni Hiking
Get information about the hiking routes – starting point and ending point, and their leaders – name and id. Submit your queries using the "MySQL prepare DB and Run Queries" strategy.
Example
route_starting_point	route_ending_point	leader_id	leader_name
Hotel Malyovitsa	Malyovitsa Peak	3	RoYaL Yonkov
Hotel Malyovitsa	Malyovitsa Hut	3	RoYaL Yonkov
Ribni Ezera Hut	Rila Monastery	3	RoYaL Yonkov
Borovets	Musala Peak	4	Ivan Ivanov
*/

   SELECT 
    r.`starting_point` AS 'route_starting_point',
    r.`end_point` AS 'route_ending_point',
    r.`leader_id`,
    CONCAT(c.`first_name`, ' ', c.`last_name`) AS 'leader_name'
FROM
    `routes` AS r
        JOIN
    `campers` AS c ON r.`leader_id` = c.`id`;