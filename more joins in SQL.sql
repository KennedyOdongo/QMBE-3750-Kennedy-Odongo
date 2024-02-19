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
-- Syntax
-- CREATE FUNCTION [database_name.]function_name (parameters)
-- RETURNS data_type AS
-- BEGIN
--     SQL statements
 --    RETURN value
-- END;
    
-- ALTER FUNCTION [database_name.]function_name (parameters)
-- RETURNS data_type AS
-- BEGIN
 --   SQL statements
-- RETURN value
-- END;
    
-- DROP FUNCTION [database_name.]function_name;