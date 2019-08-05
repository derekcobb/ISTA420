/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [custid]
      ,[companyname]
      ,[contactname]
      ,[contacttitle]
      ,[address]
      ,[city]
      ,[region]
      ,[postalcode]
      ,[country]
      ,[phone]
      ,[fax]
  FROM [TSQLV4].[Sales].[Customers]

  select max(custid) from sales.customers;