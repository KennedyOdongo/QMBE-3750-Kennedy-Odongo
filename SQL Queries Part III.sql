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


