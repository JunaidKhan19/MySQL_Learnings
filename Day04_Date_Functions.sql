USE junaid_db;
SELECT * FROM employe;

CREATE TABLE emp_worktime(id INT PRIMARY KEY AUTO_INCREMENT, employee_id INT NOT NULL, hiring_date DATE NOT NULL, 
                          FOREIGN KEY (employee_id) REFERENCES employe(emp_id));

INSERT INTO emp_worktime VALUES (1, 1, "2021-01-10"),
								(2, 2, "2021-02-06"),
                                (3, 3, "2021-02-08"),
                                (4, 4, "2021-01-11"),
                                (5, 5, "2021-01-01"),
                                (6, 6, "2021-01-11"),
                                (7, 7, "2021-02-09"),
                                (8, 8, "2021-02-01"),
                                (9, 9, "2021-01-12"),
                                (10, 10, "2021-02-01"),
                                (11, 11, "2021-02-02"),
                                (12, 12, "2021-02-20"),
                                (13, 13, "2021-02-10"),
                                (14, 14, "2021-03-01"),
                                (15, 15, "2021-05-01"),
                                (16, 16, "2021-03-01"),
                                (17, 17, "2021-03-05"),
                                (18, 18, "2021-05-10"),
                                (19, 19, "2021-05-11"),
                                (20, 20, "2021-03-01"),
                                (21, 21, "2021-06-01"),
                                (22, 22, "2021-03-01"),
                                (23, 23, "2021-05-01"),
                                (24, 24, "2021-03-05"),
                                (25, 25, "2021-04-01"),
                                (26, 26, "2021-04-01"),
                                (27, 27, "2021-05-01"),
                                (28, 28, "2021-04-01"),
                                (29, 29, "2021-04-01"),
                                (30, 30, "2021-06-01");

SELECT * FROM employe INNER JOIN emp_worktime ON emp_id = employee_id;

/*Q1. Display the current date*/
SELECT CURDATE() AS currentdate;

/*Q2. Display the current date time.*/
SELECT NOW() AS current_date_time;

/*Q3. Find the year of joining for each employee*/
SELECT emp_id, emp_name, department, hiring_date, EXTRACT(YEAR FROM hiring_date) AS year_of_hiring FROM employe JOIN emp_worktime ON emp_id = employee_id;

/*Q4. Find the month number and month name of joining*/
SELECT emp_id, emp_name, department, hiring_date, 
		MONTH(hiring_date) AS month_num, 
        MONTHNAME(hiring_date) AS month_of_hiring 
FROM employe JOIN emp_worktime ON emp_id = employee_id;

/*Q5. Find the day number and day name of joining*/
SELECT emp_id, emp_name, department, hiring_date, 
		DAY(hiring_date) AS day_num, 
        DAYNAME(hiring_date) AS day_of_hiring 
FROM employe JOIN emp_worktime ON emp_id = employee_id;

/*Q6. Find how many days each employee has worked until today*/
SELECT emp_id, emp_name, department, hiring_date, 
        DATEDIFF(CURDATE(), hiring_date) AS days_worked
FROM employe JOIN emp_worktime ON emp_id = employee_id;

/*Q7. Find how many years each employee has worked until today*/
SELECT emp_id, emp_name, department, hiring_date, 
		DAY(hiring_date) AS day_num, 
        DAYNAME(hiring_date) AS day_of_hiring,
        TIMESTAMPDIFF(YEAR, hiring_date, CURDATE()) AS years_worked
FROM employe JOIN emp_worktime ON emp_id = employee_id;

/*Q8. Find the last day of the month in which employee was hired*/
SELECT emp_id, emp_name, department, hiring_date, 
        LAST_DAY(hiring_date) AS lastday_of_hiring_month
FROM employe JOIN emp_worktime ON emp_id = employee_id;