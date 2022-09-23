/*
5.	Harry Potter Books
Write a SQL query to retrieve titles of all the Harry Potter books. Order the information by id. Submit your query statements as Prepare DB & run queries. 
Example
title
Harry Potter and the Philosopher's Stone
Harry Potter and the Chamber of Secrets
Harry Potter and the Prisoner of Azkaban
…
*/

SELECT 
    `title`
FROM
    `books`
WHERE
    `title` LIKE 'Harry Potter%';