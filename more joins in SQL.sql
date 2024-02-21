-- Integrity: Entity Integrity and Referential integrity
-- 
USE bits;
SELECT *
FROM client;

SELECT * 
FROM workorders;

SELECT * 
FROM client a
JOIN workorders b ON a.clientnum = b.clientnum;



-- A self-join in SQL is a join in which a table is joined with itself. 
-- This technique is useful when you want to query hierarchical data,
-- compare rows within the same table, or aggregate data across related 
-- rows within the same table. Since you're essentially dealing with one table, aliases 
-- are used to differentiate the "two instances" of the same table within the query.

-- syntax
-- SELECT column_name(s)
-- FROM table1 T1, table1 T2
-- WHERE condition;

SELECT c1.clientname,c1.city, c2.clientname,c2.city
FROM client c1, client c2;

-- alternative syntax
-- SELECT A.column_name, B.column_name
-- FROM table_name AS A
-- JOIN table_name AS B ON A.common_field = B.common_field
-- WHERE condition;

SELECT c1.clientname, c1.city, c2.clientname, c2.city
FROM client c1
JOIN client c2 ON c1. clientnum =  c2.clientnum;


-- JOIN tables from multiple databases
-- syntax

-- SELECT *
-- FROM schema_a.table_a JOIN schema_b.table_b
-- ON schema_a.table_a.column_a = schema_b.table_b.column_b

SELECT *
FROM bits.workorders JOIN bits_copy.client
ON bits.workorders.ClientNum=  bits_copy.client.ClientNum;


SELECT *
FROM bits.workorders a
JOIN bits_copy.client b
ON a.ClientNum = b.ClientNum;

-- alternative syntax
SELECT *
FROM bits.workorders JOIN bits_copy.workorders
USING (clientnum);


-- Functions in SQL
-- User-Defined Functions (UDFs) in SQL are functions created by users to perform
-- operations that are not available through built-in SQL functions. 
-- UDFs can return scalar values, tables,
--  or both, depending on their type and the specific needs they address.


-- Syntax
-- CREATE FUNCTION func_name (parameters)
-- RETURNS return_type
-- BEGIN
-- function body
-- END;
-- USE bits;

-- SET GLOBAL log_bin_trust_function_creators = 1; -- Do not do this with the original data base
-- always work with a copy of your DB
 -- USE bits;

-- DELIMITER $$
-- This sets the delimiter to "$$" instead of the default ";" 
-- so that the function definition can include semicolons without causing errors.

-- DELIMITER $$:
-- This sets the delimiter to "$$" instead of the default ";" so that the function definition can include semicolons without causing errors.
-- CREATE FUNCTION:
-- This creates a new function that takes two integer parameters (a and b).
-- BEGIN:
-- This is the start of block of code that defines what the function does.
-- RETURN a + b;:
-- This is the actual logic of the function. 
-- It adds the two parameters (a and b) together and returns the result.
-- END$$:
-- This marks the end of the function definition block.
-- DELIMITER ; This resets the delimiter to ";"

-- Creating a function to add two parameters a and b

DELIMITER $$

-- CREATE FUNCTION ADD_NUM(a INT, b INT) RETURNS INT
-- BEGIN
-- RETURN a + b;
-- END $$

DELIMITER ;


-- SELECT ADD_NUM(10, 12);
DELIMITER //
-- CREATE FUNCTION average_balance() RETURNS INT
 -- BEGIN
 --  DECLARE result INT;
-- SET result = (SELECT AVG(`balance`) FROM bits.client);
-- RETURN result;
-- END //


SELECT bits.average();

DELIMITER $$


-- SHOW available functions in the database
SHOW FUNCTION STATUS;

-- Functions are database specific.
USE sports;

SELECT bits.average();
