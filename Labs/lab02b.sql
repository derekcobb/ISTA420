.echo on

.headers on

-- Name: lab02b.sql
-- Author: Derek Cobb
-- Date: July 8, 2018

-- 1. Who are our customers in North America?

select customerid, companyname, country from customers where country in ( 'USA', 'Mexico', 'Canada');

-- 2. What orders were placed in April, 1998?

select orderid, orderdate from orders where orderdate like '1998-04%';

-- 3. What sauces do we sell?

select productID, productname from products where productname like '%sauce%';

-- 4. You sell some kind of dried fruit that I liked very much. What is its name?

select productID, productname from products where productname like '%dried%';

-- 5. What employees ship products to Germany in December?

select employeeid, shipcountry from orders where shippeddate like '%-12-%' and shipcountry like 'Germany' group by employeeid;

-- 6. We have an issue with product 19. I need to know the total amount and the net amount of all orders
for product 19 where the customer took a discount.

select productid, unitprice, quantity, unitprice * quantity, discount as totalprice, discount,
   ((unitprice * quantity) - (unitprice * quantity * discount)) as netprice 
   from order_details where productid = 19 and discount > 0;
   
-- 7. I need a list of employees by title, first name, and last name, with the employee's position under their
names, and a line separating each employee.

select titleofcourtesy || ' ' || firstname || ' ' || lastname || '
   ...> ' || title || '
   ...> ' from employees orderby lastname;

-- 8. I need a list of our customers and the first name only of the customer representative.

select substr (

-- 9. Give me a list of our customer contacts alphabetically by last name.

select contactname from customers order by substr(contactname, instr(contactname, ' ')+1) collate nocase;

-- 10. `I need a report telling me the most common pairing of customers and employees with the greatest
order volume (by the number of orders placed). Exclude pairings with minimal orders.