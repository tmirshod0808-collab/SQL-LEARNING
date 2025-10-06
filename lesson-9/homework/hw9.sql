--1Using Products, Suppliers table List all combinations of product names and supplier names.

select p.productName, s.supplierName from Products p
cross join Suppliers s

--2Using Departments, Employees table Get all combinations of departments and employees.

select *from Departments
select *from Employees


select d.DepartmentName, e.Name from Employees e
cross join Departments d;
--3Using Products, Suppliers table List only the combinations where the supplier actually supplies the product.
--Return supplier name and product name


select s.SupplierName,p.ProductName 
from Suppliers s
join Products p on  s.SupplierID=p.SupplierID

--4Using Orders, Customers table List customer names and their orders ID.

select c.FirstName,o.orderID
from Customers c join
Orders o on c.CustomerID=o.CustomerID

--5Using Courses, Students table Get all combinations of students and courses.

select *from  Students 
cross join Courses

--6sing Products, Orders table Get product names and orders where product IDs match.


select p.productname, o.OrderID  from Products p
inner join  Orders o
on p.ProductID = o.ProductID

--7Using Departments, Employees table List employees whose DepartmentID matches the department.

select e.name,d.Departmentname
from Employees e
inner join Departments d on d.DepartmentID=e.DepartmentID

--8Using Students, Enrollments table List student names and their enrolled course IDs.

select s.name, e.courseID from Students s
inner join Enrollments e on s.StudentID =e.StudentID

--9Using Payments, Orders table List all orders that have matching payments.

select o.OrderID, p.PaymentID
from Orders o
inner join Payments p 
  on o.OrderID = p.OrderID;

--10Using Orders, Products table Show orders where product price is more than 100.

select o.OrderID,p.price from Products p
inner join Orders o on o.ProductID=p.ProductID
where p.price >100

--11Using Employees, Departments table List employee names and department names where department IDs are not equal. 
--It means: Show all mismatched employee-department combinations

select e.name,d.departmentname from employees e 
cross join Departments d
where d.DepartmentID<> e.DepartmentID  

	--12Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.

	select o.quantity,p.stockquantity
	from products p
	inner  join orders o
	on p.ProductID=o.ProductID
	where  o.quantity >p.stockquantity
--13Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.

select c.firstname, s.productID
from customers c
inner join sales s 
on s.CustomerID=c.CustomerID
where SaleAmount >=500

--14Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.

select c.coursename,s.name from Courses c
inner join Enrollments e on c.CourseID=e.CourseID
inner join Students s on s.StudentID=e.StudentID

--15 Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.

select p.productname,s.SupplierName from Products p
inner join  Suppliers s 
on p.SupplierID=s.SupplierID
where SupplierName like ('%Tech%')

--16Using Orders, Payments table Show orders where payment amount is less than total amount.

select p.amount,o.totalamount from Orders o
inner join Payments p on o.OrderID=p.OrderID
where p.amount<o.totalamount 

--17 Using Employees and Departments tables, get the Department Name for each employee.

select d.Departmentname, e.name from Employees e
inner  join Departments d on e.DepartmentID=d.DepartmentID

--18Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.

select p.productname,c.categoryname from Products p
 inner join Categories c on c.categoryID=p.Category
 where CategoryName in('Electronics', 'Furniture')

 --19Using Sales, Customers table Show all sales from customers who are from 'USA'.

 select c.firstname,s.saleamount from Customers c
 inner join Sales s on  s.CustomerID=c.CustomerID
 where Country = 'USA'

 --20Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.

select o.orderID,c.firstname 
from Customers c
inner join Orders o
on o.CustomerID=c.CustomerID
where Country= 'Germany'and TotalAmount>100



--21Using Employees table List all pairs of employees from different departments.
select e1.name,
e1.departmentid,
 e2.name,
e2.departmentid 
from Employees e1
join Employees e2
on e1.name< e2.name
and e1.DepartmentID!=e2.DepartmentID

--22 Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).


SELECT 
    p.PaymentID,
    o.OrderID,
    o.Quantity,
    pr.ProductName,
    pr.Price,
    (o.Quantity * pr.Price) AS ExpectedAmount,
    p.Amount AS PaidAmount
FROM Payments p
JOIN Orders o ON p.OrderID = o.OrderID
JOIN Products pr ON o.ProductID = pr.ProductID
WHERE p.Amount <> (o.Quantity * pr.Price);

--23 Using Students, Enrollments, Courses table Find students who are not enrolled in any course.


SELECT s.StudentID, s.Name
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;

--24Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.

SELECT m.EmployeeID AS ManagerID, 
       m.Name AS ManagerName, 
       m.Salary AS ManagerSalary,
       e.EmployeeID AS EmployeeID, 
       e.Name AS EmployeeName, 
       e.Salary AS EmployeeSalary
FROM Employees e
JOIN Employees m 
     ON e.ManagerID = m.EmployeeID
WHERE m.Salary <= e.Salary;
--25 Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.

SELECT DISTINCT c.CustomerID, 
       c.FirstName, 
       c.LastName
FROM Customers c
JOIN Orders o 
     ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p 
     ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;

