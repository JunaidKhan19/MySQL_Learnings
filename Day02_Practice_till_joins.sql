USE junaid_db;

CREATE TABLE institute (institute_id INT PRIMARY KEY AUTO_INCREMENT , institute_name VARCHAR(25) NOT NULL, city VARCHAR(25));
INSERT INTO institute VALUES (1, "MUMBAI UNIVERSITY", "MUMBAI"), (2, "PUNE UNIVERSITY", "PUNE"), (3, "AMU", "ALIGARH"), (4, "JMU", "JAMIA MILLIA");
ALTER TABLE students ADD institute_id INT;
ALTER TABLE students ADD CONSTRAINT fk_institute_ref FOREIGN KEY (institute_id) REFERENCES institute(institute_id);
SELECT * FROM institute;

UPDATE students SET institute_id = 2 WHERE id = 1;
UPDATE students SET institute_id = 1 WHERE id = 2;
UPDATE students SET institute_id = 1 WHERE id = 3;
UPDATE students SET institute_id = 3 WHERE id = 4;
UPDATE students SET institute_id = 2 WHERE id = 5;
UPDATE students SET institute_id = 3 WHERE id = 6;
UPDATE students SET institute_id = 2 WHERE id = 7;
UPDATE students SET institute_id = 1 WHERE id = 8;
UPDATE students SET institute_id = NULL WHERE id = 9;
UPDATE students SET institute_id = 3 WHERE id = 10;
SELECT * FROM students;

/*Q1. List students along with the institute name, who must have enrolled in institute*/
SELECT id, first_name, last_name, email, institute.institute_id, institute_name FROM students JOIN institute ON students.institute_id = institute.institute_id;

/*Q2. List students along with the institute name, if not enrolled in any institute, write Not Assigned in place of institute*/
SELECT id, first_name, last_name, email, institute.institute_id, IFNULL(institute.institute_name , "Not Assigned") AS institute_name 
												FROM students LEFT JOIN institute ON students.institute_id = institute.institute_id;
                                                
/*Q3. List all institute along with the students, if no students in any institute, write No Student in place of student_name*/
SELECT institute.institute_id, institute.institute_name, IFNULL(students.id, 0) AS id, IFNULL(first_name, "No Student") AS first_name, 
	IFNULL(last_name, "No Student") AS last_name FROM institute LEFT JOIN students ON institute.institute_id = students.institute_id;
    
/*Q4. List all institute along with all students even if there is no relation between them*/
SELECT id, first_name, last_name, institute.institute_id, institute_name 
FROM students LEFT JOIN institute 
ON students.institute_id = institute.institute_id 
UNION
SELECT id, first_name, last_name, institute.institute_id, institute_name 
FROM students RIGHT JOIN institute 
ON students.institute_id = institute.institute_id;

/*Q5. List of students and university for those studying in mumbai university*/
SELECT id, first_name, last_name , institute.institute_id, institute_name 
FROM students INNER JOIN institute ON students.institute_id = institute.institute_id 
WHERE institute_name LIKE "MUM%"; 