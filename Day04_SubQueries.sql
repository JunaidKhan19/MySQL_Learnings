USE junaid_db;

/*Q1 Subquery to find the employees who has maximum salary*/
SELECT * FROM employe WHERE salary = (SELECT MAX(salary) FROM employe); 

/*Q2 Subquery to find students above average marks*/
SELECT * FROM students WHERE marks >= (SELECT AVG(MARKS) FROM students);

/*Q3 Subquery to find the employees who work in same department as 'amit verma'*/
SELECT * FROM employe WHERE department = (SELECT department FROM employe WHERE emp_name = "Amit Verma");

/*Q4 Subquery to find the products costlier than 'PS-5'*/
SELECT * FROM product_details WHERE p_price > (SELECT p_price FROM product_details WHERE p_name = "PS-5");

/*Q5 Subquery to find the employees who has second highest salary*/
SELECT * FROM employe WHERE salary = (
	SELECT MAX(salary) FROM employe WHERE salary < (
		SELECT MAX(salary) FROM employe
	)
); 

/*Q6 Subquery to find departments with More than Average Employees */
/* From the employe tables, find the departments where employee count is more than the average employee count across all departments.*/
SELECT department, COUNT(*) as aboveavg_count FROM employe GROUP BY department HAVING COUNT(*) > (
	SELECT AVG(department_count) FROM (
		SELECT COUNT(*) AS department_count FROM employe GROUP BY department 
	) AS avg_department_count 
); 

/*Q7 Subquery to find students who scored highest in each subject using correlated subqueries.*/
SELECT * FROM student_info s1 WHERE s1.marks = (SELECT MAX(marks) FROM student_info s2 WHERE s1.department = s2.department); 

/*Q8 Subquery to find customers who ordered products order total greater than the overall average order amount*/
SELECT * FROM orders WHERE AMOUNT > (SELECT AVG(AMOUNT) FROM orders); 