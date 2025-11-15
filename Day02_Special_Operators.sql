USE junaid_db;

CREATE TABLE customer_details(customer_id INT PRIMARY KEY, cust_name VARCHAR(25), email VARCHAR(30), city VARCHAR(25), phone VARCHAR(10) NOT NULL UNIQUE);
INSERT INTO customer_details VALUES (1, "Akanksha Thakur", "akthakur1243@gmail.com", "Jaipur", "9865241789"),
									(2, "Amit Verma", "amtver5467@yahoomail.com", "Raibareli", "9865421872"),
                                    (3, "Anisha Srivardhan", "anisri8760@yahoomail.com", "Jamnagar", "8689456213"),
                                    (4, "Arjun Kapoor", "arjunkapoor4398@onemail.com", "Mumbai", "9946855423"),
                                    (5, "Birjunath Sai", "birjusai777@gmail.com", "Pune", "9854876254"),
                                    (6, "Deepak Nair", "deepaknair@onemail.com", "Hyderabad", "8965231479"),
                                    (7, "Divya Singh", "divyasingh@onemail.com", "Nagpur", "8953479126"),
                                    (8, "Ganpat Rao", "ganpatr5643@yahoomail.com", "Rampur", "9848065271"),
                                    (9, "Jagdeep Dhillon", "jagdhillon2845@gmail.com", "Bhopal", "9846857924"),
                                    (10, "Jay Raj", "jayraj7648@gmail.com", "Mumbai", "9619657845"),
                                    (12, "Karan Mehta", "mehtakaran77568@gmail.com", "Mumbai", "9969704852"),
                                    (13, "Kavita Joshi", "kavita6587@onemail.com", "Raibareli", "9896521564"),
                                    (14, "Meena Yadav", "yadavmeena@onemail.com", "Raigad", "9148652347"),
                                    (15, "Mohini Pandey", "mohinipandey12@yahoomail.com", "Bareli", "8659542134"),
                                    (16, "Narangdas Kadam", "kadamnarang87@onemail.com", "Jaipur", "9898568425"),
                                    (17, "Neha Kulkarni", "kulneha4387@onemail.com", "Bhopal", "8945281563"),
                                    (18, "Nikhil Kamat", "nikhilkamat5609@gmail.com", "Aazadnagar", "8601254789"),
                                    (19, "Pooja Patil", "papooja9876@gmail.com", "Daman Diu", "9835648756"),
                                    (20, "Priya Rai", "priyarai@onemail.com", "Mumbai", "9965234895"),
                                    (21, "Sameer Shaikh", "samsk7653@yahoomail.com", "Bhopal", "9823456791"),
                                    (22, "Shalini Gupta", "guptashalini@yahoomail.com", "Bareli", "9825803771"),
                                    (23, "Shrikant Desai", "sridesai1098@yahoomail.com", "Nagpur", "9678786541"),
                                    (24, "Sneha Goshal", "guptasneha234@gmail.com", "Pune", "8696328147"),
                                    (25, "Rajeev Khanna", "rajeevk9854@gmail.com", "Mumbai", "8624976314"),
                                    (26, "Ramesh Tiwari", "ramtivari67083@onemail.com", "Jaipur", "9832758468"),
                                    (27, "Ritika Sharma", "rtikas2349@yahoomail.com", "Raigad", "8692358787"),
                                    (28, "Vaishnavi Tamboli", "vaishnav76542@gmail.com", "Jamnagar", "985201734"),
                                    (29, "Vibha Nadre", "nadrevibha@onemail.com", "Jaipur", "9890367048"),
                                    (30, "Vishvas Agarwal", "vishvasag8952@yahoomail.com", "Raigad", "8901478963");

SELECT * FROM customer_details;

/*Q1. Name starts with 'A'*/
SELECT * FROM customer_details WHERE cust_name LIKE "A%";

/*Q2. City ends with 'pur' (like Jaipur, Kanpur, etc...)*/
SELECT * FROM customer_details WHERE city LIKE "%pur";

/*Q3. Email contains 'gmail'*/
SELECT * FROM customer_details WHERE email LIKE "%gmail____";

/*Q4. Name contains 'an' in it (like Rohan, Ankit, Manish)  */
SELECT * FROM customer_details WHERE cust_name LIKE "%an%";

/*Q5. Phone number starts with '98'.*/
SELECT * FROM customer_details WHERE phone LIKE "98%";

/*Q6. Name is exactly 10 characters long*/
SELECT * FROM customer_details WHERE cust_name LIKE "__________";

/*Q7. City name has second letter "a" (like Nagpur, Bandha, etc) */
SELECT * FROM customer_details WHERE city LIKE "_a%";
