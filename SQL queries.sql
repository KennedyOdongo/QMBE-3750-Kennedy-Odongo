USE bits;

SHOW TABLES;

SELECT *
FROM tasks;

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
GROUP BY price,category
HAVING ABS(price)>40
ORDER BY price
LIMIT 10;