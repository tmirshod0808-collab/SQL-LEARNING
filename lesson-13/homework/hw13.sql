--1You need to write a query
--that outputs "100-Steven King", meaning emp_id + first_name + last_name in that format using employees table.

select concat (employee_id,'-',first_name,' ',last_name) as info from Employees

----2Update the portion of the phone_number in the employees table,
--within the phone number the substring '124' will be replaced by '999'
update Employees
set PHONE_NUMBER= replace(phone_number,'124','999')

----3 Display the first name and the length of the first name
--for all employees whose name starts with the letters 'A', 'J' or 'M'.
--Give each column an appropriate label. Sort the results by the employees' first names.(Employees)


select  first_name,len(first_name) as lengthname from Employees
where FIRST_NAME like('A%') or FIRST_NAME like('J%')or FIRST_NAME like('M%') 
order by first_name 

--4 Write an SQL query to find the total salary for each manager ID.(Employees table)

 select 
 manager_id, 
 sum (SALARY)
 from Employees
 group by manager_id



 --5 Write a query to retrieve the year and the highest value 
 --from the columns Max1, Max2, and Max3 for each row in the TestMax table
 select * from TestMax

 select  year1,  greatest(Max1, Max2, Max3)  from TestMax 


 --6 Find me odd numbered movies and description is not boring.(cinema)

 select  id,movie,description from cinema
 where id % 2=1
 and description not like('%boring%')

select * from cinema

----7 You have to sort data based on the Id but Id with 0 should always be the last row. 
--Now the question is can you do that with a single order by column.(SingleOrder)
 select  * from SingleOrder

select id, vals
   from SingleOrder
ORDER BY (case when id = 0 then 1 else 0 end ),id
 


--8 Write an SQL query to select the first non-null value from a set of columns. 
--If the first column is null, move to the next, and so on. If all columns are null, return null.(person)

select id, coalesce(ssn,passportid,itin) as result 
from person 
--                                  medium task 
--1 Split column FullName into 3 part ( Firstname, Middlename, and Lastname).(Students Table)

SELECT 
StudentID, 
LEFT(FullName, CHARINDEX(' ', FullName) -1)AS FirstName, 
SUBSTRING(FullName, CHARINDEX(' ', FullName) +1, CHARINDEX(' ', FullName,
CHARINDEX(' ', FullName)+ 1) - CHARINDEX(' ', FullName)-1) AS MiddleName, 
SUBSTRING(FullName, CHARINDEX(' ', FullName, CHARINDEX(' ', FullName)+1)+1, LEN (FullName)) AS LastName,
Grade 
FROM Students

--2For every customer that had a delivery to California, 
--provide a result set of the customer orders that were delivered to Texas. (Orders Table)


 select * from Orders

  select customerID, DeliveryState  
from Orders
where DeliveryState = 'TX'
and CustomerID in (
    select CustomerID  
    from Orders
    where DeliveryState = 'CA'
);


--3Write an SQL statement that can group concatenate the following values.(DMLTable)

select STRING_AGG( concat(sequenceNumber,'-',string),',')as result from DMLTable
--4 Find all employees whose names (concatenated first and last) contain the letter "a" at least 3 times.

 select FullName=FIRST_NAME+LAST_NAME from Employees
 where concat(FIRST_NAME,' ',LAST_NAME) like '%a%a%a%'

 --5 The total number of employees in each department 
 --and the percentage of those employees who have been with the company for more than 3 years(Employees)
 select * from Employees



                                               --dificult task
											   
--1 Write an SQL query that replaces each row with the sum of its value and the previous rows' value. (Students table)
select * from Students

SELECT StudentID,FullName,SUM(Grade)OVER(ORDER BY StudentID) AS RunningTotal FROM Students

--2Given the following dataset, find the students that share the same birthday.(Student Table)

 WITH DuplicateCTE AS (
SELECT 
StudentName, 
Birthday,
COUNT(*) OVER (PARTITION BY Birthday ) AS BirthdateCount
FROM Student 
)
SELECT 
StudentName, 
Birthday
FROM DuplicateCTE
WHERE BirthdateCount > 1
  

  ----3 You have a table with two players (Player A and Player B) and their scores. 
  --If a pair of players have multiple entries, aggregate their scores into a single row for each unique pair of players. 
  --Write an SQL query to calculate the total score for each unique player pair(PlayerScores)

 select *
 from PlayerScores




 ----4Write an SQL query that separates the uppercase letters, lowercase letters, numbers,
 --and other characters from the given string 'tf56sd#%OqH' into separate columns.

