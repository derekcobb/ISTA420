--Name: tsql-ch08a.sql
--Author: Derek Cobb
--Date: July 30, 2019

---------------------------------------------------------------------
-- Microsoft SQL Server T-SQL Fundamentals
-- Chapter 08 - Data Modification
-- Exercises
-- © Itzik Ben-Gan 
---------------------------------------------------------------------

-- The database assumed in the exercise is TSQLV4

-- 1
-- Run the following code to create the dbo.Customers table
-- in the TSQLV4 database
USE TSQLV4;

DROP TABLE IF EXISTS dbo.Customers;

CREATE TABLE dbo.Customers
(
  custid      INT          NOT NULL PRIMARY KEY,
  companyname NVARCHAR(40) NOT NULL,
  country     NVARCHAR(15) NOT NULL,
  region      NVARCHAR(15) NULL,
  city        NVARCHAR(15) NOT NULL  
);

-- 1-1
-- Insert into the dbo.Customers table a row with:
-- custid:  100
-- companyname: Coho Winery
-- country:     USA
-- region:      WA
-- city:        Redmond

INSERT INTO dbo.customers Values (100, 'CohoWinery','USA','WA','Redmond');

select * from dbo.customers;


-- 1-2
-- Insert into the dbo.Customers table 
-- all customers from Sales.Customers
-- who placed orders

INSERT INTO dbo.customers (custid, companyname, country, region, city)
Select custid, companyname, country, region, city
FROM sales.customers;

select * from dbo.customers;

-- 1-3
-- Use a SELECT INTO statement to create and populate the dbo.Orders table
-- with orders from the Sales.Orders
-- that were placed in the years 2014 through 2016

drop table if exists dbo.orders;

SELECT [custid]
      ,[empid]
      ,[orderdate]
      ,[requireddate]
      ,[shippeddate]
      ,[shipperid]
      ,[freight]
      ,[shipname]
      ,[shipaddress]
      ,[shipcity]
      ,[shipregion]
      ,[shippostalcode]
      ,[shipcountry]
INTO dbo.orders  ----------------line that was added
FROM [Sales].[Orders]  --[TSQLV4].[Sales].[Orders]
WHERE orderdate >= '2014-01-01' and orderdate <= '2016-12-31';

SELECT *
FROM dbo.orders;
-- 2
--Credit Card Defaults

Create table Defaults (  --- ensure column headings match exactly
ID int, 
Limit_Bal int, 
Sex int, 
Education int, 
Marriage int, 
Age int, 
Pay_0 int, 
Pay_2 int, 
Pay_3 int, 
Pay_4 int, 
Pay_5 int, 
Pay_6 int, 
Bill_Amt1 int, 
Bill_Amt2 int, 
Bill_Amt3 int, 
Bill_Amt4 int, 
Bill_Amt5 int, 
Bill_Amt6 int, 
Pay_Amt1 int, 
Pay_Amt2 int, 
Pay_Amt3 int, 
Pay_Amt4 int, 
Pay_Amt5 int, 
Pay_Amt6 int, 
default_payment int); --with auto increment option for primary key

select * from Defaults;

bulk insert Defaults
from 'C:\Users\verit\ISTA420\Labs\default-of-credit-card-clients.csv'  ----pay attention to the data file type
WITH (
firstrow = 2,  --- have to set firstrow equal to '2' because the first row consists of column headings
rowterminator = '\n',
fieldterminator = ',');

Select * from Defaults;

Select education from defaults;

drop table if exists Containers;

Create table Containers (
Speed int,
Angle int,
PowerA int);

select * from Containers;

bulk insert Containers
from 'C:\Users\verit\ISTA420\Labs\Container_Crane_Controller_Data_Set.csv'  ----pay attention to the data file type
WITH (
firstrow = 2,  --- have to set firstrow equal to '2' because the first row consists of column headings
rowterminator = '\n',
fieldterminator = ',');



select * from Containers;
