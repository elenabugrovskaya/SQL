-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
CREATE DATABASE hw06;
USE hw06;
DROP FUNCTION IF EXISTS format_time;
DELIMITER \\
CREATE FUNCTION format_time (sec INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE days INT;
    DECLARE hours INT;
    DECLARE mins INT;
    DECLARE result VARCHAR(100);
    SET days=24*60*60;
    SET hours=60*60;
    SET mins=60;
    SET result= CONCAT(CONVERT(sec DIV days,char), " days");
    SET sec= sec % days;
    SET result= CONCAT(result, CONVERT(sec DIV hours,char)," hours");
    SET sec= sec % hours;
    SET result= CONCAT(result, CONVERT(sec DIV mins,char), " minutes");
    SET sec= sec % mins;
    SET result= CONCAT(result, CONVERT(sec ,char), " seconds");
    RETURN result;
END \\
DELIMITER ; 
SELECT format_time(123456); 

-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS show_even;
DELIMITER $$

CREATE PROCEDURE show_even()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE result VARCHAR(20) DEFAULT '';
    WHILE counter <= 10 DO
        IF counter % 2 = 0 THEN
            SET result = CONCAT(result,CONVERT(counter,char),"  ");
        END IF;
        
        SET counter = counter + 1;
    END WHILE;
    SELECT result;
END $$
DELIMITER ;
CALL show_even();