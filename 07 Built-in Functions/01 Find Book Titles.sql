/*
1.	Find Book Titles
Write a SQL query to find books which titles start with "The". Order the result by id. Submit your query statements as Prepare DB & run queries. 
Example
title
The Mysterious Affair at Styles
The Big Four
The Murder at the Vicarage
The Mystery of the Blue Train
The Ring
…
*/

SELECT 
    `title`
FROM
    `books`
WHERE
-- от първия символ включително, с дължина три общо
    SUBSTRING(`title`, 1, 3) =  'The';