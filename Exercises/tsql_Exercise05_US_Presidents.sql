--Name: TSQL Exercise 6_ Altering Table
--Author: Derek Cobb
--Date: August 5, 2019

---------------------------------------------------------------------------
drop table if exists US_Presidents;
--1.
Create table US_Presidents (
ID int,
Last_Name varchar(100),
First_Name varchar(100),
Middle_Name varchar(100),
Order_of_Presidency varchar(100),
Date_of_Birth varchar(100),
Date_of_Death varchar(100),
Town_or_County_of_Birth varchar(100),
State_of_Birth varchar(100),
Home_State varchar(100),
Party_Affiliation varchar(100),
Date_Took_Office varchar(100),
Date_Left_Office varchar(100),
Assassination_Attempt varchar(100),
Assassinated varchar(100),
Religious_Affiliation varchar(100),
Image_Path varchar(100));

select * from US_Presidents;

--2.
bulk insert US_Presidents
from 'C:\Users\verit\ISTA420\Labs\USPresidentsISTA220.csv'  ----pay attention to the data file type
WITH (
firstrow = 2,  --- have to set firstrow equal to '2' because the first row consists of column headings
datafiletype = 'char',
rowterminator = '\n',
fieldterminator = ',');

select * from US_Presidents;

--3.
ALTER TABLE US_Presidents DROP COLUMN Image_Path;

--5.
UPDATE US_Presidents
SET Date_Left_Office = '1/20/2017', Assassination_Attempt = 'FALSE', Assassinated = 'FALSE' 
WHERE ID = 44;

select * from US_Presidents;

--6.
INSERT INTO US_Presidents (ID, Last_Name, First_Name, Middle_Name, Order_of_Presidency, Date_of_Birth, Town_or_County_of_Birth, State_of_Birth, Home_State, Party_Affiliation, Date_Took_Office, Assassination_Attempt, Religious_Affiliation)
Values ('45','Trump', 'Donald','John','45','6/14/1946','Queens','New York','New York','Republican','1/20/2017','FALSE','Presbyterian');

select * from US_Presidents;

--7.
SELECT Home_State, Party_Affiliation, Count(Party_Affiliation) AS Party_Total FROM US_Presidents Group by Home_State, Party_Affiliation;

select * from US_Presidents;

--8.
SELECT Last_Name, First_Name, datediff(day, Date_Took_Office, Date_Left_Office) AS DaysInOffice
From US_Presidents;

--9.
SELECT Last_Name, First_Name, datediff(year, Date_of_Birth, Date_Took_Office) AS AgeTookOffice
From US_Presidents;

--10.
SELECT Religious_Affiliation, Party_Affiliation, Count(Religious_Affiliation) AS Religion_Total, Count(Party_Affiliation) AS Party_Total 
FROM US_Presidents Group by Party_Affiliation, Religious_Affiliation;
--There appears to be no correlation between political party and religious affilitation.
