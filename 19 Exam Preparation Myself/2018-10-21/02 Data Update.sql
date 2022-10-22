/*
02.	Data Update
UPDATE those journeys’ purpose, which meet the following conditions:
•	If the journey’s id is dividable by 2 without remainder – ‘Medical’.
•	If the journey’s id is dividable by 3 without remainder – ‘Technical’.
•	If the journey’s id is dividable by 5 without remainder – ‘Educational’.
•	If the journey’s id is dividable by 7 without remainder – ‘Military’. 
*/

UPDATE `journeys` 
SET 
    `purpose` = 
    CASE
        WHEN `id` % 2 = 0 THEN 'Medical'
        WHEN `id` % 3 = 0 THEN 'Technical'
        WHEN `id` % 5 = 0 THEN 'Educational'
        WHEN `id` % 7 = 0 THEN 'Military'
        ELSE `purpose`
    END;