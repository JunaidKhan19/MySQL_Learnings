USE junaid_db;
CREATE TABLE departments (dept_id INT PRIMARY KEY, dept_name VARCHAR(50));
INSERT INTO departments VALUES (1, "Infotech"), (2, "Artificial-intelligence"), (3, "Mecha-monitory"), (4, "Biodome"), (5, "Accounts & Finance");
SELECT * FROM departments;

CREATE TABLE employee (emp_id INT PRIMARY KEY, emp_name VARCHAR(50) NOT NULL, dept_id INT, FOREIGN KEY (dept_id) REFERENCES departments(dept_id));
INSERT INTO employee VALUES (1, "Manish", 2), (2, "Junaid", 3), (3, "Safwan", 1), (4, "Asif", 2), (5, "Arsalan", 1), (6, "Pratik", 3), 
                            (7, "Himanshu", 3), (8, "Rishabh", 2), (9, "Abdul Rehman", 1), (10, "Ritwik", NULL), (11, "Jay", NULL);
SELECT * FROM employee;

/*Q1. List all employees with their department names.*/
SELECT emp_id, emp_name, dept_name FROM employee INNER JOIN departments WHERE departments.dept_id = employee.dept_id;

/*Q2. List all employees even without any departments.*/
SELECT emp_id, emp_name, dept_name FROM employee LEFT JOIN departments ON departments.dept_id = employee.dept_id;

/*Q3. List all departments even without any employees.*/
SELECT emp_id, emp_name, dept_name FROM employee RIGHT JOIN departments ON departments.dept_id = employee.dept_id;
