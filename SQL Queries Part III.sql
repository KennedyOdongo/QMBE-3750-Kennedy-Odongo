USE bits_copy;

SHOW TABLES;

# ORDER BY USING MULTIPLE COLUMNS
SELECT * 
FROM client
ORDER BY balance DESC, creditlimit ASC;

SELECT * 
FROM client
ORDER BY balance DESC;

SELECT street, city
FROM client
ORDER BY 1 DESC, 2 DESC;

#Math functions in SQL

SELECT ABS(balance) as abs_balance, clientname
from client;

SELECT LOG(creditlimit) as log_credit, zipcode
from client;

select *
from consultant;

SELECT POW(Rate, 2) as rate_squared
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

#SUBSTRING(string, start, length)
SELECT SUBSTRING(city,1,3) as substring_text
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
FROM client;

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


#CASE WHEN
# The CASE expression goes through conditions and returns a value when the first 
#condition is met (like an if-then-else statement). So, once a condition is true, 
#it will stop reading and return the result. If no conditions are true, 
#it returns the value in the ELSE clause.

If there is no ELSE part and no conditions are true, it returns NULL.