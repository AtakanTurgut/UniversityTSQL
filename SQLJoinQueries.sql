/********************* SQL JOIN **********************/
use AdventureWorksDW2019
/******************** INNER JOIN *********************/
select * from FactInternetSales, DimCustomer

select DC.FirstName, SUM(FIS.SalesAmount) as 'After2014'
	from FactInternetSales as FIS, DimCustomer as DC 
	where FIS.CustomerKey = DC.CustomerKey AND FIS.OrderDate > '2014-01-01'
	GROUP BY DC.FirstName

select DC.FirstName, SUM(FIS.SalesAmount) as 'After2014'
	from FactInternetSales as FIS INNER JOIN DimCustomer as DC 
	ON (FIS.CustomerKey = DC.CustomerKey AND FIS.OrderDate > '2014-01-01')
	GROUP BY DC.FirstName

select DC.FirstName, DCY.CurrencyName, SUM(FIS.SalesAmount) as 'Total'
	from FactInternetSales as FIS INNER JOIN DimCustomer as DC 
	ON (FIS.CustomerKey = DC.CustomerKey AND FIS.OrderDate > '2014-01-01')
	INNER JOIN DimCurrency as DCY ON FIS.CurrencyKey = DCY.CurrencyKey
	GROUP BY DC.FirstName, DCY.CurrencyName

/******************** LEFT JOIN *********************/
select FIS.SalesAmount, DP.EnglishProductName 
	from FactInternetSales as FIS LEFT JOIN DimProduct as DP 
	ON FIS.ProductKey = DP.ProductKey

select FIS.SalesAmount, DP.EnglishProductName, DST.SalesTerritoryCountry
	from FactInternetSales as FIS LEFT JOIN DimProduct as DP 
	ON FIS.ProductKey = DP.ProductKey
	LEFT JOIN DimSalesTerritory as DST ON FIS.SalesTerritoryKey = DST.SalesTerritoryKey

select SUM(FIS.SalesAmount) as 'Total', DP.EnglishProductName, DST.SalesTerritoryCountry
	from FactInternetSales as FIS LEFT JOIN DimProduct as DP 
	ON FIS.ProductKey = DP.ProductKey
	LEFT JOIN DimSalesTerritory as DST ON FIS.SalesTerritoryKey = DST.SalesTerritoryKey
	GROUP BY DP.EnglishProductName, DST.SalesTerritoryCountry

/******************* FULL OUTER JOIN *********************/
-- Merge multiple tables.
select * from FactInternetSales as FIS
	FULL OUTER JOIN DimSalesTerritory as DST
	ON FIS.SalesTerritoryKey = DST.SalesTerritoryKey

/********************* CROSS JOIN *********************/
-- Cartesian Multiplication
select EnglishProductName from DimProduct
select FirstName from DimCustomer

select COUNT(EnglishProductName) from DimProduct	-- 606 rows
select COUNT(FirstName) from DimCustomer			-- 18.484 rows
select 606 * 18484

select P.EnglishProductName, C.FirstName from DimProduct as P
	CROSS JOIN DimCustomer as C						-- 11.201.304 rows

/*************** EXCEPT - INTERSECT - UNION ALL *****************/
-- EXCEPT : Fark Kümesi
-- INTERSECT : Kesiþim Kümesi
-- UNION : Birleþim Kümesi
select DISTINCT ProductKey from FactInternetSales
	where OrderDate > '2013-01-01'	
EXCEPT
select DISTINCT ProductKey from FactInternetSales
	where OrderDate < '2013-01-01'
--
select DISTINCT ProductKey from FactInternetSales
	where OrderDate > '2013-01-01'	
INTERSECT
select DISTINCT ProductKey from FactInternetSales
	where OrderDate < '2013-01-01'
--
select DISTINCT ProductKey from FactInternetSales
	where OrderDate > '2013-01-01'			-- 102 rows
UNION ALL							-- 221 rows
select DISTINCT ProductKey from FactInternetSales
	where OrderDate < '2013-01-01'			-- 119 rows