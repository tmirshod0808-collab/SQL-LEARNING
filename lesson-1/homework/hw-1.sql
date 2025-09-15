create database homework1
use homework1
 --data is facts and statistics collected together for reference or analisis
 --database is a structured set of data held in a computer, especially one that is accessible in various ways
 --relational database is thata database structured to recognize relations between stored items of information
 --tabel is  a table is a fundamental database object used to store data in a structured format within a relational database

 --High Availability and Disaster Recovery (Always On):
 --Advanced Security
 --Intelligent Query Processing and Performance Optimization
 --Business Intelligence and Analytics Tools
 --Scalability and Flexibility

-- SQL Server supports two primary authentication modes, which dictate how users are authenticated when connecting to the server:
--Windows Authentication Mode
--Mixed Mode (SQL Server and Windows Authentication Mode)

--create database StudentIDB
--USE StudentIDB
drop table if exists students 
CREATE table students (ID int , name varchar (50), age bigint)
insert into students values  (1,'mirshod',23 ),(2,'fedya',20),(3,'bek',15)
select * from students 


--SQL Server: is the database engine that stores and manages data.
--SSMS: is the tool used to interact with and manage SQL Server. 
--SQL: is the language used to communicate with SQL Server and perform operations on the data it contains. You use SSMS to write and execute SQL code against a SQL Server instance

--Data Definition Language (DDL):
--Purpose: Defines or modifies the structure of database objects (e.g., tables, views, indexes).
--Examples: CREATE, ALTER, DROP, TRUNCATE.
--Characteristic: Auto-committed, meaning changes are permanent and cannot be rolled back.
-- Data Manipulation Language (DML):
--Purpose: Manipulates the data stored within the database objects.
--Examples: INSERT, UPDATE, DELETE.
--Characteristic: Not auto-committed; changes can be rolled back using TCL commands.
-- Data Query Language (DQL):
--Purpose: Retrieves data from the database.
--Examples: SELECT.
--Characteristic: Does not modify data or structure; solely for querying information.
-- Data Control Language (DCL):
--Purpose: Controls access and permissions to the database and its objects.
--Examples: GRANT, REVOKE.
--Characteristic: Manages user privileges and security.
--. Transaction Control Language (TCL):
--Purpose: Manages transactions, ensuring data integrity and consistency.
--Examples: COMMIT, ROLLBACK, SAVEPOINT.
--Characteristic: Used in conjunction with DML commands to either finalize or undo changes within a transaction.

-- - download AdventureWorksDW2022.bak file from :https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak
---- Step2 - save this AdventureWorksDW2022.bak file to C:\ disk
---- Step3 - open SQL
---- Step4 - open "Databases" folder in Object Explorer
---- Step5 - select Restore Database...
---- Step6 - choose Device and click ... button, click Add, choose AdventureWorksDW2022.bak file and click ok
---- Step7 - back to Object Explorer, click Refresh

    
