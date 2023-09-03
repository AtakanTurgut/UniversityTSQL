/********************* SQL Functions ************************/
use AdventureWorksDW2019
/******************* String  Functions **********************/
-- concatenation, substring, left, right etc...
-- column merge
select (FirstName + ' ' + LastName) as 'Customer' from DimCustomer

-- substring : SUBSTRING('Ahmet', 2, 4) = 'hmet'
select SUBSTRING(FirstName, 1, 3) as FirstThree from DimCustomer

-- left : LEFT('Ahmet', 3) = 'Ahm'
select LEFT(FirstName, 3) as FirstThree from DimCustomer

-- right : RIGHT('Ahmet', 3) = 'met'
select RIGHT(FirstName, 3) as LastThree from DimCustomer

-- LOWER : Lower Case
-- UPPER : Upper Case
select UPPER(FirstName) as UPPERCASE, LOWER(FirstName) as lowercase from DimCustomer

-- Left Trim : LTRIM(column_name) -> '  Ahmet' =>  LTRIM('  Ahmet') = 'Ahmet'
-- Right Trim : RTRIM(column_name) -> 'Ahmet  ' =>  LTRIM('Ahmet  ') = 'Ahmet'

select FirstName, LEN(FirstName) as Name_Length from DimCustomer

-- Replace : Change values
select FirstName, REPLACE(FirstName, 'Jon', 'Sumon') as Change_Name from DimCustomer

-- Reverse : It gives reverse output.
select FirstName, REVERSE(FirstName) as Reverse_Name from DimCustomer

/***************** Mathematical Function ********************/
-- abs, sum, avg, min, max, count etc...
select -1*CurrencyKey as 'NegativeCurrency' from FactInternetSales
select ABS(-1*CurrencyKey) as 'PositiveCurrency' from FactInternetSales

select TaxAmt from FactInternetSales
select CEILING(TaxAmt) as Upper_Bound from FactInternetSales
select FLOOR(TaxAmt) as Lower_Bound from FactInternetSales
select ROUND(TaxAmt, 2) as rounded from FactInternetSales
select SQRT(TaxAmt) as square_root from FactInternetSales
select POWER(TaxAmt, 2) as square_power from FactInternetSales
select POWER(TaxAmt, 3) as cube_power from FactInternetSales
select SUM(TaxAmt) as Total from FactInternetSales
select AVG(TaxAmt) as Average from FactInternetSales
select MAX(TaxAmt) as Max_TaxAmt from FactInternetSales
select MIN(TaxAmt) as Min_TaxAmt from FactInternetSales
select (TaxAmt % 2) as mod2_TaxAmt from FactInternetSales

select COUNT(CustomerKey) as CustomerKeyCount from FactInternetSales
select COUNT(DISTINCT(CustomerKey)) as CustomerKeyJust1Count from FactInternetSales

/******************** Date Function ***********************/
-- time, month, year etc...
select GETDATE()
-- int
select DATEPART(YEAR, GETDATE())
select DATEPART(MONTH, GETDATE())
select DATEPART(DAY, GETDATE())
select DATEPART(WEEK, GETDATE())
select DATEPART(HOUR, GETDATE())
select DATEPART(MINUTE, GETDATE())
select DATEPART(SECOND, GETDATE())
select DATEPART(QUARTER, GETDATE())
-- nvarchar
select DATENAME(YEAR, GETDATE())
select DATENAME(MONTH, GETDATE())
select DATENAME(DAY, GETDATE())
select DATENAME(WEEK, GETDATE())
select DATENAME(WEEKDAY, GETDATE())
select DATENAME(DAYOFYEAR, GETDATE())

select DATEDIFF(YEAR, '2001-12-12', GETDATE())	-- (type, n, m) = m - n
select DATEDIFF(MONTH, '2001-12-12', GETDATE())
select DATEDIFF(DAY, '2001-12-12', GETDATE())
select DATEDIFF(WEEK, '2001-12-12', GETDATE())

select SalesAmount, OrderDate, ShipDate from FactInternetSales 
	where DATEPART(YEAR, OrderDate) = 2011
	AND DATEPART(MONTH, OrderDate) = 12

select OrderDate, ShipDate, DATEDIFF(DAY, OrderDate, ShipDate) from FactInternetSales 

/****************** Conversion Function ********************/
-- cast, convert etc...
select CAST(3.14 * 10.5643 AS numeric(10, 2))
select CAST(3.14 * 10000000.5643 AS numeric(12, 4))

select CAST('852' AS numeric(11, 2))
select CAST('DENÝZLÝ' AS char(5))

select CONVERT(nvarchar(20), GETDATE(), 1)
select CONVERT(nvarchar(20), GETDATE(), 2)
select CONVERT(nvarchar(20), GETDATE(), 3)	-- ...
