USE bits;

SHOW TABLES;

# For the most part you dont want to use * when selecting columns
#1. Not specific enough
#2. May take long to run if you have a large dataset
SELECT *
FROM tasks;

# a specific select statement
SELECT price, taskid
FROM tasks;

SELECT price, category
FROM tasks
WHERE category = 'DRM';

SELECT price,category
FROM tasks
WHERE price >= 50
GROUP BY price,category
HAVING ABS(price)>40
ORDER BY price
LIMIT 10;


SELECT price,category
FROM tasks
WHERE price BETWEEN 10 AND 100
GROUP BY category
HAVING ABS(price)>40
ORDER BY price
LIMIT 10;

# What happens if the order of the queries is reversed? 
SELECT price,category
FROM tasks
WHERE price BETWEEN 10 AND 100
GROUP BY category
HAVING ABS(price)>40
ORDER BY price
LIMIT 10;
