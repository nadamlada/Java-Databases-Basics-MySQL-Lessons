/*
03.	Update
Rename those countries, which meet the following conditions:
•	If the country name starts with 'B' – change it to 'Blocked'.
•	If the country name starts with 'T' – change it to 'Test'.
•	If the country name starts with 'P' – change it to 'In Progress'.
*/

UPDATE `addresses` AS `a` 
SET 
    `country` = CASE LEFT(`country`, 1)
        WHEN 'B' THEN 'Blocked'
        WHEN 'T' THEN 'Test'
        WHEN 'P' THEN 'In Progress'
    END
WHERE
    LEFT(`country`, 1) IN ('B' , 'T', 'P');