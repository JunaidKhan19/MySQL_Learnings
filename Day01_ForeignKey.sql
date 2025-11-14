USE junaid_db;
CREATE TABLE Bank(Id INT PRIMARY KEY, IFSC_code VARCHAR(25) NOT NULL UNIQUE, branch_name VARCHAR(25) NOT NULL);
INSERT INTO Bank VALUES (1, "ICICI Bank", "okicici@mail.com"), (2, "Kotak Mahindra Bank", "kotakmb@mail.com"), (3, "State Bank of India", "sbisend@mail.com");
SELECT * FROM Bank;

CREATE TABLE Branches (Id INT PRIMARY KEY , IFSC_code VARCHAR(25) NOT NULL UNIQUE, branch_name VARCHAR(25) NOT NULL);
INSERT INTO Branches VALUES (1, "KOK0001", "Colaba"),
							(2, "SBI1001", "Colaba"),
                            (3, "ICICI01", "Mantralay"),
                            (4, "KOK0002", "Mantralay"),
                            (5, "ICICI02", "CST"),
                            (6, "SBI1002", "CST"),
                            (7, "ICICI03", "Dadar"),
                            (8, "KOK0003", "Dadar"),
                            (9, "SBI1003", "Dadar"),
                            (10, "ICICI04", "Mahim"),
                            (11, "SBI1004", "Mahim"),
                            (12, "ICICI05", "Bandra"),
                            (13, "KOK0004", "Juhu"),
                            (14, "SBI1005", "Juhu"),
                            (15, "KOK0005", "Andheri");
SELECT * FROM Branches;

ALTER TABLE Branches ADD bank_ref INT;
ALTER TABLE Branches ADD CONSTRAINT fk_bank_ref FOREIGN KEY (bank_ref) REFERENCES Bank(ID);
DESC Branches;

UPDATE Branches SET bank_ref = 1 WHERE Id = 3;
UPDATE Branches SET bank_ref = 1 WHERE Id = 5;
UPDATE Branches SET bank_ref = 1 WHERE Id = 7;
UPDATE Branches SET bank_ref = 1 WHERE Id = 10;
UPDATE Branches SET bank_ref = 1 WHERE Id = 12;
UPDATE Branches SET bank_ref = 2 WHERE Id = 1;
UPDATE Branches SET bank_ref = 2 WHERE Id = 4;
UPDATE Branches SET bank_ref = 2 WHERE Id = 8;
UPDATE Branches SET bank_ref = 2 WHERE Id = 13;
UPDATE Branches SET bank_ref = 2 WHERE Id = 15;
UPDATE Branches SET bank_ref = 3 WHERE Id = 2;
UPDATE Branches SET bank_ref = 3 WHERE Id = 6;
UPDATE Branches SET bank_ref = 3 WHERE Id = 9;
UPDATE Branches SET bank_ref = 3 WHERE Id = 11;
UPDATE Branches SET bank_ref = 3 WHERE Id = 14;

SELECT * FROM Branches;