USE bits_copy;

SHOW TABLES;

SELECT * 
FROM orderline;

# ORDER BY USING MULTIPLE COLUMNS
SELECT * 
FROM client
ORDER BY balance DESC, creditlimit ASC;

SELECT * 
FROM client
ORDER BY balance DESC;

SELECT * 
FROM client
ORDER BY balance DESC, city ASC;


SELECT * 
FROM client
ORDER BY city DESC;


SELECT *
FROM client
ORDER BY 1 DESC, 2 DESC;

#Math functions in SQL

SELECT ABS(balance) AS abs_balance, clientname
FROM client;

SELECT LOG(creditlimit), zipcode
FROM client;

select *
from consultant;

SELECT rate*hours 
FROM consultant;

SELECT POW(Rate, 2.5) as rate_squared
from consultant;

SELECT SQRT(Rate) as square_root_rate
FROM consultant;

#### String functions

SELECT UPPER(street) as street_upper
from consultant;

SELECT LOWER(street) as street_upper
from consultant;

SELECT REVERSE (clientname) as reverse_client
from client;

# If you do not rename the column it will show up as the function
SELECT LEFT (city, 3) 
FROM client;

SELECT REVERSE (clientname) as reverse_client
FROM client;

#2/8/2024
#SUBSTRING(string, start, length)
SELECT SUBSTRING(city,2,3) as substring_text
FROM client;

#CONCAT- Merge columns
#CONCAT(string1, string2, ...., string_n)
#Can use to create primary key and unique identifiers

SELECT CONCAT(city, street) as city_street
FROM client;

SELECT CONCAT(clientnum, zipcode) as clientnum_zip
FROM client;

#CHAR_LENGTH(string)
SELECT CHAR_LENGTH (street) as longest_street_name
FROM client
ORDER BY 1 DESC
LIMIT 1;

select * from client;

#Aggregate / Groupby functions

SELECT SUM(balance) AS total_balance
FROM client;

SELECT AVG(creditlimit) AS credit_balance
FROM client;

SELECT AVG(creditlimit) AS credit_balance, creditlimit
FROM client
GROUP BY creditlimit;

# using column indexing
SELECT COUNT(*) AS credit_limit_per_client, creditlimit
FROM client
GROUP BY 2;

#The ROLLUP operator enhances the capabilities of the GROUP BY 
#clause by enabling the computation of subtotals and grand
#totals for a set of columns. It produces a result set that
#incorporates rows at various levels of aggregation. 
#ROLLUP streamlines the aggregation process by 
#eliminating the need for separate queries to obtain
#subtotals and totals, resulting in a more streamlined and efficient approach.
#It is a powerful extension of the GROUP BY clause, 
#enabling users to generate summary reports effortlessly.

#ROLLUP
SELECT AVG(creditlimit) AS credit_limit_avg, creditlimit
FROM client
GROUP BY ROLLUP(2);

SELECT AVG(Creditlimit)
from client;

SHOW TABLES;

SELECT * 
FROM client;


SELECT SUM(balance) AS total_balance, creditlimit
FROM client
GROUP BY ROLLUP(2);

SELECT SUM(balance)
FROM client;

#CASE WHEN
# The CASE expression goes through conditions and returns a value when the first 
#condition is met (like an if-then-else statement). So, once a condition is true, 
#it will stop reading and return the result. If no conditions are true, 
#it returns the value in the ELSE clause.If there is no ELSE part 
#and no conditions are true, it returns NULL.

# This is similar to "if then" statement in other programming languages
#Syntax

#CASE
    #WHEN condition1 THEN result1
    #WHEN condition2 THEN result2
    #WHEN conditionN THEN resultN
    #ELSE result
#END;

SELECT CreditLimit,
CASE
    WHEN CreditLimit<= 2500 THEN "bad credit"
    WHEN  CreditLimit<= 5000 THEN "okay credit"
    WHEN CreditLimit<= 7500 THEN "better credit"
    ELSE "good credit"
END AS credit_rating
FROM client;

# CASE WHEN with Aggregations
### Count number of rows that meet a certain condition

SELECT 
  CASE
   WHEN CreditLimit<= 2500 THEN "bad credit"
    WHEN  CreditLimit<= 5000 THEN "okay credit"
    WHEN CreditLimit<= 7500 THEN "better credit"
    ELSE "good credit"
END AS credit_rating,
AVG(creditlimit) as average_credit
FROM client
GROUP BY
  CASE
  WHEN CreditLimit<= 2500 THEN "bad credit"
    WHEN  CreditLimit<= 5000 THEN "okay credit"
    WHEN CreditLimit<= 7500 THEN "better credit"
    ELSE "good credit"
  END;
  
  SELECT creditlimit
  FROM client;
  
  
  SELECT 
  CASE
   WHEN CreditLimit<= 2500 THEN "bad credit"
    WHEN  CreditLimit<= 5000 THEN "okay credit"
    WHEN CreditLimit<= 7500 THEN "better credit"
    ELSE "good credit"
END AS credit_rating,
COUNT(*) as number_of_creditors
FROM client
GROUP BY
  CASE
  WHEN CreditLimit<= 2500 THEN "bad credit"
    WHEN  CreditLimit<= 5000 THEN "okay credit"
    WHEN CreditLimit<= 7500 THEN 'better credit'
    ELSE "good credit"
  END;
  
  SELECT * 
  FROM client;
 
 #Single quotes vs. double quotes.
  
  SELECT city,CASE
  WHEN city IN ('Easton','Sunland', 'Lizton') THEN "Region 1"
  WHEN city IN ('Harpersburg','Amo') THEN "Region 2"
  ELSE "Region 3"
  END AS 'region'
  FROM client;
  
  
#ORDER BY CASE
#Sort by city, and clientname but if city is Easton, then sort by city then zipcode
SELECT *
FROM client
ORDER BY city,
    CASE
        WHEN city = "Easton" THEN zipcode
        ELSE clientname
    END;
    
    
SELECT *
FROM tasks;

# ORDER BY category, then description. But if category  ='SOM' then order by category then price
SELECT *
FROM tasks
ORDER BY category,
    CASE
        WHEN category = "SOM" THEN price
        ELSE description
    END;
    
#SUBQUERIES IN SQL -> Query within a query

SELECT client.*
  FROM (
        SELECT *
          FROM client
         WHERE creditlimit =  5000
       ) client
 WHERE LEFT(city,1) <> 'A' ;
 
SELECT *
FROM client
WHERE creditlimit =  5000;


SELECT * FROM tasks;

SELECT * FROM
(SELECT * FROM tasks
WHERE price<=65) tasks
WHERE category = 'DRM';

SELECT * 
FROM tasks
WHERE price<=65 AND category = 'DRM';

SELECT * FROM tasks
WHERE price<=65;

SHOW TABLES;



#JOINS
# Identify the primary key and foreign key
# select rows by table.column name syntax

SELECT client.clientnum, client.clientname, consultant.consltnum
FROM client # This is your left table
JOIN consultant ON client.consltnum=consultant.consltnum; # This is your right table

SELECT client.clientnum, client.clientname, consultant.consltnum
FROM client
INNER JOIN consultant ON client.consltnum=consultant.consltnum;

#referencing tables

SELECT a.clientnum, a.clientname, b.consltnum
FROM client a # a refers to the client tables
INNER JOIN consultant b ON a.consltnum=b.consltnum; # b refers to the consultant's table  


SELECT client.clientnum, client.clientname, consultant.consltnum
FROM client #left table
LEFT JOIN consultant ON client.consltnum=consultant.consltnum;


SELECT client.clientnum, client.clientname, consultant.consltnum
FROM client
RIGHT JOIN consultant ON client.consltnum=consultant.consltnum;

SELECT client.clientnum, client.clientname, consultant.consltnum
FROM client
CROSS JOIN consultant ON client.consltnum=consultant.consltnum;

# A different syntax.
SELECT client.clientnum, client.clientname, consultant.consltnum
FROM client
JOIN consultant 
USING (consltnum);

#Joining two or more tables is called a complex join - A join is a merge

SELECT w.ordernum, w.orderdate, c.clientnum, c.clientname, 
o.taskid, t.description, t.category, t.price
FROM workorders w, client c, tasks t, orderline o
WHERE c.clientnum = w.clientnum # 1st JOIN workorders and client
AND w.ordernum = o.ordernum #2nd JOIN workorders and oderline
AND o.taskid = t.taskid #3rd JOIN orderline and task table
ORDER BY w.ordernum;

#A union is like append


SELECT c.clientnum, c.clientname
FROM client c
WHERE consltnum = 19;

SELECT c.clientnum, c.zipcode
FROM client c, workorders w
WHERE c.clientnum =  w.clientnum;

SELECT c.clientnum, c.clientname
FROM client c
WHERE consltnum = 19
UNION
SELECT c.clientnum, c.clientname
FROM client c, workorders w
WHERE c.clientnum =  w.clientnum;

#Common Table Expressions (CTE)
#In SQL, CTE stands for Common Table Expression. 
#It's a temporary result set that's returned 
#by a single statement and can only be 
#used within the context of a larger query

SELECT *
FROM client;

SELECT
  clientname,
  balance
FROM
  client
WHERE
-- filter for clients with above-average balances
  balance > (
    SELECT
      AVG(balance)
    FROM
      client
  );
  
  
WITH client_balances AS (
SELECT clientnum, AVG(balance) as average_balance
FROM client c
GROUP BY clientnum)


SELECT w.clientnum, w.orderdate, c.average_balance
FROM workorders w
JOIN client_balances c
ON w.clientnum = c.clientnum;
SELECT clientnum, AVG(balance) as average_balance
FROM client c
GROUP BY clientnum;

SHOW TABLES;
