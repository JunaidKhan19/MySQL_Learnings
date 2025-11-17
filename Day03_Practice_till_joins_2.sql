USE junaid_db;

CREATE TABLE Customer (customer_id INT PRIMARY KEY AUTO_INCREMENT, customer_name VARCHAR(25) NOT NULL, city VARCHAR(25) NOT NULL);
INSERT INTO Customer VALUES (1, "Jay Raj", "Mumbai"),
                            (2, "Shrikant Desai", "Pune"),
                            (3, "Ganpat Rao", "Bhopal"),
                            (4, "Birjunath Sai", "Delhi"),
                            (5, "Vaishnav Tamboli", "Mumbai"),
                            (6, "Balbeer Singh", "Pune"),
                            (7, "Martin Cary", "Delhi"),
                            (8, "Narangdas Kadam", "Pune"),
                            (9, "Kabir Singh", "Bhopal"),
                            (10, "Stewart Ford", "Mumbai"),
                            (11, "Pankaj Chaurasiya", "Pune"),
                            (12, "Sakshi Mahatre", "Mumbai");
SELECT * FROM Customer;

CREATE TABLE Banks_details (acc_id INT PRIMARY KEY, bank_name VARCHAR(25), customer_id INT, balance DECIMAL(10,2) DEFAULT(0), 
				   FOREIGN KEY (customer_id) REFERENCES Customer(customer_id));
INSERT INTO Banks_details VALUES (1001, "Kotak Bank", 1, 45000.50),
                                 (1012, "HDFC Bank", 2, 11200.50),
                                 (1031, "ICICI Bank", 3, 75648.50),
                                 (1045, "Kotak Bank", 4, 22310.50),
                                 (1068, "HDFC Bank", 5, 56942.50),
                                 (1076, "Kotak Bank", 6, 4865.50),
                                 (1099, "ICICI Bank", 7, 73529.50),
                                 (1111, "Kotak Bank", 8, 37378.50),
                                 (1124, "HDFC Bank", 9, 9856.50),
                                 (1214, "ICICI Bank", 10, 20155.50),
                                 (1325, "HDFC Bank", 11, 60231.50),
                                 (1511, "Kotak Bank", NULL, default),
                                 (1521, "ICICI Bank", NULL, default);
SELECT * FROM Banks_details;

/*Q1. List all customer with their bank accounts*/
SELECT C.customer_id, C.customer_name, C.city, B.acc_id, B.bank_name, B.balance 
FROM Customer C INNER JOIN Banks_details B ON C.customer_id = B.customer_id;

/*Q2. List banks with their total account balance*/
SELECT bank_name, SUM(balance) FROM Banks_details GROUP BY bank_name ;

/*Q3. List customers with account details living in Pune*/
SELECT C.customer_id, C.customer_name, C.city, B.acc_id, B.bank_name, B.balance 
FROM Banks_details B RIGHT JOIN Customer C ON B.customer_id = C.customer_id 
WHERE city LIKE "Pu%";

/*Q4. List customers who dont have any bank accounts*/
SELECT C.customer_id, C.customer_name, C.city, B.acc_id, B.bank_name, B.balance 
FROM Customer C LEFT JOIN Banks_details B ON C.customer_id = B.customer_id;

/*Q5. Show all customers and their bank accounts if not customers or bank accounts then too list them*/
SELECT C.customer_id, C.customer_name, C.city, B.acc_id, B.bank_name, B.balance 
FROM Customer C LEFT JOIN Banks_details B ON C.customer_id = B.customer_id
UNION
SELECT C.customer_id, C.customer_name, C.city, B.acc_id, B.bank_name, B.balance 
FROM Customer C RIGHT JOIN Banks_details B ON C.customer_id = B.customer_id;

/*Q6. Display customers with more than 50,000 balance*/
SELECT C.customer_id, C.customer_name, C.city, B.acc_id, B.bank_name, B.balance 
FROM Customer C INNER JOIN Banks_details B ON C.customer_id = B.customer_id 
WHERE balance >= 50000;