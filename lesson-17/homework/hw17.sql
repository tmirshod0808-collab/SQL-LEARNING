
DROP TABLE IF EXISTS #RegionSales;
GO
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);

----You must provide a report of all distributors and their sales by region. 
--If a distributor did not have any sales for a region, rovide a zero-dollar 
--value for that day. Assume there is at least one sale for each region
----SQL Setup:

select * from Employee

--Find managers with at least five direct reports
--SQL Setup:

CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255),
managerId INT);
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);


select e1.name, count(e1.id) as asmanager
 from Employee e1
 join Employee e2
 on e1.id=e2.managerId
 group by e1.name
 having count(e1.id)>=5




CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);

 --3 Write a solution to get the names of products that have at least 100 units 
 --ordered in February 2020 and their amount.


  WITH cteunits AS (
  SELECT product_id, SUM(unit) AS total_units
  FROM Orders
  WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
  GROUP BY product_id
  HAVING SUM(unit) >= 100
)
SELECT p.product_name, c.total_units
FROM Products p
JOIN cteunits c
ON p.product_id = c.product_id;



--SQL Setup:

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');

--4  Write an SQL statement that returns the vendor from which each 
--customer has placed the most orders
WITH ctevendor AS (
  SELECT 
    CustomerID,
    Vendor,
    COUNT(*) AS order_count
  FROM Orders
  GROUP BY CustomerID, Vendor
)
SELECT 
  CustomerID,
  Vendor
FROM ctevendor
WHERE order_count = (
  SELECT MAX(order_count)
  FROM ctevendor c2
  WHERE c2.CustomerID = ctevendor.CustomerID
);
--5 

CREATE FUNCTION dbo.IsPrime (@Check_Prime INT)
RETURNS NVARCHAR(50)
AS 
BEGIN 
IF @Check_Prime < 2
RETURN 'THIS IS NOT A PRIME NUMBER '

IF @Check_Prime = 2
RETURN 'THIS IS A PRIME NUMBER'

IF @Check_Prime % 2 = 0
RETURN 'THIS IS NOT A PRIME NUMBER'

DECLARE @DEVISOR INT = 3
WHILE @DEVISOR * @DEVISOR <=@Check_Prime
BEGIN 
IF @Check_Prime % @DEVISOR = 0 
RETURN 'THIS IS NOT A PRIME NUMBER'
SET @DEVISOR = @DEVISOR + 2 
END 
RETURN 'THIS IS A PRIME NUMBER'
END;

DECLARE @Check_Prime INT = 91;
SELECT dbo.IsPrime(@Check_Prime) AS NumberType;


CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');

--6 Write an SQL query to return the number of locations,
--in which location most signals sent, and total number of signal for 
--each device from the given table.






WITH LocationCount AS (
    SELECT 
        Locations,
        COUNT(*) AS SignalCount
    FROM Device
    GROUP BY Locations
),
TopLocation AS (
    SELECT TOP 1 
        Locations, 
        SignalCount
    FROM LocationCount
    ORDER BY SignalCount DESC
)
SELECT 
    (SELECT COUNT(DISTINCT Locations) FROM Device) AS TotalLocations,
    (SELECT Locations FROM TopLocation) AS MostActiveLocation,
    (SELECT SignalCount FROM TopLocation) AS MostSignals,
    Device_id,
    COUNT(*) AS TotalSignalsByDevice
FROM Device
GROUP BY Device_id;

--77. Write a SQL to find all Employees who earn more than the
--average salary in their corresponding department. Return EmpID,
--EmpName,Salary in your output


CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);

SELECT
EmpID,
EmpName, 
Salary,
A.DeptID
FROM Employee AS A
CROSS JOIN 
(SELECT 
  AVG(B.Salary) AvgSalaryPerDepartment, 
  B.DeptID
FROM Employee AS B
GROUP BY B.DeptID) AS B
WHERE A.DeptID <> B.DeptID
AND A.Salary > AvgSalaryPerDepartment;



--8. You are part of an office lottery pool where you
----keep a table of the winning lottery numbers along with a
----table of each ticket’s chosen numbers. If a ticket has some 
----but not all the winning numbers, you win $10.
----If a ticket has all the winning numbers, you win $100. 
----Calculate the total winnings for today’s drawing.
Winning Numbers:

|Number|
--------
|  25  |
|  45  |
|  78  |

Tickets:

| Ticket ID | Number |
|-----------|--------|
| A23423    | 25     |
| A23423    | 45     |
| A23423    | 78     |
| B35643    | 25     |
| B35643    | 45     |
| B35643    | 98     |
| C98787    | 67     |
| C98787    | 86     |
| C98787    | 91     |

-- Step 1: Create the table
CREATE TABLE Numbers (
    Number INT
);

-- Step 2: Insert values into the table
INSERT INTO Numbers (Number)
VALUES
(25),
(45),
(78);


-- Step 1: Create the Tickets table
CREATE TABLE Tickets (
    TicketID VARCHAR(10),
    Number INT
);

-- Step 2: Insert the data into the table
INSERT INTO Tickets (TicketID, Number)
VALUES
('A23423', 25),
('A23423', 45),
('A23423', 78),
('B35643', 25),
('B35643', 45),
('B35643', 98),
('C98787', 67),
('C98787', 86),
('C98787', 91);


WITH Matched AS (
    SELECT 
        t.TicketID,
        COUNT(*) AS MatchedCount
    FROM Tickets t
    INNER JOIN Numbers n 
        ON t.Number = n.Number
    GROUP BY t.TicketID
),

Prize AS (
    SELECT 
        TicketID,
        CASE 
            WHEN MatchedCount = 3 THEN 100   -- All 3 numbers matched
            WHEN MatchedCount > 0 THEN 10    -- Some but not all matched
            ELSE 0                           -- No matches
        END AS Winnings
    FROM Matched
)

SELECT SUM(Winnings) AS TotalWinnings
FROM Prize;


----9. The Spending table keeps the logs of the spendings history of users 
--that make purchases from an online shopping website which has a desktop and a mobile devices.
--Write an SQL query to find the total number of users and the total amount spent 
--using mobile only, desktop only and both mobile and desktop together for each date.
SQL Setup:

CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);


WITH PlatformSummary AS (
    SELECT 
        Spend_date,
        User_id,
        SUM(CASE WHEN Platform = 'Mobile' THEN Amount ELSE 0 END) AS Mobile_Spent,
        SUM(CASE WHEN Platform = 'Desktop' THEN Amount ELSE 0 END) AS Desktop_Spent
    FROM Spending
    GROUP BY Spend_date, User_id
),
CategorySummary AS (
    SELECT
        Spend_date,
        CASE 
            WHEN Mobile_Spent > 0 AND Desktop_Spent > 0 THEN 'Both'
            WHEN Mobile_Spent > 0 THEN 'Mobile'
            WHEN Desktop_Spent > 0 THEN 'Desktop'
        END AS Platform,
        (Mobile_Spent + Desktop_Spent) AS Amount
    FROM PlatformSummary
)
SELECT
    Spend_date,
    Platform,
    SUM(Amount) AS Total_Amount,
    COUNT(DISTINCT User_id) AS Total_Users
FROM CategorySummary
GROUP BY Spend_date, Platform
ORDER BY Spend_date, 
         CASE 
            WHEN Platform = 'Mobile' THEN 1
            WHEN Platform = 'Desktop' THEN 2
            WHEN Platform = 'Both' THEN 3
         END;


	--10
WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL SELECT 2
    UNION ALL SELECT 3
    UNION ALL SELECT 4
    UNION ALL SELECT 5
),


Expanded AS (
    SELECT 
        g.Product,
        1 AS Quantity
    FROM Grouped g
    JOIN Numbers n 
      ON n.n <= g.Quantity
)


SELECT Product, Quantity
FROM Expanded
ORDER BY Product;

































