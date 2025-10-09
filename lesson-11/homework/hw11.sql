--1Return: OrderID, CustomerName, OrderDate
--Task: Show all orders placed after 2022 along with the names of the customers who placed them.
--Tables Used: Orders, Customers

select o.orderID,c.firstname as customername,o.orderdate from Orders o
join  Customers c on o.CustomerID=c.CustomerID
where o.OrderDate> '2022-12-31'
--2Return: EmployeeName, DepartmentName
--Task: Display the names of employees who work in either the Sales or Marketing department.
--Tables Used: Employees, Departments
select e.name as EmployeeName,d.DepartmentName from Employees e join 
Departments d on d.DepartmentID=e.DepartmentID
where d.DepartmentName in('Sales' , 'Marketing')

--3Return: DepartmentName, MaxSalary
--Task: Show the highest salary for each department.
--Tables Used: Departments, Employees

select d.DepartmentName,e.maxsalary from Departments d
cross apply (select  top 1 max(salary)as maxsalary from Employees e
where e.DepartmentID=d.DepartmentID) as e 

 --4Return: CustomerName, OrderID, OrderDate
--Task: List all customers from the USA who placed orders in the year 2023.
--Tables Used: Customers, Orders

select c.FirstName,c.LastName, o.OrderID,o.OrderDate from customers c
cross apply (
select OrderID,OrderDate from Orders o
where o.CustomerID=c.CustomerID 
and 
year(OrderDate)=2023) as o
where c.country='USA'

	--5Return: CustomerName, TotalOrders
	--Task: Show how many orders each customer has placed.
	--Tables Used: Orders , Customers

	select c.firstname as CustomerName, o.TotalOrders
	from Customers c
	cross apply (
	 select count(*) as  TotalOrders 
	from orders o
	where c.CustomerID=o.CustomerID
	) as o

	--6Return: ProductName, SupplierName
--Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
--Tables Used: Products, Suppliers

select p.ProductName,s.SupplierName
from Products p
join
Suppliers s 
on 
s.SupplierID=p.SupplierID
where SupplierName in ('Gadget Supplies' , 'Clothing Mart')

-- 7Return: CustomerName, MostRecentOrderDate
--Task: For each customer, show their most recent order. Include customers who haven't placed any orders.
--Tables Used: Customers, Orders

select c.firstname as CustomerName,
o.MostRecentOrderDate
from Customers c
outer apply (
select max(orderdate) as MostRecentOrderDate 
from Orders o
where c.CustomerID=o.CustomerID
) as o

----8Return: CustomerName, OrderTotal
--Task: Show the customers who have placed an order where the total amount is greater than 500.
--Tables Used: Orders, Customers

select c.firstname as CustomerName,
		o.TotalAmount as OrderTotal
		from Customers c
join
		Orders o
on	o.CustomerID=c.CustomerID
where  TotalAmount> 500

--9Return: ProductName, SaleDate, SaleAmount
--Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
--Tables Used: Products, Sales

select p.productname,
		s.saledate,
		s.saleamount 
from Products p
join  Sales s
on  s.ProductID=p.ProductID
where year(s.SaleDate)=2022 or s.SaleAmount > 400

--10Return: ProductName, TotalSalesAmount
--Task: Display each product along with the total amount it has been sold for.
--Tables Used: Sales, Products

select p.ProductName,s.TotalSalesAmount
from Products p
cross apply (
select sum (saleamount) as TotalSalesAmount 
from Sales s  
where s.ProductID=p.ProductID) as s
	
	--11Return: EmployeeName, DepartmentName, Salary
--Task: Show the employees who work in the HR department and earn a salary greater than 60000.
--Tables Used: Employees, Departments
select e.name as EmployeeName,
d.DepartmentName,e.salary
from Employees e
join Departments d 
on d.DepartmentID=e.DepartmentID
where d.DepartmentName ='Human Resources' and e.Salary>60000

--12 Return: ProductName, SaleDate, StockQuantity
--Task: List the products that were sold in 2023 and had more than 100 units in stock at the time.
--Tables Used: Products, Sales

select p.ProductName,s.SaleDate,p.StockQuantity
from Products p
join  Sales s
on s.ProductID=p.ProductID
where year(s.SaleDate)=2023 and p.StockQuantity > 100

--13 Return: EmployeeName, DepartmentName, HireDate
--Task: Show employees who either work in the Sales department or were hired after 2020.
--Tables Used: Employees, Departments

select e.name as EmployeeName,d.DepartmentName,e.HireDate from Employees e
join Departments d
on d.DepartmentID=e.DepartmentID
where d.DepartmentName = 'sales' or  year (e.HireDate)>2020

--14 Return: CustomerName, OrderID, Address, OrderDate
--Task: List all orders made by customers in the USA whose address starts with 4 digits.
--Tables Used: Customers, Orders

select c.firstname as CustomerName,o.orderid,
c.Address,o.orderdate from Customers c
join Orders o 
on o.customerid=c.customerid
where Country ='usa' and Address like ('[0-9][0-9][0-9][0-9]%')

--15 Return: ProductName, Category, SaleAmount
--Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.
--Tables Used: Products, Sales
 select p.productname,p.category,
 s.saleamount from Products p
 join Sales s 
 on s.ProductID=p.ProductID
 where Category=1  or SaleAmount> 350

-- --16 Return: CategoryName, ProductCount
--Task: Show the number of products available in each category.
--Tables Used: Products, Categories

select c.CategoryName,p.ProductCount 
from Categories c
cross apply (
 select count(p.ProductID) as ProductCount  
 from     Products p        
where c.CategoryID=p.Category) as p

--17Return: CustomerName, City, OrderID, Amount
--Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.
--Tables Used: Customers, Orders

select c.firstname as CustomerName,
c.city,
o.orderid,
o.totalamount as Amount
from Customers c
inner join  Orders o
on o.CustomerID=c.CustomerID
where c.City= 'Los Angeles' and o.TotalAmount >300


----18 Return: EmployeeName, DepartmentName
--Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
--Tables Used: Employees, Departments
select e.name as EmployeeName,d.DepartmentName
from Employees e
join Departments d 
on e.DepartmentID=d.DepartmentID
where d.DepartmentName in ('Human Resources' , 'Finance')
and e.Name like 

  
--19Return: EmployeeName, DepartmentName, Salary
--Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
--Tables Used: Employees, Departments


select e.name as EmployeeName,d.DepartmentName,e.Salary 
from Employees e
join Departments d 
on e.DepartmentID=d.DepartmentID
where d.DepartmentName in ('Sales' , 'Marketing')
and e.Salary>60000

