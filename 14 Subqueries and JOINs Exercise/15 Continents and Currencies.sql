/*
15.	*Continents and Currencies
Write a query that selects:
•	continent_code
•	currency_code
•	currency_usage
Find all continents and their most used currency. Filter any currency that is used in only one country. Sort the result by continent_code and currency_code.

Example
continent_code	currency_code	currency_usage
AF	XOF	8
AS	AUD	2
AS	ILS	2
EU	EUR	26
NA	XCD	8
OC	USD	8
*/

/*
- групраме по континет код и по къренси код, за да вземем всички къренсита, които се намират в конитнетта и тяхният брой на използване
- във вложен селект намираме коя е най-използваната къресни
- искаме това къренси да се използва повече от веднъж
- и тази валута да е равна на броят на най-използваната ваута
*/

SELECT 
    `c`.`continent_code`,
    `c`.`currency_code`,
    COUNT(*) AS 'currency_usage'
FROM
    `countries` AS `c`
GROUP BY `c`.`continent_code` , `c`.`currency_code`
HAVING `currency_usage` > 1
    AND `currency_usage` = (SELECT 
        COUNT(*) AS 'most_used_currency' 
    FROM
        `countries` AS `c2`
    WHERE
        `c2`.`continent_code` = `c`.`continent_code`
    GROUP BY `c2`.`currency_code`
    ORDER BY `most_used_currency` DESC
    LIMIT 1)
ORDER BY `c`.`continent_code` , `c`.`currency_code`;