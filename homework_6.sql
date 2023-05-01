CREATE SCHEMA homework_6;
USE homework_6;

-- 1

DROP FUNCTION convertDate;

DELIMITER $$
CREATE FUNCTION convertDate(num INT)
RETURNS VARCHARACTER(225)
DETERMINISTIC
BEGIN 
	DECLARE res VARCHARACTER(225) DEFAULT '';
    DECLARE temp INT DEFAULT 0;

	IF num > 86400 THEN
		WHILE num >= 86400 DO
			SET num = num - 86400;
			SET temp = temp + 1;
        END WHILE;
		END IF;
	SET res = CONCAT(res, ' ', temp, ' days');
	SET temp = 0;

        
	IF num < 86400 AND num >= 3600 THEN
		WHILE num >= 3600 DO
			SET num = num - 3600;
			SET temp = temp + 1;	        
        END WHILE;
		END IF;
	SET res = CONCAT(res, ' ', temp, ' hours');
    SET temp = 0;

        
	IF num >= 60 AND num < 3600 THEN
        WHILE num >= 60 DO
			SET num = num - 60;
			SET temp = temp + 1;
        END WHILE;
        END IF;
	SET res = CONCAT(res, ' ', temp, ' minutes');
    SET temp = 0;

	 IF num < 60 THEN 
		SET res = CONCAT(res, ' ', num, ' seconds');
        END IF;

RETURN res;
END $$
DELIMITER ;

SELECT convertDate(123456);


-- 2 

DROP FUNCTION returnNumbers;

DELIMITER $$
CREATE FUNCTION returnNumbers(num INT)
RETURNS VARCHAR(225)
DETERMINISTIC
BEGIN 
	DECLARE res VARCHAR(225) DEFAULT ' ';
 
IF num % 2 != 0 THEN
SET num = num - 1;
END IF;

IF num % 2 = 0 THEN
WHILE num != 0 DO
    SET res = CONCAT(num, ' ', res);
    SET num = num - 2;
    END WHILE;
    RETURN res;
    
END IF;
END $$
DELIMITER ;

select returnNumbers(15);
