# Create a database with your name. This is where we will create and store tables
USE Kennedy;
SHOW TABLES;
CREATE TABLE class ( students varchar (255),age int, height float);

#Show tables available in a database
SHOW TABLES;

#DROP TABLE table_name;
DROP TABLE class;

INSERT INTO class (students, age, height)
values('Kennedy Odongo', '1000', '4.5');

SELECT *
FROM kennedy.class;

## Create a new attribute using AS keyword

SELECT students, height*2 AS height_squared
FROM kennedy.class;




