USE sakila;
show tables;

SHOW TABLES;

# Create a database with your name. This is where we will create and store tables
USE Kennedy;

SHOW TABLES;
CREATE TABLE class ( students varchar (255),age int, height float);

SHOW TABLES;
#DROP TABLE table_name;
DROP TABLE class;

INSERT INTO class (students, age, height)
values('Kennedy Odongo', '1000', '4.5');

SELECT *
FROM kennedy.class;




