


--Bulk insert is the way of importing file which exist in yor computer  you shoul copy path of the  file  and past to sql 

--CSV (.csv)

--Comma-Separated Values

--Ma’lumotlar vergul bilan ajratilgan bo‘ladi.

--Text (.txt)

--Oddiy matn fayli

--Ma’lumotlar satrma-satr yoki belgi bilan ajratilgan bo‘ladi.

--Excel (.xls, .xlsx)

--Jadval ko‘rinishidagi fayl

--SQL Server Import Wizard yoki OPENROWSET bilan yuklanadi.

--XML (.xml)

--Structured ma’lumotlar

--OPENXML, XML bulk load yoki INSERT ... SELECT bilan yuklanadi

create table Products
(productid int primary key,
productname varchar (50),
price decimal (10,2));

insert into Products ( productid, productname,price)
values (1,'TV',1500000),
(2,'COMPUTER',10000000),
(3,'lamp',12000);
 select *from Products


--null is the column can be left empty.
--not null is the column cannot be left empty. you should write the value

alter table Products 
add Unique (productname)

select *from Products  -- this means select all values from table Products 

alter table Products 
add CategoryID int 


create table Categories (CategoryID int primary key, CategoryName varchar unique);


--IDENTITY is that if you enter identity to int (1,1) it will count autmatically  and order the values with their order

bulk insert emails
from'C:\Users\ACER\Documents\emails.txt'
with (
firstrow=2,   
fieldterminator= ',',
rowterminator='\n');

select *from emails
select * from Categories

alter table Products 
 add CategoryID int
  

  alter table Products 
  add FOREIGN  key (CategoryID) references Categories (CategoryID);

--PRIMARY KEY → main ID of the table

--UNIQUE KEY → must be unique but can be NULL


alter table Products
add check (Price > 0);

alter table Products
add Stock int not null default 0;

UPDATE Products
SET Price = 0
WHERE Price IS NULL;


select* from Products


CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Email NVARCHAR(100),

    -- CHECK constraint to ensure age is 18 or older
    CONSTRAINT CHK_Customers_Age CHECK (Age >= 18)
);

--Create a table with an IDENTITY column starting at 100 and incrementing by 10.

create table Laptops(
id int identity (100,10)primary key,
categories varchar (40));
 insert into Laptops (categories) values ('HP'),('lenova'),('acer');

select*from Laptops

--Write a query to create a composite PRIMARY KEY in a new table OrderDetails.

create table OrderDetails

 ( ProductID INT NOT NULL,
  OrderID INT NOT NULL,   Quantity VARCHAR(25),

    CONSTRAINT OrderDetails PRIMARY KEY (ProductID, OrderID));

--	ISNULL

--Takes only 2 arguments.

--If the first one is NULL, it returns the second one.
--COALESCE

--Can take two or more arguments.

--It goes from left to right and returns the first non-NULL value.


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,              -- Primary Key on EmpID
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,         -- Unique Key on Email
    HireDate DATE NOT NULL DEFAULT GETDATE ()
);


