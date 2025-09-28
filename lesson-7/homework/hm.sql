--1Write a query to find the minimum (MIN) price of a product in the Products table.
select min(price) as result  from Products 

--2Write a query to find the maximum (MAX) Salary from the Employees table.

select max(salary) as maxsalary from Employees

--3 Write a query to count the number of rows in the Customers table.
select count(*) as AllRows from Customers

--4 Write a query to count the number of unique product categories from the Products table.

select   count(distinct Category) as UniqueCategory from Products

--5 Write a query to find the total sales amount for the product with id 7 in the Sales table.

select sum(SaleAmount) as result from Sales where ProductID =7

--6Write a query to calculate the average age of employees in the Employees table.
 select AVG(Age) as AvgAge from Employees

 --7Write a query to count the number of employees in each department.

 select count (DepartmentName) numberDEPARTMENTS from Employees

 --8Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.

 SELECT category, min(price),max(price) from Products
 group by category 


 --9Write a query to calculate the total sales per Customer in the Sales table.
 
 select CustomerID, sum (SaleAmount) from Sales
 group by CustomerID

 --10Write a query to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you don't have DeptName).

 select * from Employees

 DepartmentName

 select DepartmentName,  count (*) from Employees
 group by DepartmentName
 having count(*)>5

 --11Write a query to calculate the total sales and average sales for each product category from the Sales table.


select ProductID, sum(saleamount) as SumAmount, avg(saleamount) as AVGSales  from Sales 
group by ProductID

--12 Write a query to count the number of employees from the Department HR.

select DepartmentName, count(*) from Employees
group by DepartmentName
 having DepartmentName ='HR' 


 --13Write a query that finds the highest and lowest Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName).

 select DepartmentName, min (salary) as minsalary , max(salary) as maxsalary from Employees
 group by DepartmentName

 --14Write a query to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).

 select DepartmentName, Avg (salary) as avgsalary from Employees 
 group by DepartmentName

 --15Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you don't have DeptName)se

 select DepartmentName, Avg (salary) as avgsalary, count(* ) from Employees 
 group by DepartmentName

 --16Write a query to filter product categories with an average price greater than 400. 
  
select Category, avg(price) as avgprice from Products
group by Category
having avg (Price)>400


--17Write a query that calculates the total sales for each year in the Sales table.



select year(SaleDate) as yeardate, sum(saleamount) as sumamount from sales
group by year( saledate) 
order by yeardate


--18Write a query to show the list of customers who placed at least 3 orders.


select CustomerID, count(quantity) from orders 
group by CustomerID
having count(quantity)>=3

--19Write a query to filter out Departments with average salary expenses greater than 60000.(DeptID is enough, if you don't have DeptName).

select DepartmentName, avg(Salary) as avgsalary from Employees group by DepartmentName
having avg(Salary) >60000

--20Write a query that shows the average price for each product category, and then filter categories with an average price greater than 150.

select category, avg(price) as AVGPrice from Products
group by category
having avg (price)>150

--21Write a query to calculate the total sales for each Customer, then filter the results to include only Customers with total sales over 1500.


select CustomerID, sum(SaleAmount) as SumAmount from Sales
group by CustomerID 
having sum(SaleAmount)>1500

--22Write a query to find the total and average salary of employees in each department, 
--and filter the output to include only departments with an average salary greater than 65000.

select Departmentname, sum(salary)
as sumsalary, avg(salary)as avgsalary from Employees
group by Departmentname
having avg(salary)>65000

----23Write a query to find total amount for the orders which weights more than $50 for each customer along with their least purchases.
--(least amount might be lower than 50, use tsql2012.sales.orders table,freight col, ask ur assistant to give the TSQL2012 database).

USE TSQL2012;

SELECT 
    custid,
    SUM(CASE WHEN freight > 50 THEN freight ELSE 0 END) AS TotalOver50,
    MIN(freight) AS LeastPurchase
FROM Sales.Orders
GROUP BY custid
ORDER BY custid;




----24Write a query that calculates the total sales and counts unique products sold in each month of each year, 
--and then filter the months with at least 2 products sold.(Orders)


select  month(orderdate)as months,year(orderdate) as yearproduct, sum (TotalAmount)as result, count (distinct ProductID) as uniqueproduct from orders
group by month(OrderDate),YEAR(OrderDate)
having count(distinct ProductID)>=2

--25Write a query to find the MIN and MAX order quantity per Year. From orders table.

select year (orderdate)as orderyear,min(quantity)as minresult, max(quantity) as maxresult from Orders
group by year(orderdate)


