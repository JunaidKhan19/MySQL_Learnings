USE junaid_db;

SELECT * FROM Bank;
SELECT * FROM Branches;
DESC Branches;

SELECT * FROM Branches WHERE IFSC_code LIKE 'ICICI%';
SELECT * FROM Branches WHERE IFSC_code LIKE 'KOK%';
SELECT * FROM Branches WHERE IFSC_code LIKE 'SBI%';