USE junaid_db;

/*Q1. Make stored procedures to find employee by department, GetEmployeesByDept(IN dept_name VARCHAR(50)) that takes a department name as input 
and returns all employees working in that department.*/
DELIMITER //
CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(50))
BEGIN
SELECT * FROM employe WHERE department = dept_name;
END //
DELIMITER ;

CALL GetEmployeesByDept("Sales");

/*Q2. Make stored procedures to get orders after given date, GetOrdersAfterDate(IN order_date DATE) that takes a date as input and returns all orders placed after that date.*/
DELIMITER //
CREATE PROCEDURE GetOrdersAfterDate(IN order_date DATE)
BEGIN
SELECT * FROM orders WHERE orders.order_date > order_date; 
END //
DELIMITER ;

CALL GetOrdersAfterDate("2025-07-08");

/*Q3. Make stored procedures to find maximum salary, GetMaxSalary(OUT max_sal DECIMAL(10,2)) finds the highest salary from the employees table and store it in the OUT parameter.*/
DELIMITER //
CREATE PROCEDURE GetMaxSalary(OUT max_sal DECIMAL(10,2))
BEGIN 
SELECT MAX(salary) INTO max_sal FROM employe;
END //
DELIMITER ;
CALL GetMaxSalary(@salary);
SELECT @salary;

/*Q4. Make stored procedures to count total students, CountStudents(OUT total_students INT) that returns the total number of students in the students table.*/
DELIMITER //
CREATE PROCEDURE CountStudents(OUT total_students INT)
BEGIN
SELECT COUNT(id) INTO total_students FROM student_info;
END //
DELIMITER ;
CALL CountStudents(@studentsCount);
SELECT @studentSCount;


/*Q5. Make stored procedures to increase salary by percentage, IncreaseSalary(IN emp_id INT, INOUT salary DECIMAL(10,2)) that 
takes an employee ID and current salary, increases it by 10%, and updates the salary value in the INOUT parameter.*/
DELIMITER //
CREATE PROCEDURE IncreaseSalary(IN empid INT, INOUT sal DECIMAL(10,2))
BEGIN
DECLARE current_salary INT DEFAULT 1;
SELECT salary INTO current_salary FROM employe e WHERE e.emp_id = empid ;
SET sal = current_salary + (current_salary * (10/100));
END //
DELIMITER ;
CALL IncreaseSalary(1, @afterbonus);
SELECT @afterbonus;

/*Q6. Make stored procedures to check student marks status, CheckResult(IN student_id INT, INOUT status VARCHAR(20)) 
that checks a student’s marks from the marks table. If marks ≥ 40, update status to 'PASS', else 'FAIL'.*/
DELIMITER //
CREATE PROCEDURE CheckResult(IN student_id INT, INOUT passingstatus VARCHAR(20)) 
BEGIN
DECLARE student_marks INT DEFAULT 1;
SELECT marks INTO student_marks FROM students WHERE id = student_id;
IF student_marks >= 40 THEN SET passingstatus = "PASS" ;
ELSE SET passingstatus = "FAIL";
END IF;
END//
DELIMITER ;
CALL CheckResult(1, @passingstatus);
SELECT @passingstatus;


/*Q7. Make stored procedures to set negative salaries to 0.*/
DELIMITER //
CREATE TRIGGER NegativeSalaryToZero
BEFORE UPDATE ON employe FOR EACH ROW
BEGIN 
	IF NEW.salary <= 0 THEN 
    SET NEW.salary = 0;
    END IF;
END//
DELIMITER ;

UPDATE employe SET salary = -100 WHERE emp_id = 1;