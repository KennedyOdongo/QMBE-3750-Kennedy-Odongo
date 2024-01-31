USE kennedy_odongo;

SHOW TABLES;

CREATE TABLE students(age int, height float, city varchar (255));

DESCRIBE TABLE students;

SELECT *
FROM kennedy_odongo.students;

INSERT INTO students ( age, height, city) VALUES ('10', '5.11','Doha');


