USE junaid_db;

/*SWITCH CASE*/
SELECT CONCAT(first_name," ",last_name) AS student_name ,
CASE 
    WHEN marks > 79 THEN "Grade A"
    WHEN marks > 59 THEN "Grade B"
    WHEN marks > 45 THEN "Grade C" 
    ELSE "FAIL"
    END AS Grade 
FROM students;

/*Q1 CHECK MONTH BASED ON NUMBER*/
DELIMITER //
CREATE PROCEDURE CheckMonth(IN months INT)
BEGIN
CASE 
	WHEN months = 1 THEN SELECT "JANUARY";
 	WHEN months = 2 THEN SELECT "FEBRUARY";
    WHEN months = 3 THEN SELECT "MARCH";
    WHEN months = 4 THEN SELECT "APRIL";
    WHEN months = 5 THEN SELECT "MAY";
    WHEN months = 6 THEN SELECT "JUNE";
    WHEN months = 7 THEN SELECT "JULY";
    WHEN months = 8 THEN SELECT "AUGUST";
    WHEN months = 9 THEN SELECT "SEPTEMBER";
    WHEN months = 10 THEN SELECT "OCTOBER";
    WHEN months = 11 THEN SELECT "NOVEMBER";
    WHEN months = 12 THEN SELECT "DECEMBER";
    ELSE SELECT "INVALID NUMBER FOR MONTH";
END CASE;
END//
DELIMITER ;
call CheckMonth(6);

/*Q2 EMPLOYEE BONUS CALCULATION*/
DELIMITER //
CREATE PROCEDURE CheckEvenOdd(IN num INT)
BEGIN
CASE
    WHEN num % 2 = 0 THEN SELECT "EVEN";
    ELSE SELECT "ODD";
END CASE;
END//
DELIMITER ;
call CheckEvenOdd(6);

/*Q3 AGE Categorization
below 13 CHILD
13 - 19 TEENAGE
20 - 59 ADULT
ELSE SENIOR CITIZEN */

DELIMITER //
CREATE PROCEDURE Checkage(IN age INT)
BEGIN
	CASE 
		WHEN age >= 60 THEN SELECT "SENIOR CITIZEN";
        WHEN age >= 20 THEN SELECT "ADULT";
        WHEN age >= 13 THEN SELECT "TEENAGE";
        WHEN age < 13 THEN SELECT "CHILD";
	END CASE;
END //
DELIMITER ;

CALL Checkage(25);


/*Q4 ELECTRICITY BILL CALC */
DELIMITER //
CREATE PROCEDURE ebillcalc(IN num_of_units INT, OUT fare INT)
BEGIN
	CASE 
		WHEN num_of_units <= 100 THEN SELECT (5 * num_of_units) INTO fare;
        WHEN num_of_units <= 300 THEN SELECT (7 * num_of_units)  INTO fare;
        ELSE SELECT (num_of_units * 10);
	END CASE;
END//
DELIMITER ;

CALL ebillcalc(125, @fare);
select @fare as total_fare;


/*Q5 TRAFFIC SIGNAL*/

DELIMITER // 
CREATE PROCEDURE trafficSignal(IN char_signal VARCHAR(1))
BEGIN
	CASE char_signal
		WHEN "R" THEN SELECT "STOP";
        WHEN "Y" THEN SELECT "WAIT";
        WHEN "G" THEN SELECT "GO";
        ELSE SELECT "INVALID INPUT"; 
    END CASE;
END //
DELIMITER ; 

CALL trafficSignal("R")

/*Q6 PRINT EVEN NUMBERS FROM 1 - 30*/

DELIMITER //
CREATE PROCEDURE printEvenTo30(IN num INT)
BEGIN 
	DECLARE var INT DEFAULT 1;
    DECLARE even INT DEFAULT 1; 
    DECLARE alleven VARCHAR(250) DEFAULT " ";
	lbl: REPEAT
		IF var % 2 = 0 THEN SELECT var INTO even;
        SET alleven = CONCAT(alleven, even, " ");
        END IF;
        SET var = var + 1;
        UNTIL var > num
        END REPEAT lbl;
	SELECT alleven AS even_list;
END //
DELIMITER ;

CALL printEvenTo30(100);

/*Q6 PRINT ODD NUMBERS FROM 1 - 30*/

DELIMITER //
CREATE PROCEDURE printOddTo30(IN num INT)
BEGIN 
	DECLARE var INT DEFAULT 1;
    DECLARE odd INT DEFAULT 1; 
    DECLARE allodd VARCHAR(250) DEFAULT " ";
	lbl: REPEAT
		IF NOT var % 2 = 0 THEN SELECT var INTO odd;
        SET allodd = CONCAT(allodd, odd, " ");
        END IF;
        SET var = var + 1;
        UNTIL var > num
        END REPEAT lbl;
	SELECT allodd AS odd_list;
END //
DELIMITER ;

CALL printOddTo30(100);


/*Q7 PRINT NUMBERS IN REVERSE ORDER*/

DELIMITER //
CREATE PROCEDURE reversenum(IN num INT)
BEGIN
DECLARE RevNum VARCHAR (500) DEFAULT "";
	label: WHILE num > 0 DO
	   SET RevNum = CONCAT(RevNum,num," ");
	   SET num = num - 1;
END WHILE label;
SELECT RevNum;
END //
DELIMITER ;

CALL reversenum(50);
    
/*Q8 PRINT TABLE OF 8*/
DELIMITER //
CREATE PROCEDURE tableof8(IN tm INT)
BEGIN
	DECLARE num INT DEFAULT 8; 
    DECLARE times INT DEFAULT 1;
    DECLARE result INT DEFAULT 0;
    DECLARE final_result VARCHAR (100) DEFAULT " ";
	tableOf8: REPEAT 
			  SET result = num * times;
              SET final_result = CONCAT(final_result, result, " ");
              SET times = times + 1;
              UNTIL times >= tm
    END REPEAT tableOf8;
    SELECT final_result AS Table_of_8;
END //
DELIMITER ;

CALL tableof8(15);

/*Q9 PRINT CUBES TILL THE INPUT NUMBER*/
DELIMITER //
CREATE PROCEDURE cubestill(IN num INT)
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE cubes INT;
    DECLARE cubesarray VARCHAR(200) DEFAULT " ";
    cubesfinder: REPEAT
                 SET cubes = i * i * i;
                 SET cubesarray = CONCAT(cubesarray, cubes, " ");
                 SET i = i + 1;
                 UNTIL i > num
	END REPEAT cubesfinder;
    SELECT cubesarray AS array_of_cubes;
END //
DELIMITER ;

CALL cubestill(5);

/*Q10 FACTORIAL OF A NUMBER USING WHILE LOOP*/
/*To show the factorial multiplication result over each step*/
DELIMITER //
CREATE PROCEDURE factorial2(IN num INT)
BEGIN
	DECLARE i INT DEFAULT num;
    DECLARE tempfact INT DEFAULT 1;
    DECLARE factorials VARCHAR(250) DEFAULT " ";
    factorialfinder: WHILE (i >= 1) DO
					 SET tempfact = tempfact * i;
                     SET i = i - 1;
                     SET factorials = CONCAT(factorials,tempfact," ");
					 END WHILE factorialfinder;
	SELECT factorials AS factlist;
END //
DELIMITER ;

/*To show the final factorial result*/
DELIMITER //
CREATE PROCEDURE factorial2(IN num INT)
BEGIN
	DECLARE i INT DEFAULT num;
    DECLARE tempfact INT DEFAULT 1;
    DECLARE factorials VARCHAR(250) DEFAULT " ";
    factorialfinder: WHILE (i >= 1) DO
					 SET tempfact = tempfact * i;
                     SET i = i - 1;
                     /*SET factorials = CONCAT(factorials,tempfact," ");*/
                     SET factorials = tempfact;
					 END WHILE factorialfinder;
	SELECT factorials AS factlist;
END //
DELIMITER ;

CALL factorial1(10);
CALL factorial2(10);


/*Q11 FIRST 10 TERMS OF FIBONACCI SERIES USING REPEAT LOOP*/
DELIMITER // 
CREATE PROCEDURE getFibonacciTill(IN num INT)
BEGIN 
    DECLARE i INT DEFAULT 0;
	DECLARE firstnum INT DEFAULT 0;
    DECLARE secondnum INT DEFAULT 1;
    DECLARE tempnum INT;
    DECLARE fiblist VARCHAR(300) DEFAULT "0 1 ";
    SELECT firstnum ;
    SELECT secondnum ;
    fibfinder: REPEAT
			   SET tempnum = firstnum + secondnum;
               SET fiblist = CONCAT(fiblist, tempnum, " ");
               SET firstnum = secondnum;
               SET secondnum = tempnum;
               SET i = i + 1;
               UNTIL i >= num
			   END REPEAT fibfinder;
	SELECT fiblist AS fibonacci_list;
END //
DELIMITER ;

CALL getFibonacciTill(10);
