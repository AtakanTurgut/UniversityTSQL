/************************* Data Definition Language (DDL) *****************************/
/************************* CREATE DATABASE *****************************/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = 1000000KB, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TestDB_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )

/*************************  CREATE TABLE  *****************************/
use TestDB

create table STUDENTS(
	StudentId int NOT NULL PRIMARY KEY,
	StudentName varchar(25),
	Courses varchar(25)
)

create table EMPLOYEES(
	EmployeeId int NOT NULL PRIMARY KEY,
	EmployeeName varchar(255),
	EmployeeSurname varchar(255),
	EmployeeDepartment varchar(255)
)
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [StudentId]
      ,[StudentName]
      ,[Courses]
  FROM [TestDB].[dbo].[STUDENTS]

/****************** CONSTRAINTS (Kýsýtlamalar) **********************/
/*
Null, Not Null,
Default,
Primary Key, Foreign Key,
Check,
Unique
*/
create table Products (
	ProductId int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	ProductName varchar(255) DEFAULT('Other Products'),
	ProductPrice int CHECK(ProductPrice >= 0),
	ProductDiscount int CHECK(ProductDiscount <= 0),
	ProductSerialNumber int,
	UNIQUE(ProductSerialNumber)
)

/************************ FOREIGN KEY ****************************/
create table SalesTable(
	SalesId int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	SalesHeader nvarchar(25),
	CustomerBankType nvarchar(30)
)

create table SalesDetailTable(
	SalesDetailId int IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	SalesId int FOREIGN KEY REFERENCES SalesTable(SalesId),
	ProductName varchar(25),
	Quantity int,
	Price int,
	LineNumber int
)

/************************** ALTER ******************************/
--ALTER TABLE table_name ADD, DROP COLUMN, ALTER COLUMN
alter table dbo.EMPLOYEES ADD UNIQUE(EmployeeName)

alter table dbo.EMPLOYEES DROP COLUMN EmployeeDepartment

alter table dbo.EMPLOYEES ALTER COLUMN EmployeeSurname nvarchar(15)
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmployeeId]
      ,[EmployeeName]
      ,[EmployeeSurname]
  FROM [TestDB].[dbo].[EMPLOYEES]

/*************************** DROP *******************************/
drop table dbo.STUDENTS
--drop database TestDB

truncate table dbo.EMPLOYEES	-- Data is irreversibly deleted.