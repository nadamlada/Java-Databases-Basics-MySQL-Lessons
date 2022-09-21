/*
18. Find First 10 Started Projects 
Write a SQL query to find first 10 started projects. Select all information about them and sort them by start date, then by name. Sort the information by id.  Submit your query statements as Prepare DB & run queries. 
Example 
id 	name 	description 	start_date 	end_date 
6 	HL Road Frame 	Research, design and development of HL Road … 	1998-05-02 
00:00:00 	2003-06-01 
00:00:00 
2 	Cycling Cap 	Research, design and development of C… 	2001-06-01 
00:00:00 	2003-06-01 
00:00:00 
5 	HL Mountain Frame 	Research, design and development of HL M… 	2001-06-01 
00:00:00 	2003-06-01 
00:00:00 
… 	… 	… 	… 	… 
*/

SELECT 
    *
FROM
    `projects`
ORDER BY `start_date` , `name` , `project_id`
LIMIT 10;