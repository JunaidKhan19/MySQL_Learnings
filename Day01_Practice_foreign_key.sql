USE junaid_db;
CREATE TABLE students_details (student_id INT PRIMARY KEY AUTO_INCREMENT, s_name VARCHAR(50) NOT NULL, email VARCHAR(50) UNIQUE, is_active BOOLEAN DEFAULT(TRUE));
INSERT INTO students_details VALUES (1,"Abdulrehman", "abdulrehmansh@email.com", TRUE),
                            (2, "Arsalan", "arsalansk@email.com", TRUE), 
                            (3, "Asif", "asifsk@email.com", FALSE), 
                            (4, "Safwan", "safwansk@email.com", TRUE),
                            (5, "Pratik", "pratik@email.com", FALSE),
                            (6, "Rishabh", "rishabh@email.com", TRUE), 
                            (7, "Manish", "manish@email.com", TRUE);
SELECT * FROM students_details;

CREATE TABLE courses (course_id INT PRIMARY KEY AUTO_INCREMENT, course_name VARCHAR(50) NOT NULL, duration_month INT NOT NULL);
INSERT INTO courses VALUES (1, "PG-DAC", 6),(2, "AICA", 14),(3, "BSC", 6),(4, "TALLY", 6),(5, "MSC-IT", 3);
SELECT * FROM courses;

CREATE TABLE enrollments (enrollment_id INT PRIMARY KEY AUTO_INCREMENT, student_id INT, course_id INT, is_completed BOOLEAN DEFAULT(FALSE), 
                          FOREIGN KEY (student_id) REFERENCES students_details(student_id), FOREIGN KEY (course_id) REFERENCES courses(course_id));
INSERT INTO enrollments VALUES (1, 2, 5, FALSE), (2, 7, 3, FALSE), (3, 1, 2, FALSE), (4, 6, 4, FALSE), (5, 4, 1, FALSE), (6, 5, 4, TRUE), (7, 3, 4, TRUE);
SELECT * FROM enrollments
