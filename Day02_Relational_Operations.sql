USE junaid_db;

CREATE TABLE employe(emp_id INT PRIMARY KEY, emp_name VARCHAR(25), emp_gender VARCHAR(25), emp_age INT, department VARCHAR(25), salary INT, emp_city VARCHAR(25));
INSERT INTO employe VALUES (1, "Akanksha Thakur", "FEMALE", 22, "I.T", 51000,"Mumbai"),
                           (2, "Amit Verma", "MALE", 30, "Sales", 56000,"Pune"), 
						   (3, "Anisha Srivardhan", "MALE", 21, "I.T", 40500,"Pune"),
                           (4, "Arjun Kapoor", "MALE", 24, "Finance", 31000,"Delhi"),
                           (5, "Balbeer Singh", "MALE", 27, "H.R", 50000,"Amritsar"),
                           (6, "Birjunath Sai", "MALE", 27, "I.T", 49500,"Bhopal"),
						   (7, "Deepak Nair", "MALE", 25, "Sales", 32000,"Pune"),                           
                           (8, "Divya Singh", "FEMALE", 33, "H.R", 25000,"Pune"),
                           (9, "Ganpat Rao", "MALE", 21, "Finance", 40500,"Mumbai"),
                           (10, "Jagdeep Dhillon", "MALE", 26, "H.R", 40500,"Delhi"),
				           (11, "Jay Raj", "MALE", 26, "H.R", 40500,"Delhi"),
                           (12, "Karan Mehta", "MALE", 34, "I.T", 75000,"Bangalore"),
                           (13, "Kavita Joshi", "FEMALE", 24, "Sales", 33000,"Indore"),
						   (14, "Meena Yadav", "FEMALE", 32, "H.R", 41000,"Lucknow"),
                           (15, "Mohini Pandey", "FEMALE", 22, "I.T", 25000,"Bhopal"),
                           (16, "Narangdas Kadam", "MALE", 23, "Finance", 39500,"Mumbai"),
                           (17, "Neha Kulkarni", "FEMALE", 26, "Finance", 27500,"Nagpur"),
						   (18, "Nikhil Kamat", "MALE", 20, "I.T", 32000,"Mumbai"),
                           (19, "Pooja Patil", "FEMALE", 29, "I.T", 57000,"Chennai"),
                           (20, "Priya Rai", "FEMALE", 25, "H.R", 40000,"Delhi"),
                           (21, "Sameer Shaikh", "MALE", 23, "I.T", 45000,"Delhi"),
                           (22, "Shalini Gupta", "FEMALE", 22, "I.T", 38000,"Mumbai"),
                           (23, "Shrikant Desai", "MALE", 21, "I.T", 40500,"Mumbai"),
                           (24, "Sneha Goshal", "FEMALE", 22, "Finance", 42500,"Mumbai"),
                           (25, "Rajeev Khanna", "MALE", 40, "Finance", 72000,"Delhi"),
                           (26, "Ramesh Tiwari", "MALE", 36, "Finance", 63000,"Mumbai"),
                           (27, "Ritika Sharma", "FEMALE", 28, "Finance", 52000,"Delhi"),
                           (28, "Vaishnavi Tamboli", "MALE", 20, "I.T", 40000,"Mumbai"),
                           (29, "Vibha Nadre", "FEMALE", 29, "H.R", 62000,"Delhi"),
                           (30, "Vishvas Agarwal", "MALE", 23, "Sales", 35000,"Delhi");
SELECT * FROM employe;

/*Q1. Employees who work in IT department and have salary greater than 50000*/
SELECT * FROM employe WHERE department = "I.T" AND salary > 50000;

/*Q2. Employees who are from Mumbai OR Delhi*/
SELECT * FROM employe WHERE emp_city = "Mumbai" OR emp_city = "Delhi";

/*Q3. Employees who are NOT from HR department*/
SELECT * FROM employe WHERE NOT department = "H.R";

/*Q4. Employees who are from "Finance" department XOR have salary greater than 40000*/
SELECT * FROM employe WHERE department = "Finance" XOR salary > 40000;

/*Q5. Employees who are from "Sales" department AND have (salary > than 30000 OR age < 25)*/
SELECT * FROM employe WHERE department = "Sales" AND ( salary > 30000 OR emp_age < 25);

/*Q6. Employees who are NOT from "Pune" AND have salary greater than 35000*/
SELECT * FROM employe WHERE NOT emp_city = "Pune" AND salary > 35000;

/*Q7. Employees who are from "I.T" OR NOT FROM Finance*/
SELECT * FROM employe WHERE department = "I.T" OR NOT department = "Finance";

/*Q8. Employees who are "MALE" XOR have salary above 60000 & belong to "H.R"*/
SELECT * FROM employe WHERE emp_gender = "MALE" XOR (salary > 60000 AND department = "H.R"); 

/*Q9. Employees who have age > 30 AND (department = "I.T" OR "Finance")*/
SELECT * FROM employe WHERE emp_age > 30 AND (department = "I.T" OR department = "Finance");

/*Q10. Employees who are NOT from "Delhi" XOR have salary less than 25000*/
SELECT * FROM employe WHERE NOT emp_city = "Delhi" XOR salary < 25000; 
