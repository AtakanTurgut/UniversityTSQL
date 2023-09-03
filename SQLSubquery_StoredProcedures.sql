use AdventureWorksDW2019
/****************** SQL Subquery ********************/
select ProductKey, EnglishProductName from DimProduct
	where EnglishProductName IN ('Bearing Ball', 'Adjustable Race')

select ProductKey, EnglishProductName from DimProduct
	where EnglishProductName IN
		(select EnglishProductName from DimProduct where ProductKey > 20)

select * from DimProduct
	where SafetyStockLevel > (select AVG(SafetyStockLevel) from DimProduct)

select EnglishProductName, FIS.SalesAmount, 
	Total = (select SUM(SalesAmount) from FactInternetSales)
	from DimProduct as DP
	RIGHT JOIN FactInternetSales as FIS ON DP.ProductKey = FIS.ProductKey

select DP.EnglishProductName, 
	Total = (select SUM(SalesAmount) from FactInternetSales where DP.ProductKey = FactInternetSales.ProductKey)
	from DimProduct as DP
	RIGHT JOIN FactInternetSales as FIS ON DP.ProductKey = FIS.ProductKey

/****************** Stored Procedures ********************/
-- AdventureWorksDW2019  ==>  Programmability  ==>  Stored Procedures
CREATE PROC sp_GetAllFactInternetSales
AS 
BEGIN
	select * from FactInternetSales
END;

EXEC dbo.sp_GetAllFactInternetSales

CREATE PROC sp_WithParameters
(
	@ProductId int,
	@CustomerId int,
	@CurrencyId int
)
AS
BEGIN
	select * from FactInternetSales
		where ProductKey = @ProductId AND CustomerKey = @CustomerId AND CurrencyKey = @CurrencyId
END;

select * from FactInternetSales
EXEC dbo.sp_WithParameters 310, 21768, 19 