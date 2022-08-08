/*
03.	Update
Reduce all movies runtime by 10 minutes for movies with movies_additional_info id equal to or greater than 15 and less than 25 (inclusive).
*/

UPDATE `movies_additional_info` 
SET 
    `runtime` = `runtime` - 10
WHERE
    `id` >= 15 AND `id` <= 25;