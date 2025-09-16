create database Employees

use Employees;
create table employees(
empid INT,
NAME VARCHAR (50),
SALARY DECIMAL(10,2));

INSERT INTO employees (empid,name,salary)
values(1, 'aziz',10000000),(2,'umid',250000),(3,'sardor',500000)
select*from employees
delete from employees
INSERT INTO employees (empid,name,salary)
values(1, 'aziz',10000000),(2,'umid',250000),(3,'sardor',500000)
update employees
set salary = 7000
where empid = 1
delete from employees
where empid=2

--DELETE → row-level removal

--TRUNCATE → all rows, keep table

--DROP → remove table entirely
alter table employees
alter column name varchar(100)
alter table employees
add  Department varchar (50)

alter table employees
alter column salary float

create table Departments (departmentid int primary key,departmentname varchar(50));
truncate table employees
;
insert into departments(departmentid, departmentname)
values (1,'HR'),(2,'SALES'),(3,'FINANCE'),(4,'DIRECTOR'),(5,'IT')
select *from Departments

update Employees
set department='Management'
where Salary > 5000

delete from Employees


alter table Employees
drop column department

EXEC sp_rename 'Employees', 'StaffMembers';
drop table Departments


	create table Products (ProductID  bigint Primary Key, ProductName VARCHAR(50), Category VARCHAR(50), Price DECIMAL(10,2));

	alter table products 
	add check (Price > 0);

	alter table products 
	add StockQuantity int default (50);

	EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

	insert into Products(ProductID,ProductName,ProductCategory,Price)  values(1, 'computer','technology',1500000),(2, 'phone','technology',1000000),(3, 'table','device',500000),(4, 'blackboard','instrument',120000),(5, 'lamp','technology',5000);

	SELECT * FROM Products;
	drop table Products





	
	create table Products (ProductID  bigint Primary Key, ProductName VARCHAR(50), Category VARCHAR(50), Price DECIMAL(10,2));

	alter table products 
	add check (Price > 0);

	alter table products 
	add StockQuantity int default (50);

	EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN';

	insert into Products(ProductID,ProductName,ProductCategory,Price)  values(1, 'computer','technology',1500000),(2, 'phone','technology',1000000),(3, 'table','device',500000),(4, 'blackboard','instrument',120000),(5, 'lamp','technology',5000);

	SELECT * FROM Products;

	select* into Products_Backup from Products;
	select *from Products_Backup

	EXEC sp_rename 'Products','Inventory'
alter table inventory 
alter column Price Float;
alter table inventory 
add ProductCode int identity (1000, 5);
		
