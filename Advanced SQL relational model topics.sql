-- In SQL, a view is a virtual table that contains data from one or more tables. 
-- Views have rows and columns, similar to a real table, but they don't hold any data.

-- In SQL, a table is a physical data storage unit that stores data in a structured format.
-- A view is a virtual table that provides a simplified interface for accessing data from one or more tables.

USE bits;

SHOW TABLES;

CREATE VIEW Hardware AS
SELECT taskid, description, price
FROM tasks
WHERE category IN ('ACC','HAM','PRI','UPG');

SELECT * 
FROM hardware; -- when you run this query, the DBMS actually runs the code above

CREATE or REPLACE VIEW Hardware AS
SELECT taskid, description, price
FROM tasks
WHERE category IN ('ACC','HAM','PRI','UPG','OTH');



# INDEXES



