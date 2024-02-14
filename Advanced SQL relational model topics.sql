-- In SQL, a view is a virtual table that contains data from one or more tables. 
-- Views have rows and columns, similar to a real table, but they don't hold any data.
-- A view only stores the SQL query. 
-- Thus, it does not occupy physical space for data storage.
-- Whenever you query a view, the database runs the underlying SQL query to produce the result set.

USE bits;

SHOW TABLES;

-- syntax
-- CREATE VIEW view_name AS
-- SELECT columns_from_table_in _DB
-- FROM atble_in _DB
-- WHERE column_in table><== condition;


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
-- It is the main mechanism for increasing the efficiency with which data is retreived from a database table
-- An index is a database-generated copy of a selected column organized so that it directly refers to the 
-- storage location of the data
-- As a data structure indexes are used to improve the execution time of queries and searches
-- in large databases
-- indexes are assigned automatically and used internally by the DBMS, not by its users
-- The columns or combination of columns on which the index is built is called the index-key

-- syntax
-- CREATE INDEX index_name
-- ON table(column_in_table);

CREATE INDEX clientname
ON client (clientname);

SELECT * 
FROM client;



