---------------------------------------------------------------------
-- Microsoft SQL Server T-SQL Fundamentals
-- Chapter 06 - Set Operators
-- © Itzik Ben-Gan 
---------------------------------------------------------------------

SET NOCOUNT ON
USE TSQLV4;

--2.

Select 1 AS N
UNION ALL SELECT 2
UNION ALL SELECT 3
UNION ALL SELECT 4
UNION ALL SELECT 5
UNION ALL SELECT 6
UNION ALL SELECT 7
UNION ALL SELECT 8
UNION ALL SELECT 9
UNION ALL SELECT 10

--3.

Select custid, empid FROM Sales.Orders WHERE orderdate >= '20160101' AND orderdate < '20160201'

EXCEPT

SELECT custid, empid
FROM Sales.Orders
WHERE orderdate >= '20160201' AND orderdate < '20160301';

--4.

Select custid, empid
FROM Sales.Orders
WHERE orderdate >= '20160101' AND orderdate < '20160201'

INTERSECT

Select Custid, empid
FROM Sales.Orders
WHERE orderdate >= '20160201' AND orderdate < '20160301';

--5.

Select custid, empid
FROM Sales.Orders
WHERE orderdate >= '20160101' AND orderdate < '20160201'

INTERSECT

Select custid, empid
FROM Sales.Orders
WHERE orderdate >= '20160201' AND orderdate < '20160301'

EXCEPT

Select custid, empid
FROM Sales.Orders
WHERE orderdate >= '20150101' AND orderdate < '20160101'

--6.

SELECT country, region, city
FROM (SELECT 1 AS sortcol, country, region, city
	FROM HR.Employees

	UNION ALL

	SELECT 2, country, region, city
	FROM Production.Suppliers) AS D
ORDER BY sortcol, country, region, city;






---------------------------------------------------------------------
-- The UNION Operator
---------------------------------------------------------------------

-- The UNION ALL Multiset Operator
SELECT country, region, city FROM HR.Employees
UNION ALL
SELECT country, region, city FROM Sales.Customers;

-- The UNION Distinct Set Operator
SELECT country, region, city FROM HR.Employees
UNION
SELECT country, region, city FROM Sales.Customers;

---------------------------------------------------------------------
-- The INTERSECT Operator
---------------------------------------------------------------------

-- The INTERSECT Distinct Set Operator
SELECT country, region, city FROM HR.Employees
INTERSECT
SELECT country, region, city FROM Sales.Customers;

-- The INTERSECT ALL Multiset Operator (Optional, Advanced)
SELECT
  ROW_NUMBER() 
    OVER(PARTITION BY country, region, city
         ORDER     BY (SELECT 0)) AS rownum,
  country, region, city
FROM HR.Employees

INTERSECT

SELECT
  ROW_NUMBER() 
    OVER(PARTITION BY country, region, city
         ORDER     BY (SELECT 0)),
  country, region, city
FROM Sales.Customers;

WITH INTERSECT_ALL
AS
(
  SELECT
    ROW_NUMBER() 
      OVER(PARTITION BY country, region, city
           ORDER     BY (SELECT 0)) AS rownum,
    country, region, city
  FROM HR.Employees

  INTERSECT

  SELECT
    ROW_NUMBER() 
      OVER(PARTITION BY country, region, city
           ORDER     BY (SELECT 0)),
    country, region, city
  FROM Sales.Customers
)
SELECT country, region, city
FROM INTERSECT_ALL;

---------------------------------------------------------------------
-- The EXCEPT Operator
---------------------------------------------------------------------

-- The EXCEPT Distinct Set Operator

-- Employees EXCEPT Customers
SELECT country, region, city FROM HR.Employees
EXCEPT
SELECT country, region, city FROM Sales.Customers;

-- Customers EXCEPT Employees
SELECT country, region, city FROM Sales.Customers
EXCEPT
SELECT country, region, city FROM HR.Employees;

-- The EXCEPT ALL Multiset Operator (Optional, Advanced)
WITH EXCEPT_ALL
AS
(
  SELECT
    ROW_NUMBER() 
      OVER(PARTITION BY country, region, city
           ORDER     BY (SELECT 0)) AS rownum,
    country, region, city
  FROM HR.Employees

  EXCEPT

  SELECT
    ROW_NUMBER() 
      OVER(PARTITION BY country, region, city
           ORDER     BY (SELECT 0)),
    country, region, city
  FROM Sales.Customers
)
SELECT country, region, city
FROM EXCEPT_ALL;

---------------------------------------------------------------------
-- Precedence
---------------------------------------------------------------------

-- INTERSECT Precedes EXCEPT
SELECT country, region, city FROM Production.Suppliers
EXCEPT
SELECT country, region, city FROM HR.Employees
INTERSECT
SELECT country, region, city FROM Sales.Customers;

-- Using Parenthesis
(SELECT country, region, city FROM Production.Suppliers
 EXCEPT
 SELECT country, region, city FROM HR.Employees)
INTERSECT
SELECT country, region, city FROM Sales.Customers;

---------------------------------------------------------------------
-- Circumventing Unsupported Logical Phases
-- (Optional, Advanced)
---------------------------------------------------------------------

-- Number of distinct locations
-- that are either employee or customer locations in each country
SELECT country, COUNT(*) AS numlocations
FROM (SELECT country, region, city FROM HR.Employees
      UNION
      SELECT country, region, city FROM Sales.Customers) AS U
GROUP BY country;

-- Two most recent orders for employees 3 and 5
SELECT empid, orderid, orderdate
FROM (SELECT TOP (2) empid, orderid, orderdate
      FROM Sales.Orders
      WHERE empid = 3
      ORDER BY orderdate DESC, orderid DESC) AS D1

UNION ALL

SELECT empid, orderid, orderdate
FROM (SELECT TOP (2) empid, orderid, orderdate
      FROM Sales.Orders
      WHERE empid = 5
      ORDER BY orderdate DESC, orderid DESC) AS D2;
