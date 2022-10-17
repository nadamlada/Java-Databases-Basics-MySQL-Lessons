/*
03.	Update
Rename those countries, which meet the following conditions:
•	If the country name starts with 'B' – change it to 'Blocked'.
•	If the country name starts with 'T' – change it to 'Test'.
•	If the country name starts with 'P' – change it to 'In Progress'.
*/

UPDATE `addresses` AS `a` 
SET 
    `country` = (IF(`country` LIKE 'B%',
        'Blocked',
        IF(`country` LIKE 'T%',
            'Test',
            IF(`country` LIKE 'P%',
                'In Progress',
                `country`))));