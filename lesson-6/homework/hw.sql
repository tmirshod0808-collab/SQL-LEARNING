Input table (InputTbl):

| col1 | col2 |
|------|------|
| a    | b    |
| a    | b    |
| b    | a    |
| c    | d    |
| c    | d    |
| m    | n    |
| n    | m    | */

--Question: Explain at least two ways to find distinct values based on two columns.
CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);
    INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');

select distinct * from InputTbl
select * from 
(select col1,col2 from InputTbl 
union
select col2,col1 from InputTbl) as result 
where col1<col2 

select distinct 
case when col1<col2 then col1 else col2 end as col1,
case when col1<col2 then col2 else col1 end as col2 from InputTbl


--2: Removing Rows with All Zeroes
--Question: If all the columns have zero values, then don’t show that row. In this case, we have to remove the 5th row while selecting data.

CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);


	select* from TestMultipleZero where (A+B+C+D)<>0


	--3 Find those with odd ids
	create table section1(id int, name varchar(20))
insert into section1 values (1, 'Been'),
       (2, 'Roma'),
       (3, 'Steven'),
       (4, 'Paulo'),
       (5, 'Genryh'),
       (6, 'Bruno'),
       (7, 'Fred'),
       (8, 'Andro')

	   select * from section1
	   where id % 2=1 
--4  Person with the smallest id
	   select top 1 * from section1  order by id  

	   --5Person with the highest id 
	   select top 1 * from section1
	   order by  id desc
--6  People whose name starts with b
 select * from section1
 where name  like ('B%')

 --7: Write a query to return only the rows where the code contains the literal underscore _ (not as a wildcard).

 CREATE TABLE ProductCodes (
    Code VARCHAR(20)
);

INSERT INTO ProductCodes (Code) VALUES
('X-123'),
('X_456'),
('X#789'),
('X-001'),
('X%202'),
('X_ABC'),
('X#DEF'),
('X-999');


 select * from ProductCodes
 where code like ( '%\_%') escape '\'





