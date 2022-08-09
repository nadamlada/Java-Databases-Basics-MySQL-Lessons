/*
04.	Delete
Delete all countries that don’t have movies
*/

-- изтрий цялата таблица
DELETE `countries` FROM 
`countries`
LEFT JOIN `movies` ON `movies`.`country_id` = `countries`.`id`
WHERE `movies`.`id` IS NULL;