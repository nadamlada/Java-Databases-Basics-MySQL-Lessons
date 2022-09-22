/*
4.	Days Lived
Write a SQL query to calculate the days that an author lived. Your query should return:
•	Full Name – the full name of the author.
•	Days Lived – days that he/she lived. NULL values mean that the author is still alive.
Submit your query statements as Prepare DB & run queries. 
Example
Full Name	Days Lived
Agatha Christie	31164
William Shakespeare	18990
Danielle Schuelein-Steel	(NULL)
Joanne Rowling	(NULL)
Lev Tolstoy	30021
Paulo Souza	(NULL)
Stephen King	(NULL)
John Tolkien	29827
Erika Mitchell	(NULL)
*/

SELECT 
    CONCAT_WS(' ',
            `first_name`,
            `last_name`) AS 'Full Name',
    TIMESTAMPDIFF(DAY, `born`, `died`) AS 'Days Lived'
FROM
    `authors`;  