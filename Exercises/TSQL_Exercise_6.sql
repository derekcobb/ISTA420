-- Name: Classic Cars (Customers)

-- Author: Derek Cobb

-- Date: 12 August 2019

create database ClassicCars;

use ClassicCars;

drop table if exists Customers;

create table Customers (
	CustomerID varchar(50),
	CompanyName varchar(50),
	ContactLastName varchar(50),
	ContactFirstName varchar(50),
	ContactNumber varchar(50),
	AddressLine1 varchar(50),
	AddressLine2 varchar(50),
	City varchar(50),
	StateListed varchar(50),
	PostalCode varchar(50),
	Country varchar(50),
	SalesRepEmployeeNumber varchar(50),
	CreditLimit varchar(50),
	);

	bulk insert Customers from 'C:\Users\verit\Desktop\Microsoft Software and Systems Academy_MSSA 2019\Exercises\TSQLExercise6\Customers.csv'
with 
(
	firstrow = 2,
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
);

select * from Customers;
----------------------------------------------------------------------
drop table if exists Employees;

create table Employees (
	EmployeeNumber varchar(50),
	LastName varchar(50),
	FirstName varchar(50),
	Extension varchar(50),
	Email varchar(50),
	OfficeCode varchar(50),
	ReportsTo varchar(50),
	JobTitle varchar(50),
	);

	bulk insert Employees from 'C:\Users\verit\Desktop\Microsoft Software and Systems Academy_MSSA 2019\Exercises\TSQLExercise6\Employees.csv'
with 
(
	firstrow = 2,
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
);

select * from Employees;
-------------------------------------------------------------------
drop table if exists Offices;

create table Offices (
	OfficeCode varchar(50),
	City varchar(50),
	Phone varchar(50),
	AddressLine1 varchar(50),
	AddressLine2 varchar(50),
	StateListed varchar(50),
	Country varchar(50),
	PostalCode varchar(50),
	Territory varchar(50),
	);

	bulk insert Offices from 'C:\Users\verit\Desktop\Microsoft Software and Systems Academy_MSSA 2019\Exercises\TSQLExercise6\Offices.csv'
with 
(
	firstrow = 2,
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
);

select * from Offices;
--------------------------------------------------------------

drop table if exists OrderDetails;

create table OrderDetails (
	OrderNumber varchar(50),
	ProductCode varchar(50),
	QuantityOrdered varchar(50),
	PriceEach varchar(50),
	OrderLineNumber varchar(50),
	);

	bulk insert OrderDetails from 'C:\Users\verit\Desktop\Microsoft Software and Systems Academy_MSSA 2019\Exercises\TSQLExercise6\OrderDetails.csv'
with 
(
	firstrow = 2,
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
);

select * from OrderDetails;
--------------------------------------------------------------

drop table if exists Orders;

create table Orders (
	OrderNumber varchar(50),
	OrderDate varchar(50),
	RequiredDate varchar(50),
	ShippedDate varchar(50),
	CurrentStatus varchar(50),
	Comments varchar(250),
	CustomerNumber varchar(250),
	);

	bulk insert Orders from 'C:\Users\verit\Desktop\Microsoft Software and Systems Academy_MSSA 2019\Exercises\TSQLExercise6\Orders.csv'
with 
(
	firstrow = 2,
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
);

select * from Orders;
--------------------------------------------------------------

drop table if exists Payments;

create table Payments (
	OfficeCode varchar(50),
	City varchar(50),
	Phone varchar(50),
	AddressLine1 varchar(50),
	AddressLine2 varchar(50),
	StateListed varchar(50),
	Country varchar(50),
	PostalCode varchar(50),
	Territory varchar(50),
	);

	bulk insert Payments from 'C:\Users\verit\Desktop\Microsoft Software and Systems Academy_MSSA 2019\Exercises\TSQLExercise6\Payments.csv'
with 
(
	firstrow = 2,
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
);

select * from Payments;
--------------------------------------------------------------

drop table if exists Products;

create table Products (
	ProductCode varchar(300),
	ProductName varchar(50),
	ProductLine varchar(50),
	ProductScale varchar(50),
	ProductVendor varchar(50),
	ProductDescription varchar(max),
	QuantityInStock varchar(max),
	BuyPrice varchar(max),
	MSRP varchar(max),
	);

	bulk insert Products from 'C:\Users\verit\Desktop\Microsoft Software and Systems Academy_MSSA 2019\Exercises\TSQLExercise6\Products.csv'
with 
(
	firstrow = 2,
	datafiletype = 'char',
	fieldterminator = ',',
	rowterminator = '\n'
);

select * from Products;
--------------------------------------------------------------