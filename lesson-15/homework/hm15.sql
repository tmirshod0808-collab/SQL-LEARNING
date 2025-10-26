--1 Find Employees with Minimum Salary
--Task: Retrieve employees who earn the minimum salary in the company. Tables: employees (columns: id, name, salary)

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);



select * from employees
where salary = ( 
select min(salary)
from employees)


--2. Find Products Above Average Price
--Task: Retrieve products priced above the average price. Tables: products (columns: id, product_name, price)


CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);


select * from products
where price > (
select AVG(price)
from products)

-- Nested Subqueries with Conditions
--3. Find Employees in Sales Department Task: Retrieve employees who work in the "Sales" department. 
--Tables: employees (columns: id, name, department_id), departments (columns: id, department_name)

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);




select e.name,e.id, (
select d.department_name
from departments d
where d.id=e.department_id ) FROM employees e
where e.department_id=(
select id from departments
where department_name='sales') 



--4. Find Customers with No Orders
--Task: Retrieve customers who have not placed any orders. Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);




select * from customers c
where not exists(
select 1 
from orders o
where o.customer_id=c.customer_id)


drop table products

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);

--5. Find Products with Max Price in Each Category
--Task: Retrieve products with the highest price in each category.
--Tables: products (columns: id, product_name, price, category_id)

select * from products p1
where price = (
 select max(price)
 from products p2
  where p1.category_id=p2.category_id)




CREATE TABLE departments15 (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees15 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments15 (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employees15 (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);



--6. Find Employees in Department with Highest Average Salary
--Task: Retrieve employees working in the department with the highest average salary.
--Tables: employees (columns: id, name, salary, department_id), departments (columns: id, department_name)


select e.name,e.salary,d.department_name
from employees15 e
join departments15 d 
on e.department_id=d.id
where e.department_id=(
select top 1 department_id
from employees15
group by department_id
order by avg(salary)desc)



CREATE TABLE employees2 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees2(id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);

--7. Find Employees Earning Above Department Average
--Task: Retrieve employees earning more than the average salary in their department. 
--Tables: employees (columns: id, name, salary, department_id)

select * from employees2 a
where salary > (
select avg(b.salary)
from employees2 b
where a.department_id=b.department_id)


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);


--8. Find Students with Highest Grade per Course
--Task: Retrieve students who received the highest grade in each course. 
--Tables: students (columns: student_id, name), grades (columns: student_id, course_id, grad

select s.name,g.grade,g.course_id from students s
join  grades g
on g.student_id=s.student_id
where g.grade= (
select max(grade)
from grades
where course_id=g.course_id)


CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);

select * from products
--9. Find Third-Highest Price per Category Task: 
--Retrieve products with the third-highest price in each category.
--Tables: products (columns: id, product_name, price, category_id)
SELECT id, product_name, price, category_id
FROM (
    SELECT 
        id,
        product_name,
        price,
        category_id,
        DENSE_RANK() OVER (
            PARTITION BY category_id 
            ORDER BY price DESC
        ) AS price_rank
    FROM products
) ranked
WHERE price_rank = 3;



select  top 3 category_id,price from products
group by  category_id, price

select * from products
where exists





CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);


--10. Find Employees whose Salary Between Company Average and Department Max Salary
--Task: Retrieve employees with salaries above the company average 
--but below the maximum in their department.
--Tables: employees (columns: id, name, salary, department_id)


select * from employees e1
where e1.salary >(
select AVG(salary)
from employees)
and e1.salary <(
select max(salary)
from employees e2
where e1.department_id=e2.department_id)

