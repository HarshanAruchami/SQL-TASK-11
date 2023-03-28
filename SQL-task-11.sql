create database task11

use task11

/*1. Show the working of PIVOT and UNPIVOT by creating a table students(sid,sname,department,yearofcompletion) with 20 records.*/

--TABLE CREATION
Create table students(sid int identity(1,1),sname varchar(20),department varchar(20), yearofcompletion int) 
--TABLE INSERTION
insert into students 
values('Harshan','IT',2023),
('vasanth','CT',2024),
('vikram','CT',2024),
('karthi','IT',2023),
('harita','CT',2023),
('ranCTa','IT',2024),
('hari','CT',2023),
('hemanth','CT',2024),
('Yamini','IT',2023),
('sharon','IT',2023),
('vignesh','CT',2024),
('venkCT','CT',2023),
('dhana','IT',2024),
('selva','CT',2023),
('divyaprakash','IT',2024),
('harishmCTha','IT',2023),
('arun','CT',2024),
('srikanth','IT',2024),
('dharsan','IT',2024),
('siva','CT',2023)
--SELECT QUERY
select * from students;
--TRUNCATE TABLE
truncate table students;
--DROP TABLE
drop table students;
--Note: Simplify the table to show the number of students in each department and categorize them based on yearofcompletion.*/
select department,yearofcompletion,no_of_stud from 
(select department,[2023],[2024] from
(SELECT department,yearofcompletion FROM students ) AS Table1    
pivot
(
count(yearofcompletion)for yearofcompletion in ([2023],[2024])
)pivot_tbl)as p_tbl
--Perform UNPIVOT Operation  
UNPIVOT    
(    
no_of_stud FOR yearofcompletion IN ([2023], [2024])    
)Up_tbl  

/*2. Create a database for Library Management. Analyse the required columns, perform a normalization and link the tables using primary and foreign key (using on update set default)
Note: Kindly do the task on your own.*/
--CREATE DATABASE
create database library_management 
--USE DATABASE
use library_management
--TABLE CREATION --PARENT TABLE
create table students(stu_id int primary key,stu_name varchar(20)UNIQUE,stu_class int)
--TABLE INSERTION
insert into students values(101,'HARSHAN',11),(102,'HEMANTH',12),(103,'SHARON',11),(104,'KARTHI',12),(105,'SHIVA',11)
--SELECT QUERY
select * from students
--TRUNCATE TABLE
truncate table staff
---------------------------------------------------------------------------------------------------------------------------
--TABLE CREATION --PARENT TABLE
create table staff(staff_id int primary key,staff_name varchar(20))
--TABLE INSERTION
insert into staff values(1,'KARTHICKSHIVA'),(2,'SURYA'),(3,'NANDHA'),(4,'RAM'),(5,'THARUN')
--SELECT QUERY
select * from staff
--TRUNCATE TABLE
truncate table staff
---------------------------------------------------------------------------------------------------------------------------
--TABLE CREATION --CHILD TABLE
create table library(stu_id int references students(stu_id), staff_id int references staff(staff_id))
--TABLE INSERTION
insert into library values(101,1),(102,2),(103,3),(104,4),(105,5)
--SELECT QUERY
select * from library