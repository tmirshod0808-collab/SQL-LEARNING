
--1Using Products table, find the total number of products available in each category.

select* from Products

select category , count (productname) as totalproducts from Products
group by category 

--2Using Products table, get the average price of products in the 'Electronics' category.

select  avg (price) as AvgPrice from Products 
where Category= 'Electronics'

--3Using Customers table, list all customers from cities that start with 'L'.

select *  from Customers
where City like( 'L%')

--4 Using Products table, get all product names that end with 'er'. 
select * from Products
where ProductName like ('%er')

-- 5 Using Customers table, list all customers from countries ending in 'A'.

select * from Customers 
where country like ('%A')

--6 Using Products table, show the highest price among all products.

select max(price) as maxprice from Products 

--7Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
select * from Products

select iif (StockQuantity< 30, 'Low Stock', 'Sufficient') from Products

--8Using Customers table, find the total number of customers in each country.
select * from Customers
select country, count (customerid) from Customers
group by country

--9Using Orders table, find the minimum and maximum quantity ordered.

select min(quantity), max(quantity) from Orders 

--10 Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.


select * from Orders
select * from Invoices

select distinct o.customerID from Orders o
where o.OrderDate between '2023.01.01' and '2023.01.31'
 and not exists
 
(
 select 1
 from Invoices i
 where i.customerid=o.customerid)




--11Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.

select Productname from  Products
union all 
select Productname from  Products_Discounted
--12Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.

select Productname from  Products
union  
select Productname from  Products_Discounted 

--13Using Orders table, find the average order amount by year.


select year(orderdate) OrderYear, avg (TotalAmount) AVGamount from Orders
group by year(orderdate)

--14Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.


select ProductName, Price ,
case
 when  price <100 then 'Low'
 when price  between 100 and 500 then 'Mid' 
 else 'High' 
 end as pricegroup 
 from Products


 --15 Using City_Population table, use Pivot to show values of Year column in seperate columns 
 --([2012], [2013]) and copy results to a new Population_Each_Year table.

 select district_id , district_name, [2012], [2013] into Population_Each_Year
 from
 (select district_id , district_name, population, year from City_Population) as Population_Each_Year

pivot 
( sum(population) for year in  ([2012], [2013])) as pivotTable

--16 Using Sales table, find total sales per product Id

select * from Sales
select ProductID, sum( saleAmount) as totalsale
from Sales
group by ProductID

--17 Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.

select * from Products where productname like ('%oo%')

--18 Using City_Population table, use Pivot to show values of City column 
--in seperate columns (Bektemir, Chilonzor, Yakkasaroy) and copy results to a new Population_Each_City table.


 select
 district_id,
 year,
 [Bektemir], [Chilonzor], [Yakkasaroy] 
 into Population_Each_City
 from ( 
 select district_id, district_name,population,year from City_Population) as ble 
 pivot(
 sum(population) for district_name in([Bektemir], [Chilonzor], [Yakkasaroy])) as pvt

 --19Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.

 select  top 3 CustomerID, sum (totalAmount) as Totalspent
 from Invoices
 group by CustomerID 
 order by Totalspent desc
	--20Transform Population_Each_Year table to its original format (City_Population).

select district_id,
district_name,
year,
population
from Population_Each_Year
unpivot (
population for year in ([2012], [2013])) as unpvt

--21 Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)

select * from Products
select * from Sales

select p.ProductName, count(s.SaleID) as times 
from Products p
inner join Sales s on p.ProductID=s.ProductID
group by p.ProductName

--22Transform Population_Each_City table to its original format (City_Population).

select district_id,
district_name,
year,
population
from Population_Each_City
unpivot (
population for district_name in ([Bektemir], [Chilonzor], [Yakkasaroy])) as unpvt 



