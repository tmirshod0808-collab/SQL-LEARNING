
---1-Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000,
--along with their department names.
----🔁 Expected Columns: EmployeeName, Salary, DepartmentName

select e.Name, e.Salary,d.DepartmentName from Employees e
 join Departments d on  e.DepartmentID=d.DepartmentID
 where e.Salary> 50000
-- --2Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
--🔁 Expected Columns: FirstName, LastName, OrderDate

select  c.FirstName,c.LastName,o.orderdate
from Customers c
join Orders o on  c.CustomerID=o.CustomerID
where OrderDate  between '2023-01-01' and '2023-12-31'
--3Using the Employees and Departments tables, write a query to show all employees along with their department names. 
--Include employees who do not belong to any department.
--🔁 Expected Columns: EmployeeName, DepartmentName


select e.Name,d.DepartmentName from Employees e
left join Departments d on d.DepartmentID=e.DepartmentID

----4 Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. 
--Show suppliers even if they don’t supply any product.
--🔁 Expected Columns: SupplierName, ProductName

select p.ProductName, s.SupplierName from Suppliers s
left  join Products p on s.SupplierID=p.SupplierID

--5 Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. 
--Include orders without payments and payments not linked to any order.
--🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount

select o.OrderID, o.OrderDate,p.PaymentDate,p.Amount from  Orders o
 full outer join   Payments p
on o.OrderID=p.OrderID
--6Using the Employees table, write a query to show each employee's name along with the name of their manager.
--🔁 Expected Columns: EmployeeName, ManagerName

select e1.name as EmployeeName,e2.name as ManagerName  from Employees e1
left join Employees e2 on e1.ManagerID=e2.EmployeeID

--7 Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
--🔁 Expected Columns: StudentName, CourseName



select s.Name,c.CourseName from Courses c
join Enrollments e on  c.CourseID=e.CourseID
join Students s on s.StudentID= e.StudentID
where c.CourseName ='Math 101'
----8 Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items.
--Return their name and the quantity they ordered.
--🔁 Expected Columns: FirstName, LastName, Quantity

select c.FirstName, c.LastName,o.Quantity from Customers c
join Orders o on c.CustomerID = o.CustomerID 
where Quantity > 3

--9Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
--🔁 Expected Columns: EmployeeName, DepartmentName
select e.Name,d.DepartmentName from Employees e
inner join Departments d on e. DepartmentID= d.DepartmentID
where d.DepartmentName = 'Human Resources'

--10Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.
--🔁 Expected Columns: DepartmentName, EmployeeCount
select d.DepartmentName, count(e.DepartmentID) as EmployeeCount
from Employees e inner join Departments d
on e.DepartmentID=d.DepartmentID
group by  d.DepartmentName
having count(e.DepartmentID)> 5


--11Using the Products and Sales tables, write a query to find products that have never been sold.
--🔁 Expected Columns: ProductID, ProductName

select p.ProductID, p.ProductName
 from Products p
left join Sales s
 on s.ProductID=p.ProductID
 where  s.ProductID is null


 --12Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
--🔁 Expected Columns: FirstName, LastName, TotalOrders

select c.FirstName,c.LastName, count(o.OrderID)
as TotalOrders from Customers c inner join Orders o on c.CustomerID=o.CustomerID
group by  c.FirstName,c.LastName

--13 Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
--🔁 Expected Columns: EmployeeName, DepartmentName

select e.name,d.departmentname from  Employees e
inner join Departments d on e.DepartmentID=d.DepartmentID

 --14Using the Employees table, write a query to find pairs of employees who report to the same manager.
--🔁 Expected Columns: Employee1, Employee2, ManagerID

select e1.name as Employee1,e2.name as Employee2, e1.ManagerID from Employees e1 left join Employees e2 
on e1.ManagerID=e2.ManagerID
where e1.EmployeeID<e2.EmployeeID
--15 Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
--🔁 Expected Columns: OrderID, OrderDate, FirstName, LastName
 select o.OrderID,o.OrderDate,c.FirstName,c.LastName from Customers c
 inner join Orders o  on o.CustomerID=c.CustomerID
 where OrderDate between '2022-01-01'and '2022-12-31'
 --16 Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
--🔁 Expected Columns: EmployeeName, Salary, DepartmentName

select e.name,e.salary, d.departmentname
from Employees e inner join Departments d 
on e.DepartmentID=d.DepartmentID
where DepartmentName='Sales' and Salary> 60000

--17Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
------🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
select o.orderid,o.OrderDate,p.PaymentDate, p.Amount from Orders o
inner join Payments p on p.OrderID=o.OrderID

--18Using the Products and Orders tables, write a query to find products that were never ordered.
--🔁 Expected Columns: ProductID, ProductName

select p.productid,p.productname from Products p
left join  Orders o on o.ProductID=p.ProductID
where o.ProductID is null 

--19 Using the Employees table, write a query to find employees whose salary is greater than the average salary in their own departments.
--🔁 Expected Columns: EmployeeName, Salary

select 
a.Name as EmployeeName, 
a.salary 
from Employees a
where a.salary >
(
select 
avg(salary) as avgSalary
from Employees b
where 
b.departmentid = a.departmentid)
--20Using the Orders and Payments tables, write a query to list all orders placed 
--before 2020 that have no corresponding payment.
--🔁 Expected Columns: OrderID, OrderDate

select o.OrderID,o.OrderDate from Orders o
left join  Payments p  on p.OrderID=o.OrderID
where o.OrderDate < '2020-01-01' and  p.OrderID is null 

--21Using the Products and Categories tables, write a query to return products that do not have a matching category.
--🔁 Expected Columns: ProductID, ProductName

select p.ProductID,p.ProductName from Products p
left  join Categories c
on p.Category=c.CategoryID
where c.CategoryID is null

--22Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
--🔁 Expected Columns: Employee1, Employee2, ManagerID, Salary

select e1.name as Employee1,e2.name as Employee2, e1.ManagerID, e1.salary 
from Employees e1   join Employees e2 
on e1.ManagerID=e2.ManagerID
and e1.EmployeeID<e2.EmployeeID
where e2.salary >60000
and e1.Salary> 60000

----23Using the Employees and Departments tables, write a query to return employees who work in departments 
--which name starts with the letter 'M'.
--🔁 Expected Columns: EmployeeName, DepartmentName

select e.name as EmployeeName,d.departmentname from Employees e inner join Departments d
on d.DepartmentID=e.DepartmentID
where d.DepartmentName like ('M%')
----24 Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, 
--including product names.
--🔁 Expected Columns: SaleID, ProductName, SaleAmount

select s.saleid, p.productname,s.saleamount from Products p
join sales s on s.ProductID=p.ProductID
where s.SaleAmount >500

--25Using the Students, Courses, and Enrollments tables, write a query to find
--students who have not enrolled in the course 'Math 101'.
--🔁 Expected Columns: StudentID, StudentName

select s.studentID,s.name from Students s
left join  Enrollments e on s.StudentID=e.StudentID
left join  Courses c on c.CourseID=e.CourseID
where c.CourseName !='Math 101'

----26Using the Orders and Payments tables, write a query to return orders that are missing payment details.
--🔁 Expected Columns: OrderID, OrderDate, PaymentID

select o.orderID,o.orderdate,p.paymentID from Orders o
left  join  Payments p on o.OrderID=p.OrderID
where p.OrderID is null 
--27ing the Products and Categories tables, write a query to list products
--that belong to either the 'Electronics' or 'Furniture' category.
--🔁 Expected Columns: ProductID, ProductName, CategoryName

select p.productID,p.productname,c.categoryname
from Products p
join Categories c 
on  p.Category=c.CategoryID
where c.CategoryName  in('Electronics' , 'Furniture') 
