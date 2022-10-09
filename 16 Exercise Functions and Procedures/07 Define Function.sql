/*
7.	Define Function
Define a function ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))  that returns 1 or 0 depending on that if the word is a comprised of the given set of letters. 
Submit your query statement as Run skeleton, run queries & check DB in Judge.

Example
set_of_letters	word	result
oistmiahf	Sofia	1
oistmiahf	halves	0
bobr	Rob	1
pppp	Guy	0
*/

DELIMITER ***
CREATE FUNCTION `ufn_is_word_comprised` (`set_of_letters` VARCHAR(50), `word` VARCHAR(50))
RETURNS BIT
DETERMINISTIC
BEGIN
RETURN `word` REGEXP(CONCAT('^[', `set_of_letters`, ']+$'));
END
*** 

SELECT `ufn_is_word_comprised` ('oistmiahf', 'Sofia')***