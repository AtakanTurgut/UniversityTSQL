/************************* Data Manipulation Language (DML) *****************************/
use AdventureWorksDW2019
/*************************  SELECT  *****************************/
select * from dbo.dimdate 
select DayNumberOfWeek, EnglishDayNameOfWeek from dbo.dimdate 
select DD.DayNumberOfWeek as 'DayNum', DD.EnglishDayNameOfWeek as 'DAY' from dbo.dimdate as DD

select SUM(ft.UnitPrice) from dbo.FactInternetSales as ft
select AVG(ft.UnitPrice) from dbo.FactInternetSales as ft

/*************************  WHERE  *****************************/
select * from dbo.FactInternetSales where ProductKey = 222 AND CurrencyKey = 19 AND CustomerKey = 21652
select * from dbo.FactInternetSales where ProductKey = 310 OR ProductKey = 330
select * from DimProduct where EnglishProductName = 'Adjustable Race'
select * from DimProduct where EnglishProductName IN ('Adjustable Race', 'Bearing Ball', 'Blade')
select * from DimProduct where EnglishProductName LIKE 'A%' AND ProductKey > 100
select * from DimProduct where EnglishProductName NOT LIKE 'A%' AND ProductKey > 100

/***********************  INSERT INTO  ***************************/
select * from DimAccount
insert into DimAccount VALUES (17, 207, 207, 'Balance Sheet My Version', 'Assets', '+', NULL, 'Currency', NULL)
insert into DimAccount VALUES (17, 112, 112, 'Balance Sheet My Version', 'Assets', '+', NULL, 'Currency', NULL)
insert into DimAccount VALUES (17, 2014, 2014, 'Balance Sheet My Version', 'Assets', '+', NULL, 'Currency', NULL)

/*************************  UPDATE  *****************************/
--UPDATE table_name SET column1 = "value1", column2 = "value2", column3 = "value3" WHERE conditions
select * from DimEmployee
UPDATE DimEmployee SET LastName = 'Mustia' where EmployeeKey = 1
UPDATE DimEmployee SET LastName = 'Rocketel', MiddleName = 'Jr.' where ParentEmployeeKey = 112

/********************  DISTINCT - ORDER BY (ASC -DESC)  ************************/
-- Singular values in the column.
select * from DimAccount
select * from DimAccount ORDER BY AccountDescription
select * from DimAccount ORDER BY AccountDescription DESC, AccountKey ASC
select DISTINCT ParentAccountCodeAlternateKey from DimAccount

/***********************  Change Columns Name  ***************************/
select [AccountDescription], [AccountType], ([AccountDescription] + ' - ' + [AccountType]) as 'Description of Account Type' from DimAccount
select AccountKey, AccountDescription, (CAST(AccountKey as varchar) + ' - ' + AccountDescription) as 'Description of Account Key' from DimAccount
select AccountCodeAlternateKey, (AccountCodeAlternateKey + 1000) as 'New Alternate Key' from DimAccount

/**********************  Comparison Operators  **************************/
/* 
	(), =, <, >, <=, >=, <>, !=	
	AND : salary < 8000 AND position = 'Engineer'
	OR  : salary < 8000 OR position = 'Engineer'
	NOT : NOT name = 'Atakan'
*/
select * from DimEmployee where ParentEmployeeKey = 18 AND HireDate > '2009-01-01'
select * from DimEmployee where (ParentEmployeeKey = 18 AND HireDate > '2009-01-01') OR MiddleName != 'B'
select * from DimEmployee where (ParentEmployeeKey = 18 OR HireDate > '2009-01-01') AND FirstName NOT IN('Guy','Annik')
select * from DimEmployee where ParentEmployeeKey BETWEEN 18 AND 50		--ParentEmployeeKey >= 18 AND ParentEmployeeKey <= 50

select * from DimEmployee where FirstName LIKE 'y%'		-- Names with the first character 'y'.
select * from DimEmployee where FirstName LIKE '_u%'	-- Names with the second character 'u'.
select * from DimEmployee where FirstName LIKE '[AD]%'	-- Names with the first character 'A' and 'D'.
select * from DimEmployee where FirstName LIKE '[A-D]%' ORDER BY FirstName	-- Names with the first character 'A' to 'D'.

select * from DimEmployee where EmployeeKey LIKE '[19]'		-- Employee Key  with the 1 and 9.
select * from DimEmployee where EmployeeKey LIKE '[1-9]'	-- Employee Key  with the 1 to 9.
select * from DimEmployee where EmployeeKey LIKE '[19]%'	-- Employee Key  with the first number 1 and 9.

select * from DimEmployee where MiddleName IS NULL
select * from DimEmployee where MiddleName IS NOT NULL

/*************************  GROUP BY  *****************************/
select ProductKey, CurrencyKey, COUNT(SalesAmount) as 'Count', SUM(SalesAmount) as 'Total' 
	from FactInternetSales
	where (CurrencyKey > 10) AND (ProductKey > 600)  
	GROUP BY ProductKey, CurrencyKey
	HAVING ProductKey > 604
	ORDER BY CurrencyKey DESC