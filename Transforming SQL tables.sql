USE bits_copy;
SHOW TABLES;

SELECT * 
FROM tasks;

#creating a new table from an existing table
CREATE TABLE category_drm AS
SELECT *
FROM tasks
WHERE category = 'DRM';

SELECT * 
FROM category_drm;

### Adding or dropping a column

ALTER TABLE category_drm
ADD COLUMN email VARCHAR(255);

SELECT *
FROM category_drm;

#To change a column's data type or constraints, 
#use ALTER TABLE with the MODIFY COLUMN or ALTER COLUMN 

ALTER TABLE category_drm
MODIFY COLUMN email VARCHAR(320); -- MySQL

-- For SQL Server, the command is ALTER COLUMN
-- ALTER TABLE employees
-- ALTER COLUMN email NVARCHAR(320);

#### Drop column
ALTER TABLE category_drm
DROP COLUMN email;

# summarizing data into a new table
CREATE TABLE tasks_number AS
SELECT taskid, COUNT(*) AS task_count
FROM tasks
GROUP BY taskid;

SELECT *
FROM tasks_number;

SELECT *
FROM category_drm;

# updating table
UPDATE category_drm
SET email = 'new.email@example.com'
WHERE TaskID = 'DA11';

DELETE FROM category_drm
WHERE TaskID = 'DA11';




