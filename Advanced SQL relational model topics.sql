-- In SQL, a view is a virtual table that contains data from one or more tables. 
-- Views have rows and columns, similar to a real table, but they don't hold any data.
-- A view only stores the SQL query. 
-- Thus, it does not occupy physical space for data storage.
-- Whenever you query a view, the database runs the underlying SQL query to produce the result set.

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

-- How do we know it is a virtual table?

DESCRIBE TABLE hardware;
DESCRIBE TABLE tasks;


# INDEXES



