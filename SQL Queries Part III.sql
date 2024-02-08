USE bits_copy;

SHOW TABLES;

SELECT * 
FROM client;

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
# incorporates rows at various levels of aggregation. 
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
#it returns the value in the ELSE clause.If there is no ELSE part and no conditions are true, it returns NULL.

# This is similar to "if then" statement in other programming languages
#Syntax

#CASE
    #WHEN condition1 THEN result1
    #WHEN condition2 THEN result2
    #WHEN conditionN THEN resultN
    #ELSE result
#END;

select * from
client;

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
    WHEN CreditLimit<= 7500 THEN "better credit"
    ELSE "good credit"
  END;