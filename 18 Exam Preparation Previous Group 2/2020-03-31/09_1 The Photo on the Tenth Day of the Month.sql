 /*
09.	The Photo on the Tenth Day of the Month

Extract from the database those photos that their upload day is 10 and summarize their description. The summary must be 30 symbols long plus "..." at the end. Order the results by date descending order. 

Required Columns
•	summary
•	date

Example
summary	date
Suspendisse potenti. In eleife...	2019-12-10 15:20:14
Quisque id justo sit amet sapi...	2019-10-10 08:58:52
Mauris enim leo, rhoncus sed, ...	2019-05-10 14:40:22
…	…
*/

SELECT 
    IF(CHAR_LENGTH(`description`) > 30,
        CONCAT(SUBSTRING(`description` FROM 1 FOR 30),
                '...'),
        `description`) AS 'summary',
    `date`
FROM
    `photos`
WHERE
    DAY(`date`) = 10
ORDER BY `date` DESC;