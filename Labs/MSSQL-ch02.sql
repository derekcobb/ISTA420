 -- Name: SQL-lab-2.sql
 -- Author: Derek Cobb
 -- Date: July 9, 2019

 use tsqlv4;
 -- 1.
 select top 20 orderid, orderdate, custid, empid from sales.orders where year(orderdate) = 2015 and month(orderdate) = 6;
 
 --2.
 select orderid, orderdate, custid, empid from sales.orders where orderdate = eomonth(orderdate);

 --3. 
 select empid, firstname, lastname from hr.employees where lastname like '%e%e%';.

 --4.

 select orderid, sum(unitprice * qty) as totalvalue 
	from sales.orderdetails 
	group by orderid 
	having sum(unitprice * qty) > 10000 
	order by totalvalue desc;

 --5.
