/*
2.	Replace Titles
Write a SQL query to find books which titles start with "The" and replace the substring with 3 asterisks. Retrieve data about the updated titles. Order the result by id. Submit your query statements as Prepare DB & run queries. 
Example
title
*** Mysterious Affair at Styles
*** Big Four
*** Murder at the Vicarage
*** Mystery of the Blue Train
*** Ring
*** Alchemist
*** Fifth Mountain
*** Zahir
*** Dead Zone
*** Hobbit
*** Adventures of Tom Bombadil
*/  

SELECT 
    REPLACE(`title`, 'The', '***') AS `title`
FROM
    `books`
WHERE
    SUBSTRING(`title`, 1, 3) = 'The';