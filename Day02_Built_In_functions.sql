USE junaid_db;

CREATE TABLE Student_info (id INT PRIMARY KEY, student_name VARCHAR(25) NOT NULL, department VARCHAR(25) DEFAULT(NULL), 
                           gender VARCHAR(25) DEFAULT("NOT DEFINED"), age INT NOT NULL DEFAULT(10), marks INT NOT NULL);
INSERT INTO Student_info VALUES (1, "Wazir Shah", "I.T", "MALE", 15, 255), 
                                (2, "Areeba Khan", "I.T", "FEMALE", 16, 286), 
                                (3, "Sariya Siddiqui", "C.S", "FEMALE", 18, 180),
                                (4, "Rakeeb Chaudhry", "EXTC", "MALE", 15, 359),
                                (5, "Parwan Shaikh", "EXTC", "MALE", 15, 321),
                                (6, "Tabrez Mansuri", "I.T", "MALE", 14, 249),
                                (7, "Naeem Khan", "C.S", "MALE", 17, 120),
                                (8, "Farah Khan", "C.S", "FEMALE", 19, 196),
                                (9, "Karim Lala", "C.S", "MALE", 19, 174),
                                (10, "Zarish Afghani", "EXTC", "MALE", 15, 371),
                                (11, "Nasir Fazal", "I.T", "MALE", 16, 255),
                                (12, "Shaheen Qureshi", "I.T", "FEMALE", 14, 255),
                                (13, "Nasreen Bano", "C.S", "FEMALE", 17, 158),
                                (14, "Javad Riyaz", "EXTC", "MALE", 16, 344);

/*Q1. List the number of students in each department*/
SELECT department, COUNT(*) AS student_count FROM Student_info GROUP BY department;

/*Q2. Find the average marks of students in each department*/
SELECT department, AVG(marks) AS avg_marks FROM Student_info GROUP BY department; 

/*Q3. List number of males and female student*/
SELECT gender, COUNT(*) AS student_count FROM Student_info GROUP BY gender;

/*Q4. List maximum marks obtained by students in each department*/
SELECT department, MAX(marks) AS max_marks FROM Student_info GROUP BY department;

/*Q5. Display the average age of students grouped by department and gender.*/
SELECT department, gender, AVG(age) AS avg_age FROM Student_info GROUP BY department, gender;

/*Q6. List total marks obtained by students in each department*/
SELECT department, SUM(marks) AS total_marks FROM Student_info GROUP BY department;

/*Q7. Display minimum marks obtained by students in each department.*/
SELECT department, MIN(marks) AS total_marks FROM Student_info GROUP BY department;

/*Q8. Count the number of students in each age group.*/
SELECT age, COUNT(*) AS age_group FROM Student_info GROUP BY age;

/*Q9. List departmentwise student count and average marks.*/
SELECT department, COUNT(*) AS student_count, AVG(marks) AS average_marks FROM Student_info GROUP BY department;

/*Q10. List total number of students grouped by both department and age*/
SELECT department, age, COUNT(*) AS student_count FROM Student_info GROUP BY department, age;