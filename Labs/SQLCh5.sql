use tsqlv4;
Name: TSQL Lab 05 Table Expressions

Author: Derek Cobb

Date: July 22, 2019

--1.
SELECT * 
FROM (SELECT orderid, orderdate, custid, empid,
   DATEFROMPARTS(YEAR(orderdate), 12, 31) AS endofyear
FROM Sales.Orders) AS T
WHERE T.orderdate <> T.endofyear;

with T as
(SELECT orderid, orderdate, custid, empid,
   DATEFROMPARTS(YEAR(orderdate), 12, 31) AS endofyear
FROM Sales.Orders)
Select * from T where T.orderdate <> T.endofyear;

--2.
select o.empid, max(o.orderdate) as maxorderdate
from sales.orders o
GROUP BY o.empid;

--3.
select o.empid, o.orderdate, o.orderid, o.custid
from sales.orders o inner join
(select o2.empid, max(o2.orderdate) as max from sales.orders o2 group by o2.empid) T
on o.empid = T.empid
where o.orderdate = T.max
group by o.empid, o.orderdate, o.orderid, o.custid
order by o.empid desc;

--or

select o.empid, o.orderdate, o.orderid, o.custid
from sales.orders o inner join
(select o2.empid, max(o2.orderdate) as max from sales.orders o2 group by o2.empid) T
on o.empid = T.empid and o.orderdate = T.max;

