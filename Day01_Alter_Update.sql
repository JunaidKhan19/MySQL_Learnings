CREATE TABLE product_details (
    Id INT NOT NULL PRIMARY KEY, 
    Product_id VARCHAR(25) NOT NULL UNIQUE, 
    p_name VARCHAR(25) NOT NULL, 
    p_price FLOAT DEFAULT(0.0), 
    p_company VARCHAR(25) NOT NULL, 
    p_quantity INT DEFAULT(0), 
    available BOOL DEFAULT("false")
);

INSERT INTO product_details VALUES (1, "MO200", "Monitors", 2500, "DELL", 9, true),(2, "MS205", "Mouse", 500, "DELL", 10, true),
								   (3, "PS309", "PS-5", 3500, "NVIDIA", 4, true),(4, "CP852", "CPU", 10000, "DELL", 5, false),
                                   (5, "KB295", "Keyboard", 800, "ASUS", 8, true),(6, "GCC61", "Graphic Card", 10000, "NVIDIA", 2, false),
                                   (7, "PRJ567", "Projector", 5000, "PHILLIPS", 1, true),(8, "MO890", "Monitors", 2600, "HP", 0, false),
                                   (9, "CP893", "CPU", 6000, "HORIZON", 7, true),(10, "KB258", "Keyboard", 1000, "DELL", 4, true);

ALTER TABLE product_details ADD (City VARCHAR(25) NOT NULL, Pincode INT NOT NULL);

UPDATE product_details SET City = "Mumbai" , Pincode = 400001 WHERE Id = 1; 
UPDATE product_details SET City = "Pune" , Pincode = 400002 WHERE Id = 2; 
UPDATE product_details SET City = "Kalyan" , Pincode = 400003 WHERE Id = 3; 
UPDATE product_details SET City = "Nagpur" , Pincode = 400004 WHERE Id = 4; 
UPDATE product_details SET City = "Nashik" , Pincode = 400005 WHERE Id = 5; 
UPDATE product_details SET City = "Dandi" , Pincode = 400006 WHERE Id = 6; 
UPDATE product_details SET City = "Nagpur" , Pincode = 400007 WHERE Id = 7; 
UPDATE product_details SET City = "Mumbai" , Pincode = 400008 WHERE Id = 8; 
UPDATE product_details SET City = "New Delhi" , Pincode = 400009 WHERE Id = 9; 
UPDATE product_details SET City = "Mumbai", Pincode = 400010 WHERE Id = 10; 

SELECT * FROM product_details WHERE available = 0;

SELECT * FROM product_details WHERE p_company IN (
    SELECT p_company FROM product_details GROUP BY p_company HAVING COUNT(*) > 1
);

TRUNCATE product_details;

DROP TABLE product_details;