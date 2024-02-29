USE bits;

-- 2nd normal form

SELECT a.ordernum, a.orderdate, b.taskid, b.description, c.ScheduledDate, c.quotedprice
FROM workorders a
JOIN orderline c on a.OrderNum =  c.OrderNum
JOIN tasks b 
on c.TaskID  = b.TaskID;

-- 3rd Normal Form (3NF)
SELECT a.ClientNum, a.ClientName, a.street, a.city, a.state, a.zipcode, a.Balance, a.CreditLimit, b.ConsltNum,
b.Lastname, b.Firstname
from client a
join consultant b on a.ConsltNum = b.ConsltNum;