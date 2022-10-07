    /*
4. Triggered
Create a table deleted_employees(employee_id PK, first_name,last_name,middle_name,job_title,deparment_id,salary) that will hold information about fired(deleted) employees from the employees table. Add a trigger to employees table that inserts the corresponding information in deleted_employees. Submit your queries using the "MySQL Run Skeleton, run queries and check DB" strategy.
*/

DELIMITER ***
CREATE TABLE `deleted_employess` (
    `employee_id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `middle_name` VARCHAR(50) NOT NULL,
    `job_title` VARCHAR(50) NOT NULL,
    `department_id` INT NOT NULL,
    `salary` DECIMAL(19 , 4 ) NOT NULL
);
 
CREATE 
    TRIGGER  `tr_deleted_employees`
 AFTER DELETE ON `employees` FOR EACH ROW
 BEGIN
	INSERT INTO `deleted_employess` (`first_name` , `last_name` , `middle_name` , `job_title` , `department_id` , `salary`) 	VALUES (OLD.`first_name` , OLD.`last_name` , OLD.`middle_name` , OLD.`job_title` , OLD.`department_id` , OLD.`salary`);
END
***

DELIMITER ;
-- премахва всички връзки PK -> FK
SET FOREIGN_KEY_CHECKS = 0;
    
DELETE FROM `employees`
WHERE `employee_id` = 12;

