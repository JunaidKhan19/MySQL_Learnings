USE junaid_db;

/*ALL EMPLOYEES NAME IN UPPERCASE*/
SELECT UPPER(emp_name) FROM employe;

/*ALL JOB TITLES IN LOWERCASE*/
SELECT LOWER(department) FROM employe;

/*FIND THE LENGTH OF EACH EMPLOYEES NAME*/
SELECT emp_name, LENGTH(emp_name) AS TOTAL_LENGTH FROM employe;

/*COMBINE NAME, JOBTITLE*/
SELECT emp_name, department, CONCAT(emp_name," ", department) AS NAME_DESIGNATION FROM employe;

/*DISPLAY ONLY THE FIRST 4 LETTERS OF EACH EMPLOYEES NAME*/
SELECT emp_name, SUBSTRING(emp_name,1, 4) FROM employe;

/*GET THE FIRST 3 LETTERS AND LAST 3 LETTERS OF EACH EMP NAME*/
SELECT emp_name, LEFT(emp_name, 3) AS FIRST_THREE, RIGHT(emp_name, 3) AS LAST_THREE FROM employe;

/*REPLACE I.T AS Infotech dev IN DEPARTMENTS COLUMN*/
SELECT emp_name, REPLACE(department, "I.T", "Infotech dev") FROM employe;

/*FIND THE POSITION OF "@" IN THE CUSTOMER DETAILS MAIL*/
SELECT email, LOCATE("@", email) AS Position FROM customer_details;

/*REMOVE SPACES FROM EMPLOYEES NAME*/
SELECT emp_name, TRIM(emp_name) AS Trimmed_name FROM employe;

/*DISPLAY EMPLOYEES NAME IN REVERSE ORDER*/
SELECT emp_name, REVERSE(emp_name) AS Trimmed_name FROM employe;


