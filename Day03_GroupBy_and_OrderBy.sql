USE junaid_db;

CREATE TABLE restaurant (restaurant_id INT PRIMARY KEY, restaurant_name VARCHAR(25) NOT NULL, location VARCHAR(25));
INSERT INTO restaurant VALUES (1, "Shalimar", "Bhendi Bazar"), 
                              (2, "Lime N Spice", "Chaupathy"), 
                              (3, "Mumbai Darbar", "Byculla"), 
                              (4, "Taj Hotel", "Colaba"), 
                              (5, "Swagat", "Dadar");
SELECT * FROM restaurant;

CREATE TABLE orders (order_id INT PRIMARY KEY AUTO_INCREMENT, restaurant_id INT, customer_name VARCHAR(25) NOT NULL, AMOUNT DECIMAL(8,2) NOT NULL, order_date DATE, 
					FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id));
INSERT INTO orders VALUES (1, 4, "Jay Raj", 2400.23, '2025-07-02'), 
                          (2, 1, "Shrikant Desai", 1750.50, '2025-07-05'),
                          (3, 3, "Ganpat Rao", 1100.11, '2025-07-06'),
                          (4, 2, "Birjunath Sai", 1822.33, '2025-07-08'),
                          (5, 2, "Vaishnav Tamboli", 1995.56, '2025-07-10'),
                          (6, 3, "Balbeer Singh", 7756.45, '2025-07-22'),
                          (7, 1, "Martin Cary", 3824.74, '2025-07-28'),
                          (8, 1, "Narangdas Kadam", 2898.80, '2025-07-29'),
                          (9, 2, "Ganpat Rao", 2357.96, '2025-08-05'),
                          (10, 2, "Martin Cary", 1056.54, '2025-08-07'),
                          (11, 3, "Shrikant Desai", 1500.65, '2025-08-10'),
                          (12, 4, "Jay Raj", 15500.32, '2025-08-12');
SELECT * FROM orders;

/*Q1. List all orders with restaurant names.*/
SELECT order_id, customer_name, AMOUNT, order_date, restaurant_name, location 
FROM orders O INNER JOIN restaurant R ON O.restaurant_id = R.restaurant_id;

/*Q2. Show restaurant names with their order amounts*/
SELECT order_id, AMOUNT, restaurant_name 
FROM orders O INNER JOIN restaurant R ON O.restaurant_id = R.restaurant_id 
ORDER BY O.order_id ASC;

/*Q3. Find all orders placed at Chaupathy*/
SELECT order_id, customer_name, AMOUNT, restaurant_name, location 
FROM orders O INNER JOIN restaurant R ON O.restaurant_id = R.restaurant_id 
WHERE location LIKE "Cha%" ORDER BY O.order_id ASC;

/*Q4. Get total sales sum of amounts for each restaurant*/
SELECT restaurant_name, location , SUM(O.AMOUNT) AS Total_amount
FROM orders O INNER JOIN restaurant R ON O.restaurant_id = R.restaurant_id 
GROUP BY restaurant_name, location;

/*Q5. Find restaurant that have no orders*/
SELECT order_id, customer_name, restaurant_name, location
FROM restaurant R LEFT JOIN orders O  ON R.restaurant_id = O.restaurant_id 
WHERE O.order_id IS NULL;

/*Q6. Show restaurant and order details*/
SELECT order_id, customer_name, AMOUNT, order_date, restaurant_name, location 
FROM restaurant R RIGHT JOIN orders O  ON R.restaurant_id = O.restaurant_id;
