USE bits_copy;

SHOW TABLES;

# ORDER BY USING MULTIPLE COLUMNS
SELECT * 
FROM client
ORDER BY balance DESC, creditlimit ASC;

SELECT * 
FROM client
ORDER BY balance DESC;

SELECT * 
FROM client
ORDER BY balance DESC, zipcode DESC;

#Math functions in SQL

SELECT ABS(balance) as abs_balance, clientname
from client;

SELECT LOG(creditlimit) as log_credit, zipcode
from client;


