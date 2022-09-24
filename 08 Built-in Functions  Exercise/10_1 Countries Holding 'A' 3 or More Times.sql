/*
10.	Countries Holding 'A' 3 or More Times
Find all countries that hold the letter 'A' in their name at least 3 times (case insensitively), sorted by ISO code. Display the country name and the ISO code. Submit your query statements as Prepare DB & run queries.
Example
country_name	iso_code
Afghanistan	AFG
Albania	ALB
…	…
*/

SELECT 
    `country_name`, `iso_code`
FROM
    `countries`
WHERE
    (CHAR_LENGTH(`country_name`) - CHAR_LENGTH(REPLACE(LOWER(`country_name`), 'a', ''))) >= 3
ORDER BY `iso_code`;