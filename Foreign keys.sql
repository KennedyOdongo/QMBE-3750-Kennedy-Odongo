USE bits;
-- One to many relationship

SELECT * FROM client;

SELECT * FROM consultant;

-- Many to many relationship
USE colonial;
SHOW TABLES;

SELECT *
FROM customer;

SELECT * 
FROM trip;

SELECT *
FROM reservation;


-- 2ND Normal Form
USE bits;
SHOW TABLES;

SELECT * 
FROM workorders;

SELECT *
FROM tasks;

SELECT * FROM
orderline;
