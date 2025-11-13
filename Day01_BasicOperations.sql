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
                                   (9, "CP893", "CPU", 6000, "HORIZON", 7, true),(10, "KB258", "Keyboard", 1000, "DELL", 4, true)
;

SELECT * FROM product_details WHERE available = 0;

TRUNCATE product_details;

DROP TABLE product_details;